extends SlaveEventBase

func _init():
	id = "SubmitsOutOfLove"
	eventWeight = 1.0

func canHappen(_npcSlavery:NpcSlave):
	if(_npcSlavery.submitted):
		return false
	if(_npcSlavery.getLove() < 0.9):
		return false
	return true

func shouldHappenChance(_npcSlavery:NpcSlave):
	return 10.0 + min(0.5, _npcSlavery.getTrust()) * 100.0

func runEvent(_npcSlavery:NpcSlave):
	var theText = "{npc.name} submits out of love!"
	_npcSlavery.submitted = true
	
	return {
		text = theText,
	}
