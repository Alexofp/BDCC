extends "res://Scenes/SceneBase.gd"

var npcID = ""
var npc:DynamicCharacter


func _initScene(_args = []):
	npcID = _args[0]
	npc = GlobalRegistry.getCharacter(npcID)

func _reactInit():
	processTime(10*60)
	npc.afterTakingAShower()
	
	var npcSlavery:NpcSlave = npc.getNpcSlavery()
	if(npcSlavery != null && npcSlavery.getActivityID()=="Walkies"):
		npcSlavery.getActivity().satisfyWant("pee")

func resolveCustomCharacterName(_charID):
	if(_charID == "npc"):
		return npcID

func _init():
	sceneID = "SlaveryPetWalkiesPee"

func _run():
	if(state == ""):
		addCharacter(npcID)
		playAnimation(StageScene.PuppyDuo, "stand", {npc=npcID, npcBodyState={naked=true, leashedBy="pc"}})

		var npcSlavery:NpcSlave = npc.getNpcSlavery()
		if(GM.pc.getLocation() in ["main_bathroom1", "main_bathroom2"]):
			saynn("Your pet looks up at you with sad eyes while tippy-toeing around on the spot, clearly needing a relief. Putting your pet onto a toilet would be way too hard so you bring {npc.him} to the urinals instead.")
			
			if(npc.isWearingChastityCage() || npc.hasReachablePenis()):
				if(npcSlavery.getSlaveSkill(SlaveType.Pet) < 10):
					saynn("Your pet has to pee into it like a dog, while raising {npc.his} hind leg. {npc.He} ends up peeing all over the place anyway, your pet might need some more training.")
				else:
					saynn("Your pet obeys eagerly and pees like a real dog, while raising {npc.his} hind leg.")
			else:
				if(npcSlavery.getSlaveSkill(SlaveType.Pet) < 10):
					saynn("Your pet has to pee into it like a dog, with {npc.his} butt turned towards it. {npc.He} ends up peeing all over the place anyway, your pet might need some more training.")
				else:
					saynn("Your pet obeys eagerly and pees like a real dog, with {npc.his} butt turned towards it.")
		else:
			saynn("Your pet looks up at you with sad eyes while squirming uncomfortably, clearly needing a relief.")
			
			saynn("You look around and find a few bushes that you lead your pet behind. A playful smirk appears on your face.")
			
			saynn("[say=pc]Go ahead.[/say]")
			
			if(npc.isWearingChastityCage() || npc.hasReachablePenis()):
				if(npcSlavery.getSlaveSkill(SlaveType.Pet) < 10):
					saynn("Reluctantly, {npc.he} obeys, {npc.his} movements awkward and clumsy. {npc.He} raises {npc.his} hind leg to mimic a real dog.. but ends up peeing all over the place.")
					
					saynn("{npc.He} finishes quickly and does {npc.his} best to avoid your gaze.")
				else:
					saynn("Obeying like a well-trained pup, {npc.name} walks up to the bush and pees while raising {npc.his} leg, like a real pet would.")
			else:
				if(npcSlavery.getSlaveSkill(SlaveType.Pet) < 10):
					saynn("Reluctantly, {npc.he} obeys, {npc.his} movements awkward and clumsy. {npc.He} tries to spread {npc.his} hind legs wide to mimic a real female dog.. but ends up peeing all over the place anyway.")
					
					saynn("{npc.He} finishes quickly and does {npc.his} best to avoid your gaze.")
				else:
					saynn("Obeying like a well-trained pup, {npc.name} walks up to the bush and pees while spreading {npc.his} hind legs wide and lowering {npc.himself}, like a real female dog would.")
		
		addButton("Continue", "See what happens next", "endthescene")
		
func _react(_action: String, _args):
	if(_action == "endthescene"):
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
