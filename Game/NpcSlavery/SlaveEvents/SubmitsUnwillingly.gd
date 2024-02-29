extends SlaveEventBase

func _init():
	id = "SubmitsUnwillingly"
	eventWeight = 1.0

func canHappen(_npcSlavery:NpcSlave):
	if(_npcSlavery.submitted):
		return false
	if(_npcSlavery.getBrokenSpirit() < 0.9):
		return false
	return true

func shouldHappenChance(_npcSlavery:NpcSlave):
	return 10.0 + min(0.5, _npcSlavery.getDespair()) * 100.0

func runEvent(_npcSlavery:NpcSlave):
	var theText = "{npc.name} has been broken, they submit!"
	_npcSlavery.submitted = true
	
	_npcSlavery.deservesReward(3)
	
	return {
		text = theText,
	}
