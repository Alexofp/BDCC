extends SlaveEventBase

func _init():
	id = "TestEvent"
	eventWeight = 110.0

func canHappen(_npcSlavery:NpcSlave):
	return false

func shouldHappenChance(_npcSlavery:NpcSlave):
	return 100.0

func supportsActivity(_theActivityID):
	return true


func runEvent(_npcSlavery:NpcSlave):
	return {
		text = "AN EVENT HAPPENED!",
	}
