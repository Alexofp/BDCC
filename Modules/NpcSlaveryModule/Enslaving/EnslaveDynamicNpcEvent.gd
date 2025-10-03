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
		var canKidnapInfo:Array = getModule("NpcSlaveryModule").canKidnapCharacterReason(character)
		
		if(canKidnapInfo[0]):
			addButton("Kidnap!", "Try to kidnap them into your cell", "dokidnap", [_args[0]])
		else:
			addDisabledButton("Kidnap!", canKidnapInfo[1] if canKidnapInfo.size() > 1 else "They are not ready to be kidnapped")
	else:
		if(!getModule("NpcSlaveryModule").canEnslave()):
			if(_triggerID == Trigger.DefeatedDynamicNPC):
				addDisabledButton("Enslave!", "Your cell is not big enough for this. Find someone who can upgrade it first.")
			return
		
		if(!character.hasEnslaveQuest() ):
			var canEnslaveInfo:Array = getModule("NpcSlaveryModule").canStartEnslavingCharacterReason(character)
			
			if(canEnslaveInfo[0]):
				addButton("Enslave!", "Try to enslave them", "doenslave", [_args[0]])
			else:
				addDisabledButton("Enslave!", canEnslaveInfo[1] if canEnslaveInfo.size() > 1 else "You can't enslave them currently..")
		

func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "doenslave"):
		runScene("EnslaveDynamicNpcScene", [_args[0]])
	if(_method == "dokidnap"):
		GM.main.endCurrentScene()
		runScene("KidnapDynamicNpcScene", [_args[0]])
