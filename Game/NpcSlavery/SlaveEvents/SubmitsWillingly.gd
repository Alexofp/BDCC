extends SlaveEventBase

func _init():
	id = "SubmitsWillingly"
	eventWeight = 1.0

func canHappen(_npcSlavery:NpcSlave):
	if(_npcSlavery.submitted):
		return false
	if(_npcSlavery.getObedience() < 0.9):
		return false
	return true

func shouldHappenChance(_npcSlavery:NpcSlave):
	return 10.0 + min(0.5, _npcSlavery.getAwareness()) * 100.0

func runEvent(_npcSlavery:NpcSlave):
	var theText = "{npc.name} submits willingly!"
	_npcSlavery.submitted = true
	
	return {
		text = theText,
	}
