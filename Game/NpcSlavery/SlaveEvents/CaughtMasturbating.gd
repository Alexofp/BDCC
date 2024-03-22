extends SlaveEventBase

func _init():
	id = "CaughtMasturbating"
	eventWeight = 1.0
	sceneID = "SlaveryEventCaughtMasturbating"

func canHappen(_npcSlavery:NpcSlave):
	if(_npcSlavery.isMindBroken()):
		return false
	if(_npcSlavery.getChar().hasBlockedHands() || _npcSlavery.getChar().hasBoundArms()):
		return false
	if(_npcSlavery.getChar().hasReachablePenis() || _npcSlavery.getChar().hasReachableVagina()):
		return true
	return false

func shouldHappenChance(_npcSlavery:NpcSlave):
	var neediness = max(0.0, _npcSlavery.getNeediness()) # Value between 0.0 and 100.0
	
	var theChance = sqrt(neediness) * 10.0
	if(neediness < 2.0): # Power of will simulation. If we're too needy, we lose our will
		theChance *= 0.5
	
	theChance *= (1.0 - _npcSlavery.getObedience() + _npcSlavery.getSpoiling()*2.0 - _npcSlavery.getFear())
	
	theChance *= 1.0 + _npcSlavery.getLove()
	#print("CHANCE TO MASTURBATE: "+str(theChance))
	return theChance

func getCooldown(_npcSlavery:NpcSlave):
	#if(_npcSlavery.getNeediness() >= 60.0):
	#	return 0
	if(_npcSlavery.getNeediness() >= 30.0):
		return 1
	return 2
