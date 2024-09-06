extends SlaveEventBase

func _init():
	id = "SlaveEscapes"
	eventWeight = 1.0

func canHappen(_npcSlavery:NpcSlave):
	if(_npcSlavery.isMindBroken()):
		return false
	if(_npcSlavery.getChar().getInventory().hasRemovableRestraints()):
		return false
	return true

func shouldHappenChance(_npcSlavery:NpcSlave):
	return _npcSlavery.getUnhappinessEscapeChance()

func runEvent(_npcSlavery:NpcSlave):
	var theText = "You look around.. and realize that one of your slaves went missing!"

	var slaveName = _npcSlavery.getChar().getName()
	theText += "\n\n"+slaveName+" is not here. All that's left.. a broken chain on the floor. Maybe having some restraints would help against that. Or maybe you should try to treat your slaves a little better? Nah, that's a silly thought."
	
	theText += "\n\nYou can try to find and enslave them again. Or let someone else take their place. But for now, you are one slave down."

	GlobalRegistry.getModule("NpcSlaveryModule").doFreeEnslavedCharacter(_npcSlavery.getChar().getID())
	GM.pc.getReputation().addRep(RepStat.Alpha, -3.0)
	
	return {
		text = theText,
	}

func getAnimInfo(_npcSlavery:NpcSlave):
	return [StageScene.Solo, "stand", {}]

func onEventSkipped(_npcSlavery:NpcSlave):
	GlobalRegistry.getModule("NpcSlaveryModule").doFreeEnslavedCharacter(_npcSlavery.getChar().getID())
	GM.main.addLogMessage("Oh no, anyway", "Looks like one of your slaves has managed to escape. Maybe you can try to track them down")
	GM.pc.getReputation().addRep(RepStat.Alpha, -3.0)
