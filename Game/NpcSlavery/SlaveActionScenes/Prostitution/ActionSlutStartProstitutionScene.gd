extends "res://Scenes/SceneBase.gd"

var npcID = ""
var npc:DynamicCharacter

func _initScene(_args = []):
	npcID = _args[0]
	npc = GlobalRegistry.getCharacter(npcID)

func resolveCustomCharacterName(_charID):
	if(_charID == "npc"):
		return npcID

func _init():
	sceneID = "ActionSlutStartProstitutionScene"

func _run():
	if(state == ""):
		addCharacter(npcID)
		playAnimation(StageScene.Duo, "stand", {npc=npcID})
		
		var npcSlave:NpcSlave = npc.getNpcSlavery()
		if(npcSlave.getWorkEfficiency() <= 0.25):
			saynn("{npc.name} is too tired to do any prostitution today. Give {npc.him} some rest.")
			
			addButton("Continue", "Oh well", "endthescene")
			return
		
		saynn("Do you want to let {npc.name} out into the prison so {npc.he} can whore {npc.himself} out?")
		saynn("{npc.He} will return to you after some time and give you {npc.his} earnings. How much {npc.he} earns depends on {npc.his} slut level. The higher it is, the more {npc.he} will earn and the longer {npc.he} will work without needing a break.")
		

		addButton("Prostitution!", "Let your slut do some work", "start_whore")
		addButton("Cancel", "You changed your mind", "endthescene")
	
	if(state == "start_whore"):
		saynn("You order your slut to get out there and earn you some creds!")
		
		addButton("Continue", "See what happens next", "do_start_whore")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
		
	if(_action == "do_start_whore"):
		var npcSlave:NpcSlave = npc.getNpcSlavery()
		npcSlave.startActivity("Prostitution")
		endScene()
		return

	setState(_action)


func saveData():
	var data = .saveData()
	
	data["npcID"] = npcID

	return data
	
func loadData(data):
	.loadData(data)
	
	npcID = SAVE.loadVar(data, "npcID", "")
	npc = GlobalRegistry.getCharacter(npcID)
