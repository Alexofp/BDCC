extends "res://Scenes/SceneBase.gd"

var actionID = ""
var action:SlaveActionBase

var mainSlave = ""
var pickedSlaves = {}

var lastSelectedSlave = ""

var pickingForRole = ""
var resultText = ""

func _init():
	sceneID = "SlaveStartActionScene"

func resolveCustomCharacterName(_charID):
	if(_charID == "npc"):
		return mainSlave
	if(pickedSlaves.has(_charID)):
		return pickedSlaves[_charID]
		

func _initScene(_args = []):
	actionID = _args[0]
	action = GlobalRegistry.getSlaveAction(actionID)
	if(_args.size() > 1):
		mainSlave = _args[1]
		lastSelectedSlave = mainSlave
	
func _run():
	if(state == ""):
		if(lastSelectedSlave != ""):
			playAnimation(StageScene.Duo, "stand", {npc=lastSelectedSlave})
		else:
			playAnimation(StageScene.Solo, "stand")
		
		var actionCanStartInfo = action.checkCanDoFinal(mainSlave, pickedSlaves)
		if(actionCanStartInfo[0]):
			addButton("Start!", "Do the action", "do_the_action")
		elif(actionCanStartInfo.size() > 1):
			addDisabledButton("Start!", actionCanStartInfo[1])
		else:
			addDisabledButton("Start!", "Conditions for this action aren't met!")
		addButtonAt(14, "Cancel", "You changed your mind", "endthescene_cancel")
		
		sayn("Action: "+action.getVisibleName())
		if(mainSlave != ""):
			sayn("Main slave: "+getCharacter(mainSlave).getName())
		
		var extraSlavesInfo = action.extraSlaves
		for slaveRoleID in extraSlavesInfo:
			var extraSlaveEntry = extraSlavesInfo[slaveRoleID]
			if(pickedSlaves.has(slaveRoleID)):
				sayn(extraSlaveEntry["name"]+": "+getCharacter(pickedSlaves[slaveRoleID]).getName())
			else:
				sayn(extraSlaveEntry["name"]+": NOT SELECTED")
		
			addButton(extraSlaveEntry["name"], extraSlaveEntry["desc"], "pick_extra_menu", [slaveRoleID])
		
	if(state == "pick_extra_menu"):
		saynn("Who do you want to pick?")
		
		var slaves = GM.main.getDynamicCharacterIDsFromPool(CharacterPool.Slaves)
		var filteredSlaves = []
		for charID in slaves:
			if(charID == mainSlave):
				continue
			if(pickedSlaves.values().has(charID)):
				continue
				
			# Add all the extra checks here
			if(!action.fitsAsExtraSlave(pickingForRole, charID)):
				continue
				
			filteredSlaves.append(charID)
		
		for charID in filteredSlaves:
			var character:DynamicCharacter = getCharacter(charID)
			
			addButton(character.getName(), "Pick them!", "do_pick_extra", [character])
		addButton("Back", "Go up to the previous menu", "")
	
	if(state == "do_the_action"):
		saynn(resultText)
		
		addButton("Continue", "See what happens next", "endthescene_happened")
		
		var theAction:SlaveActionBase = action
		if(theAction != null):
			var extraActions = theAction.getExtraActions(mainSlave, pickedSlaves)
			for actionInfo in extraActions:
				var args = []
				if(actionInfo.has("args")):
					args = actionInfo["args"]
				var buttonChecks = []
				if(actionInfo.has("buttonChecks")):
					buttonChecks = actionInfo["buttonChecks"]
				addButtonWithChecks(actionInfo["name"], actionInfo["desc"], "do_extra_action", [theAction, actionInfo, args], buttonChecks)

		
func _react(_action: String, _args):
	if(_action == "endthescene_happened"):
		endScene([false])
		return
	if(_action == "endthescene_cancel"):
		endScene([false])
		return
	
	if(_action == "pick_extra_menu"):
		pickingForRole = _args[0]
	
	if(_action == "do_pick_extra"):
		pickedSlaves[pickingForRole] = _args[0].getID()
		lastSelectedSlave = pickedSlaves[pickingForRole]
		setState("")
		return
		
	if(_action == "do_the_action"):
		if(action.sceneID != ""):
			runScene("SlaveActionWrapperScene", [action.id, mainSlave, pickedSlaves])
			endScene([action.endsTalkScene])
			return
		
		var result = action.doActionSimpleFinal(mainSlave, pickedSlaves)
		if(result.has("text")):
			resultText = result["text"]
		else:
			resultText = "An action happened!"
		#action.playAnimation(mainSlave, pickedSlaves)

	if(_action == "do_extra_action"):
		#var action:SlaveActionBase = _args[0]
		var actionInfo = _args[1]
		var theArgs = _args[2]
		
		endScene([true])
		runScene(actionInfo["sceneID"], [mainSlave, pickedSlaves, theArgs])
		return

	setState(_action)


func saveData():
	var data = .saveData()
	
	data["actionID"] = actionID
	data["mainSlave"] = mainSlave
	data["pickedSlaves"] = pickedSlaves
	data["lastSelectedSlave"] = lastSelectedSlave
	data["pickingForRole"] = pickingForRole
	data["resultText"] = resultText
	
	return data
	
func loadData(data):
	.loadData(data)
	
	actionID = SAVE.loadVar(data, "actionID", "")
	action = GlobalRegistry.getSlaveAction(actionID)

	mainSlave = SAVE.loadVar(data, "mainSlave", "")
	pickedSlaves = SAVE.loadVar(data, "pickedSlaves", {})
	lastSelectedSlave = SAVE.loadVar(data, "lastSelectedSlave", "")
	pickingForRole = SAVE.loadVar(data, "pickingForRole", "")
	resultText = SAVE.loadVar(data, "resultText", "")
