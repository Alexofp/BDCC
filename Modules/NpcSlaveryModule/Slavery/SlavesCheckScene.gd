extends "res://Scenes/SceneBase.gd"

var resultText = ""
var savedCharID = ""
var savedEventID = ""

func _init():
	sceneID = "SlavesCheckScene"

func resolveCustomCharacterName(_charID):
	if(_charID == "npc"):
		return savedCharID
	
func _run():
	if(state == ""):
		playAnimation(StageScene.Solo, "stand")
		
		addButtonAt(14, "CLOSE", "Enough interactions", "endthescene")
		
		saynn("Who do you want to check on?")
		
		var slaves = GM.main.getDynamicCharacterIDsFromPool(CharacterPool.Slaves)
		
		for charID in slaves:
			var character:DynamicCharacter = getCharacter(charID)
			var npcSlavery:NpcSlave = character.getNpcSlavery()
			if(npcSlavery == null):
				continue
			
			addButton(("(!) " if npcSlavery.hasRandomEventToTrigger() else "")+character.getName(), "Check on this "+character.getSpeciesFullName(), "do_check", [character])
	
	if(state == "onSlaveEvent"):
		saynn(resultText)
		playAnimation(StageScene.Duo, "stand", {npc=savedCharID})
		
		var character:DynamicCharacter = getCharacter(savedCharID)
		if(character != null && character.isSlaveToPlayer()):
			addButton("Continue", "Start talking with the slave", "do_just_talk", [character])
		else:
			addButton("Continue", "See what happens next", "")
			
		
func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
	
	if(_action == "do_check"):
		var character:DynamicCharacter = _args[0]
		var npcSlavery:NpcSlave = character.getNpcSlavery()
		
		npcSlavery.markCheckedOnSlaveToday()
		
		if(npcSlavery != null && npcSlavery.hasRandomEventToTrigger()):
			var eventID = npcSlavery.randomEventWillHappenID
			npcSlavery.hasRandomEvent = false
			npcSlavery.randomEventWillHappenID = ""
			
			var slaveEvent:SlaveEventBase = GlobalRegistry.getSlaveEvent(eventID)
			if(slaveEvent != null):
				if(slaveEvent.sceneID != ""):
					runScene(slaveEvent.sceneID, [character.getID()], "slaveEvent")
					savedEventID = slaveEvent.id
					return
				else:
					var result = slaveEvent.runEvent(npcSlavery)
					if(result.has("text")):
						resultText = result["text"]
					else:
						resultText = "Something happened!"
					setState("onSlaveEvent")
					savedCharID = character.getID()
					return
		
		runScene("SlaveTalkScene", [character.getID()])
		endScene()
		return

	if(_action == "do_just_talk"):
		var character:DynamicCharacter = _args[0]
		runScene("SlaveTalkScene", [character.getID()])
		endScene()
		return

	setState(_action)

func _react_scene_end(_tag, _result):
	if(_tag == "slaveEvent"):
		var character:DynamicCharacter = getCharacter(savedCharID)
		if(character != null && character.isSlaveToPlayer()):
			var npcSlavery:NpcSlave = character.getNpcSlavery()
			var slaveEvent:SlaveEventBase = GlobalRegistry.getSlaveEvent(savedEventID)
			if(slaveEvent != null):
				slaveEvent.reactSceneEnd(npcSlavery, _result)
			
			runScene("SlaveTalkScene", [character.getID()])
			endScene()
		else:
			setState("")
		return

func saveData():
	var data = .saveData()
	
	data["resultText"] = resultText
	data["savedCharID"] = savedCharID
	data["savedEventID"] = savedEventID
	
	return data
	
func loadData(data):
	.loadData(data)
	
	resultText = SAVE.loadVar(data, "resultText", "")
	savedCharID = SAVE.loadVar(data, "savedCharID", "")
	savedEventID = SAVE.loadVar(data, "savedEventID", "")
