extends EventBase

func _init():
	id = "ElizaBringNpcToBeTestedEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.DefeatedDynamicNPC)
	es.addTrigger(self, Trigger.AfterSexWithDefeatedDynamicNPC)
	es.addTrigger(self, Trigger.EnteringRoomWithSlave, "med_lobbymain")

func run(_triggerID, _args):
	if(_triggerID == Trigger.EnteringRoomWithSlave):
		var npcID = _args[1]
		var character:DynamicCharacter = getCharacter(npcID)
		if(!character.isDynamicCharacter()):
			return
		if(getModule("ElizaModule").canSendSlavesToBeMilked()):
			if(character.isSlaveToPlayer()):
				var npcSlave:NpcSlave = character.getNpcSlavery()
				if(!npcSlave.isDoingActivity()):
					if(npcSlave.hasSubmittedToPC()):
						addButton("Milking", "Give your slave to Eliza to be milked every day", "give_to_be_milked", [_args[1]])
					else:
						addDisabledButton("Milking", "You can only give to Eliza slaves that have submitted to you. Otherwise they would run away, duh!")
					
		if(getModule("ElizaModule").hasLabAccess() && GM.main.SCI.hasTFsCanScan(character)):
			addButton("Scan TFs!", "Make Eliza Quinn scan the transformations of your slave!", "do_scan_slave", [_args[1]])
		return
	
	var npcID = _args[0]
	var character:DynamicCharacter = getCharacter(npcID)
	
	if(!character.isDynamicCharacter()):
		return
	
	#if(character.isSlaveToPlayer()):
	#	return
	
	if(!getModule("ElizaModule").hasLabAccess()):
		return
	
	if(GM.main.SCI.hasTFsCanScan(character)):
		addButton("Scan TFs!", "Bring them to Eliza Quinn so she can scan their transformations!", "do_scan_them", [_args[0]])
		

func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "do_scan_them"):
		GM.main.endCurrentScene()
		GM.main.IS.deletePawn(_args[0])
		runScene("ElizaGenericNPCTestDrugScene", [_args[0]])

	if(_method == "do_scan_slave"):
		runScene("ElizaGenericNPCTestDrugScene", [_args[0]])

	if(_method == "give_to_be_milked"):
		var npcID = _args[0]
		var character:DynamicCharacter = getCharacter(npcID)
		var npcSlave:NpcSlave = character.getNpcSlavery()
		GM.main.endCurrentScene()
		npcSlave.startActivity("MilkingInMedical")
		addMessage("Your slave will now be milked every day!")
		# Maybe a scene here
