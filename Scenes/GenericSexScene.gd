extends "res://Scenes/SceneBase.gd"

var sexEngine:SexEngine
var currentCategory = []

func _init():
	sceneID = "GenericSexScene"
	showFightUI = true

func _initScene(_args = []):
	sexEngine = SexEngine.new()
	sexEngine.setInventoryToUse(sceneSavedItemsInv)
	
	var tops = _args[0]
	var bottoms = _args[1]
	if(tops is String):
		tops = [tops]
	if(bottoms is String):
		bottoms = [bottoms]
	
	for top in tops:
		if(top != "pc"):
			addCharacter(top)
	for bottom in bottoms:
		if(bottom != "pc"):
			addCharacter(bottom)
	
	sexEngine.initPeople(tops, bottoms)
	if(_args.size() > 2):
		var typeargs = {}
		if(_args.size() > 3):
			typeargs = _args[3]
		sexEngine.initSexType(_args[2], typeargs)
	else:
		sexEngine.initSexType(SexType.DefaultSex)
	
	sexEngine.start()

func _run():
	if(state == ""):
		setCharactersEasyList(sexEngine.getCharIDList())
		sexEngine.playAnimation()
		saynn(sexEngine.getFinalOutput())
		
		if(!sexEngine.hasSexEnded()):
			if(sexEngine.isDom("pc")):
				addExtraButtonAt(4, "END SEX", "Enough fun for now", "stopsex")
			else:
				addExtraButtonAt(4, "QUICK SEX", "Simulate the sex for a while until it ends", "simulatesex")
			var canSelectTarget:bool = sexEngine.canSwitchPCTarget()
			if(canSelectTarget):
				addExtraButtonAt(3, "TARGET", "Switch the target of your new activities", "switchtarget")
			
			var canToggleDynJoiners:bool = sexEngine.canToggleDynamicJoiners()
			if(canToggleDynJoiners):
				if(sexEngine.didPCAllowDynamicJoiners()):
					addExtraButton("Disallow joiners", "Disallow people around you from dynamically joining the sex.", "toggle_dynamic_join")
				else:
					addExtraButton("Allow joiners", "Allow people around you to join the sex.", "toggle_dynamic_join")
			
			if(sexEngine.canChooseDomAutonomy()):
				if(!sexEngine.isDomAutonomyEnabled()):
					addExtraButton("Enable dom autonomy", "Allow other doms to do things with the sub", "toggle_dom_autonomy")
				else:
					addExtraButton("Disable dom autonomy", "Disallow other doms to do things with the sub", "toggle_dom_autonomy")
			
			if(currentCategory != []):
				addButton("Back", "Back to the previous menu", "backbutton")
				if(GM.ui.getCurrentPage() > 0):
					addExtraButton("Back", "Back to the previous menu", "backbutton")
			
				
			var theTargetID:String = sexEngine.getPCTarget()
			for domID in sexEngine.getDoms():
				var domInfo = sexEngine.getDomInfo(domID)
				sayn(domInfo.getInfoStringFinal(canSelectTarget && theTargetID==domID))
			for subID in sexEngine.getSubs():
				var subInfo = sexEngine.getSubInfo(subID)
				sayn(subInfo.getInfoStringFinal(canSelectTarget && theTargetID==subID))
			sayn("")

			var theActions := sexEngine.getActionsForCharID("pc", true)
			for actionInfo in theActions:
				var actionCategory = []
				if("category" in actionInfo):
					actionCategory = actionInfo["category"]
				
				if(currentCategory == actionCategory):
					var desc = "No description provided"
					if(actionInfo.has("desc")):
						desc = actionInfo["desc"]
					if(actionInfo.has("chance") && actionInfo["chance"] != null):
						desc = "Success chance: "+str(Util.roundF(actionInfo["chance"], 1))+"%\n"+desc
					addButton(actionInfo["name"], desc, "doAction", [actionInfo])
			
			addCategoryButtons(theActions)
			
			#addButton("Process", "Process", "processTurn")
		
		else:
			if(sexEngine.canKeepItemsAfterSex()):
				var itemNames = []
				var itemsCanRecover = sexEngine.getRecovarableItemsAfterSex()
				for item in itemsCanRecover:
					itemNames.append(item.getVisibleName())
				
				saynn("There are some items that you can recover ("+Util.join(itemNames, ", ")+"). Otherwise, they will stay where they are.")
				
				addButton("Recover items", "Recover the items", "recoverandleave")
				addButton("LEAVE", "Just leave", "endthescene")
			else:
				addButton("LEAVE", "The sex has ended", "endthescene")

