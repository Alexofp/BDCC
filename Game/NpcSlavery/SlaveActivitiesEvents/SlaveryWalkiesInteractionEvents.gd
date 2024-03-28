extends EventBase

func _init():
	id = "SlaveryWalkiesInteractionEvents"

var peeSpots = ["yard_eastCorridor", "yard_northCorridor", "yard_westCorridor"]
var playSpots = ["yard_deadend1", "yard_deadend2", "yard_waterfall", "yard_vaulthere"]

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoomWithSlave, "main_bathroom1")
	es.addTrigger(self, Trigger.EnteringRoomWithSlave, "main_bathroom2")
	es.addTrigger(self, Trigger.EnteringRoomWithSlave, "main_dressing1")
	es.addTrigger(self, Trigger.EnteringRoomWithSlave, "main_dressing2")
	es.addTrigger(self, Trigger.EnteringRoomWithSlave, "main_punishment_spot")
	es.addTrigger(self, Trigger.EnteringRoomWithSlave, "fight_slutwall")
	es.addTrigger(self, Trigger.EnteringRoomWithSlave, "medical_nursery")
	es.addTrigger(self, Trigger.EnteringRoomWithSlave, "hall_canteen")
	es.addTrigger(self, Trigger.EnteringRoomWithSlave, "main_laundry")
	for theSpot in peeSpots:
		es.addTrigger(self, Trigger.EnteringRoomWithSlave, theSpot)
	for theSpot in playSpots:
		es.addTrigger(self, Trigger.EnteringRoomWithSlave, theSpot)

func run(_triggerID, _args):
	var locName = _args[0]
	var npcID = _args[1]
	var walkiesType = ""
	if(_args.size() > 2):
		walkiesType = _args[2]
	var theChar:DynamicCharacter = GlobalRegistry.getCharacter(npcID)
	var npcSlavery:NpcSlave = theChar.getNpcSlavery()
	
	if(locName in ["hall_canteen"]):
		if(walkiesType == "walkies"):
			if(npcSlavery.getActivityID() == "Walkies" && npcSlavery.getActivity().petWants == "food"):
				addButton("Canteen (Pet)", "Feed your puppy!", "start_pet_canteen", [npcID])
			else:
				addDisabledButton("Canteen (Pet)", "Your puppy is not hungry")
	
	if(locName in ["main_laundry"]):
		if(theChar.canRepairClothes()):
			addButtonWithChecks("Repair clothes (Slave)", "Pay 5 credits to repair your slave's clothes", "do_repair_clothes", [theChar], [[ButtonChecks.HasCredits, 5]])
		else:
			addDisabledButton("Repair clothes (Slave)", "Your slave's clothes seem to be alright")
		
	if(locName in ["main_bathroom1", "main_bathroom2"]):
		if(npcSlavery.getLevel() >= 3):
			addButton("Mirror (Slave)", "Change your slave's haircut", "starthair", [npcID])
		else:
			addDisabledButton("Mirror (Slave)", "Slave level 3+ required to do this")
		
		if(npcSlavery.getActivityID() == "Walkies" && npcSlavery.getActivity().petWants == "pee"):
			addButton("Urinals (Pet)", "Help your puppy relief themselves", "start_pee", [npcID])

	if(locName in peeSpots):
		if(npcSlavery.getActivityID() == "Walkies" && npcSlavery.getActivity().petWants == "pee"):
			addButton("Bushes (Pet)", "Help your puppy relief themselves", "start_pee", [npcID])

	if(locName in playSpots):
		if(npcSlavery.getActivityID() == "Walkies" && npcSlavery.getActivity().petWants == "play"):
			addButton("Play (Pet)", "This looks like a good spot to play with your pet", "start_play", [npcID])
		if(npcSlavery.getActivityID() == "Walkies" && npcSlavery.getActivity().petWants == "train"):
			addButton("Train (Pet)", "This looks like a good spot to teach your pet some tricks", "start_train", [npcID])


	if(locName in ["main_dressing1", "main_dressing2"]):
		addButton("Shower (Slave)", "Make your slave take a shower", "startshower", [npcID, walkiesType])

	if(locName in ["main_punishment_spot"]):
		addButton("Stocks (Slave)", "Put your slave into the stocks", "startstocks", [npcID])

	if(locName in ["fight_slutwall"]):
		addButton("Slutwall (Slave)", "Put your slave into the slutwall", "startslutwall", [npcID])

	if(locName in ["medical_nursery"]):
		if(theChar.isReadyToGiveBirth()):
			addButton("Give birth (Slave)", "Make your slave give birth", "givebirth", [npcID])
		else:
			addDisabledButton("Give birth (Slave)", "Your slave is not pregnant or is not ready to give birth yet")
	
func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "do_repair_clothes"):
		GM.pc.addCredits(-5)
		_args[0].repairAllClothes()
		addMessage("Your slave's clothes have been repaired!")
		GM.main.reRun()
	if(_method == "starthair"):
		runScene("ActionSlaveryHaircut", [_args[0]])
	if(_method == "startshower"):
		if(_args[1] == "walkies"):
			runScene("SlaveryPetWalkiesShower", [_args[0]])
		else:
			runScene("ActionSlaveryShower", [_args[0]])
	if(_method == "startstocks"):
		GM.main.endCurrentScene()
		runScene("PunishSlaveryLeaveInStocks", [_args[0]])
	if(_method == "startslutwall"):
		GM.main.endCurrentScene()
		runScene("PunishSlaveryLeaveInSlutwall", [_args[0]])
	if(_method == "givebirth"):
		runScene("SlaveryHelpGiveBirth", [_args[0]])
	if(_method == "start_pet_canteen"):
		runScene("SlaveryPetWalkiesCanteen", [_args[0]])
	if(_method == "start_pee"):
		runScene("SlaveryPetWalkiesPee", [_args[0]])
	if(_method == "start_play"):
		runScene("SlaveryPetWalkiesPlay", [_args[0]])
	if(_method == "start_train"):
		runScene("SlaveryPetWalkiesTrain", [_args[0]])
