extends SlaveEventBase

func _init():
	id = "TestEvent"
	eventWeight = 0.0

func canHappen(_npcSlavery:NpcSlave):
	return false

func shouldHappenChance(_npcSlavery:NpcSlave):
	return 0.0

func runEvent(_npcSlavery:NpcSlave):
	return {
		text = "AN EVENT HAPPENED!",
	}
