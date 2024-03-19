extends SlaveEventBase

func _init():
	id = "CaughtMasturbating"
	eventWeight = 1.0
	sceneID = "SlaveryEventCaughtMasturbating"

func canHappen(_npcSlavery:NpcSlave):
	if(_npcSlavery.isMindBroken()):
		return false
	if(_npcSlavery.getLove() < 0.1 || _npcSlavery.getLove() > 0.9):
		return false
	if(_npcSlavery.getChar().hasBlockedHands() || _npcSlavery.getChar().hasBoundArms()):
		return false
	if(_npcSlavery.getChar().hasReachablePenis() || _npcSlavery.getChar().hasReachableVagina()):
		return true
	return false

func shouldHappenChance(_npcSlavery:NpcSlave):
	return 0.0#100.0

