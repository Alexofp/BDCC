extends EventBase

func _init():
	id = "MainCheckpointEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "hall_checkpoint")

func shouldRun():
	return !GM.main.getFlag(CellblockModule.Cellblock_FreeToPassCheckpoint, false)

func run(_args):
	if(_args == null || _args[0] == Direction.North):
		if(GM.pc.getInventory().getItemsWithTag(ItemTag.Illegal).size() > 0 || GM.pc.getInventory().getEquippedItemsWithTag(ItemTag.Illegal).size() > 0):
			runScene("MainCheckpointScene")
	
func delayedRun():
	pass

func shouldInterupt():
	return true

func getPriority():
	return 100
