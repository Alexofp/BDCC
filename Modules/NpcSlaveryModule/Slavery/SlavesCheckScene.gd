extends "res://Scenes/SceneBase.gd"

var resultText = ""
var savedCharID = ""

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
			
			addButton(("(!) " if npcSlavery.hasRandomEventToTrigger() else "")+character.getName(), character.getSmallDescription(), "do_check", [character])
	
func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
	
	if(_action == "do_check"):
		var character:DynamicCharacter = _args[0]
		var npcSlavery:NpcSlave = character.getNpcSlavery()
		
		if(!npcSlavery.isDoingActivity() || (npcSlavery.isDoingActivity() && npcSlavery.getActivity().shouldTriggerEventsOnTalk())):
			if(GM.ES.triggerReact("TalkedWithSlave", [character.getID(), "SlaveTalkScene"])):
				endScene()
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

func saveData():
	var data = .saveData()
	
	data["resultText"] = resultText
	data["savedCharID"] = savedCharID
	
	return data
	
func loadData(data):
	.loadData(data)
	
	resultText = SAVE.loadVar(data, "resultText", "")
	savedCharID = SAVE.loadVar(data, "savedCharID", "")
