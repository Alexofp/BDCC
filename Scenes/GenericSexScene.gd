extends "res://Scenes/SceneBase.gd"

var sexEngine:SexEngine
var currentCategory = []
#var whatHappened = "ASD"

func _init():
	sceneID = "GenericSexScene"
	showFightUI = true

func _initScene(_args = []):
	sexEngine = SexEngine.new()
	
	var top = _args[0]
	
	#sexEngine.initPeople(top, "pc")
	#sexEngine.initPeople(top, "rahi")
	
	var newCharacter = GuardGenerator.new().generate()
	addCharacter(newCharacter.id)
	GM.main.addDynamicCharacterToPool(newCharacter.id, CharacterPool.Guards)
	
	#sexEngine.initPeople("pc", top)
	if(RNG.chance(50)):
		sexEngine.initPeople(newCharacter.id, "pc")
	else:
		sexEngine.initPeople("pc", newCharacter.id)
	
	#sexEngine.initPeople(top, "pc")
	#sexEngine.initPeople(top, "rahi")
	#sexEngine.initPeople("alexrynard", "rahi")
	sexEngine.generateGoals()
	
	sexEngine.start()
	addCharacter(top)
	#addCharacter("alexrynard")
	#addCharacter("rahi")
	#runScene("FightScene", [newCharacter.id])
	


func _reactInit():
	updateDomsAndSubs()

func _run():
	if(state == ""):
		sexEngine.playAnimation()
		#saynn(whatHappened)
		saynn(sexEngine.getFinalText())
		
		
		if(sexEngine.hasSexEnded()):
			pass
		else:
			if(currentCategory != []):
				addButton("Back", "Back to the previous menu", "backbutton")
			
			for domID in sexEngine.getDomIDs():
				var domInfo: SexDomInfo = sexEngine.getDomInfo(domID)
				sayn(domInfo.getInfoString())
			for subID in sexEngine.getSubIDs():
				var subInfo: SexSubInfo = sexEngine.getSubInfo(subID)
				sayn(subInfo.getInfoString())

			for actionInfo in sexEngine.getActions():
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
			
			addCategoryButtons()
			
			#addButton("Process", "Process", "processTurn")
			
		if(sexEngine.hasSexEnded()):
			addButton("LEAVE", "The sex has ended", "endthescene")
		else:
			if(sexEngine.isDom("pc")):
				addButtonAt(14, "END SEX", "Enough fun for now", "stopsex")
			else:
				addButtonAt(14, "QUICK SEX", "Simulate the sex for a while until it ends", "simulatesex")


func _react(_action: String, _args):
	if(_action == "stopsex"):
		sexEngine.endSex()
		return
	
	if(_action == "simulatesex"):
		var turns = 100
		while(!sexEngine.hasSexEnded() && turns > 0):
			turns -= 1
			sexEngine.doAction(sexEngine.getActions()[0])
			processTime(60)
		sexEngine.endSex()
		return
	
	if(_action == "doAction"):
		currentCategory = []
		sexEngine.doAction(_args[0])
		processTime(60)
		updateDomsAndSubs()
		setState("")
		return
	
	if(_action == "backbutton"):
		currentCategory.pop_back()
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
		endScene()
		return

	setState(_action)

func updateDomsAndSubs():
	for domID in sexEngine.doms:
		getCharacter(domID).updateNonBattleEffects()
	for subID in sexEngine.subs:
		getCharacter(subID).updateNonBattleEffects()

func addCategoryButtons():
	var categoryButtons = {}
	for actionInfo in sexEngine.getActions():
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

func saveData():
	var data = .saveData()
	
	data["currentCategory"] = currentCategory
	data["sexEngine"] = sexEngine.saveData()

	return data
	
func loadData(data):
	.loadData(data)
	
	sexEngine = SexEngine.new()
	currentCategory = SAVE.loadVar(data, "currentCategory", [])
	sexEngine.loadData(SAVE.loadVar(data, "sexEngine", {}))
