extends "res://Scenes/SceneBase.gd"

var resultText = ""
var savedCharID = ""
var savedEventID = ""
var sceneToTrigger = ""

func _init():
	sceneID = "SlaveEventWrapperScene"

func resolveCustomCharacterName(_charID):
	if(_charID == "npc"):
		return savedCharID
	
func _initScene(_args = []):
	savedCharID = _args[0]
	sceneToTrigger = _args[1]
	
func _reactInit():
	var character:DynamicCharacter = getCharacter(savedCharID)
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
				setState("")
				savedCharID = character.getID()
				
				var animInfo = slaveEvent.getAnimInfo(npcSlavery)
				if(animInfo != null):
					playAnimation(animInfo[0], animInfo[1], animInfo[2])
				
				return
	
func _run():
	if(state == ""):
		saynn(resultText)
		
		var character:DynamicCharacter = getCharacter(savedCharID)
		if(character != null && character.isSlaveToPlayer()):
			addButton("Continue", "See what happens next", "after_event")
		else:
			addButton("Continue", "See what happens next", "endthescene")
			
		
func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "after_event"):
		runScene(sceneToTrigger, [savedCharID])
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
			
			runScene(sceneToTrigger, [character.getID()])
			endScene()
		else:
			setState("")
		return

func saveData():
	var data = .saveData()
	
	data["resultText"] = resultText
	data["savedCharID"] = savedCharID
	data["savedEventID"] = savedEventID
	data["sceneToTrigger"] = sceneToTrigger
	
	return data
	
func loadData(data):
	.loadData(data)
	
	resultText = SAVE.loadVar(data, "resultText", "")
	savedCharID = SAVE.loadVar(data, "savedCharID", "")
	savedEventID = SAVE.loadVar(data, "savedEventID", "")
	sceneToTrigger = SAVE.loadVar(data, "sceneToTrigger", "")
