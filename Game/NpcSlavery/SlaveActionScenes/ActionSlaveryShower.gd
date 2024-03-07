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
	sceneID = "ActionSlaveryShower"

func _run():
	if(state == ""):
		addCharacter(npcID)
		playAnimation(StageScene.Duo, "stand", {npc=npcID, npcBodyState={leashedBy="pc"}})
		#var npcSlavery:NpcSlave = npc.getNpcSlavery()
		
		saynn("You are standing in the dressing room with {npc.name}.")
		
		saynn("How do you want {npc.him} to shower?")
		
		addButton("Alone", "Just watch it", "shower_alone")
		addButton("Together", "Shower together with your slave", "shower_together")

		addButton("Cancel", "You changed your mind", "endthescene")

	if(state == "shower_together"):
		if(GM.pc.getLocation() == "main_dressing2"):
			aimCameraAndSetLocName("main_shower2")
		else:
			aimCameraAndSetLocName("main_shower1")
		playAnimation(StageScene.SexStanding, "tease", {npc=npcID, bodyState={naked=true}, npcBodyState={naked=true}})
		saynn("You shower together with {npc.name}.")

		addButton("Enough", "That was fun", "endthescene")
		addButton("Clean inside", "Clean inside your slave's orifices", "together_cleaninside")

	if(state == "together_cleaninside"):
		saynn("You clean inside {npc.his} holes.")
		
		addButton("Enough", "That was fun", "endthescene")

	if(state == "shower_alone"):
		if(GM.pc.getLocation() == "main_dressing2"):
			aimCameraAndSetLocName("main_shower2")
		else:
			aimCameraAndSetLocName("main_shower1")
		playAnimation(StageScene.Duo, "stand", {npc=npcID, flipNPC=true, npcAction="struggle", npcBodyState={naked=true, leashedBy="pc"}})
		#var npcSlavery:NpcSlave = npc.getNpcSlavery()
		saynn("Your slave is showering alone, your hand is holding {npc.his} leash.")
		
		addButton("Enough", "That was fun", "endthescene")
		addButton("Clean inside", "Order them to clean inside too", "alone_cleaninside")
		
	if(state == "alone_cleaninside"):
		saynn("{npc.name} cleans inside too.")
		
		addButton("Enough", "That was fun", "endthescene")


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
		
	if(_action == "shower_alone"):
		processTime(10*60)
		npc.afterTakingAShower()
	
	if(_action == "alone_cleaninside"):
		processTime(10*60)
		if(!npc.clearOrificeFluidsCheckBlocked()):
			addMessage("Something prevented you from clearing every hole")
	
	if(_action == "shower_together"):
		processTime(10*60)
		npc.afterTakingAShower()
		GM.pc.afterTakingAShower()
	
	if(_action == "together_cleaninside"):
		processTime(10*60)
		if(!npc.clearOrificeFluidsCheckBlocked()):
			addMessage("Something prevented you from clearing every hole")

		
	setState(_action)


func saveData():
	var data = .saveData()
	
	data["npcID"] = npcID

	return data
	
func loadData(data):
	.loadData(data)
	
	npcID = SAVE.loadVar(data, "npcID", "")
	npc = GlobalRegistry.getCharacter(npcID)