func _react(_action: String, _args):
	if(_action == "stopsex"):
		sexEngine.endSex()
		return
	
	if(_action == "toggle_dom_autonomy"):
		sexEngine.toggleDomAutonomy()
		if(sexEngine.isDomAutonomyEnabled()):
			addMessage("Other doms now have action autonomy.")
		else:
			addMessage("Other doms won't do any new actions anymore.")
		return
	
	if(_action == "toggle_dynamic_join"):
		sexEngine.toggleDynamicJoiners()
		if(sexEngine.didPCAllowDynamicJoiners()):
			addMessage("Pawns around you might decide to join now.")
		else:
			addMessage("Pawns around you will no longer join.")
		return
	
	if(_action == "recoverandleave"):
		sexEngine.keepItemsAfterSex()
		endScene([sexEngine.getSexResult()])
		return
	
	if(_action == "simulatesex"):
		var turns = 100
		while(!sexEngine.hasSexEnded() && turns > 0):
			turns -= 1
			sexEngine.doAction({id="auto"})
			processTime(60)
			updateDomsAndSubs()
		sexEngine.endSex()
		return
	
	if(_action == "doAction"):
		currentCategory = []
		sexEngine.doAction(_args[0])
		processTime(60)
		#updateDomsAndSubs()
		setState("")
		return
	
	if(_action == "backbutton"):
		currentCategory.pop_back()
		return
	if(_action == "switchtarget"):
		sexEngine.switchPCTarget()
		return
	
	if(_action == "pickcategory"):
		currentCategory.append(_args[0])
		return
	
#	if(_action == "processTurn"):
#		var turnInfo = sexEngine.processTurn()
#		whatHappened = turnInfo["text"]
#		setState("")
#		return
	
	if(_action == "endthescene"):
		endScene([sexEngine.getSexResult()])
		return

	setState(_action)

func updateDomsAndSubs():
	for domID in sexEngine.doms:
		getCharacter(domID).updateNonBattleEffects()
	for subID in sexEngine.subs:
		getCharacter(subID).updateNonBattleEffects()

func addCategoryButtons(theActions):
	var categoryButtons = {}
	for actionInfo in theActions:
		var actionCategory = []
		if("category" in actionInfo):
			actionCategory = actionInfo["category"]
			
		if(currentCategory.size() >= actionCategory.size()):
			continue
		
		var good = true
		for _i in range(0, currentCategory.size()):
			if(currentCategory[_i] != actionCategory[_i]):
				good = false
				break
		
		if(!good):
			continue
		
		var newCategory = actionCategory[currentCategory.size()]
		if(!categoryButtons.has(newCategory)):
			categoryButtons[newCategory] = true
			addButton("!"+newCategory, "Look at the actions in this category", "pickcategory", [newCategory])
	
func supportsSexEngine():
	return true

func _onSceneEnd():
	sexEngine.endSex()

func getDebugActions():
	return [
		{
			"id": "forceEnd",
			"name": "Force end sex",
			"args": [
			],
		},
	]

func doDebugAction(_id, _args = {}):
	if(_id == "forceEnd"):
		sexEngine.endSex()

func saveData():
	var data = .saveData()
	
	data["currentCategory"] = currentCategory
	data["sexEngine"] = sexEngine.saveData()

	return data
	
func loadData(data):
	.loadData(data)
	
	sexEngine = SexEngine.new()
	sexEngine.setInventoryToUse(sceneSavedItemsInv)
	currentCategory = SAVE.loadVar(data, "currentCategory", [])
	sexEngine.loadData(SAVE.loadVar(data, "sexEngine", {}))

func supportsShowingPawns() -> bool:
	return true
