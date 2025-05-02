extends EventBase

func _init():
	id = "EnslaveDynamicNpcEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.DefeatedDynamicNPC)
	es.addTrigger(self, Trigger.AfterSexWithDefeatedDynamicNPC)

func run(_triggerID, _args):
	var npcID = _args[0]
	var character:DynamicCharacter = getCharacter(npcID)
	
	if(!character.isDynamicCharacter()):
		return
	
	if(character.isSlaveToPlayer()):
		return
		
	if(character.hasEnslaveQuest()):
		var enslaveQuest:NpcEnslavementQuest = character.getEnslaveQuest()
		if(enslaveQuest.isEverythingCompleted()):
			addButton("Kidnap!", "Try to kidnap them into your cell", "dokidnap", [_args[0]])
		else:
			addDisabledButton("Kidnap!", "They are not ready to be kidnapped")
	else:
		if(!getModule("NpcSlaveryModule").canEnslave()):
			if(_triggerID == Trigger.DefeatedDynamicNPC):
				addDisabledButton("Enslave!", "Your cell is not big enough for this. Find someone who can upgrade it first.")
			return
		
		if(!character.hasEnslaveQuest() ):
			var pcRestraintsPreventChoking:bool = GM.pc.hasBlockedHands() || GM.pc.hasBoundArms()
			if(!pcRestraintsPreventChoking && character.getInventory().hasEquippedItemWithTag(ItemTag.AllowsEnslaving)):
				addButton("Enslave!", "Try to enslave them", "doenslave", [_args[0]])
			else:
				if(_triggerID == Trigger.DefeatedDynamicNPC):
					if(pcRestraintsPreventChoking):
						addDisabledButton("Enslave!", "You can't do that with restraints on your arms..")
					else:
						addDisabledButton("Enslave!", "They need to be wearing a collar for you to be able to enslave them")
		

func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "doenslave"):
		runScene("EnslaveDynamicNpcScene", [_args[0]])
	if(_method == "dokidnap"):
		GM.main.endCurrentScene()
		runScene("KidnapDynamicNpcScene", [_args[0]])
