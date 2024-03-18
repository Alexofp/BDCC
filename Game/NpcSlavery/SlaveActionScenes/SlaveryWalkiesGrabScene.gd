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
	sceneID = "SlaveryWalkiesGrabScene"

func _run():
	if(state == ""):
		addCharacter(npcID)
		var npcSlave:NpcSlave = npc.getNpcSlavery()
		
		saynn("What are you planning to do with {npc.name}?")
		
		addButton("Wander around", "Leash your slave and wander around the station with them", "do_wander")
		if(npcSlave.getSlaveSkill(SlaveType.Pet) >= 3):
			if(npcSlave.getWorkEfficiency() <= 0.25):
				addDisabledButton("Walkies", "Your pet is too tired for walkies, give them some rest")
			else:
				addButton("Walkies", "Give your pet walkies around the station", "do_petwander")
		else:
			addDisabledButton("Walkies", "Your slave doesn't have high enough pet skill. Requires at least rank D-")
		#addDisabledButton("Pimping", "Your slave doesn't have high enough slut skill")
		addButton("Cancel", "Never mind", "endthescene")
		
	if(state == "do_wander"):
		GM.pc.setLocation("hall_mainentrance")
		aimCameraAndSetLocName("hall_mainentrance")
		playAnimation(StageScene.Duo, "stand", {npc=npcID, npcBodyState={leashedBy="pc"}})
		
		saynn("You leash your slave and bring {npc.him} out into the main hall.")
		
		addButton("Continue", "See what happens next", "start_wander", [""])
	
	if(state == "do_petwander"):
		GM.pc.setLocation("hall_mainentrance")
		aimCameraAndSetLocName("hall_mainentrance")
		#playAnimation(StageScene.PuppyDuo, "walk", {npc=npcID, npcAction="walk", flipNPC=true, npcBodyState={naked=true, leashedBy="pc"}})
		playAnimation(StageScene.PuppyDuo, "stand", {npc=npcID, flipNPC=true, npcBodyState={naked=true, leashedBy="pc"}})

		saynn("You "+("undress and " if !npc.isFullyNaked() else "")+"put some puppy restraints on your pet before bringing {npc.him} out into the main hall for walkies.")
		
		var npcSlave:NpcSlave = npc.getNpcSlavery()
		var puppySkill = npcSlave.getSlaveSkill(SlaveType.Pet)
		if(puppySkill < 15):
			var howMuchNeeded = 2 + int(sqrt(puppySkill+1)*1.5)
			
			saynn("Your pet gets puppy points each time you satisfy {npc.his} pet need. Get at least "+str(howMuchNeeded)+" puppy points to raise {npc.his} pet skill.")
		
		addButton("Continue", "See what happens next", "start_wander", ["walkies"])

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
		
	if(_action == "start_wander"):
		runScene("SlaveryWalkiesScene", [npcID, _args[0]])
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
