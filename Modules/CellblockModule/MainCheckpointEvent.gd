extends EventBase

func _init():
	id = "MainCheckpointEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "hall_checkpoint")

func shouldRun():
	return !GM.main.getFlag(CellblockModule.Cellblock_FreeToPassCheckpoint, false)

func run(_args):
	if(_args == null || _args[0] == Direction.North):
		runScene("MainCheckpointScene")
	
func delayedRun():
	pass

func shouldInterupt():
	return true

func getPriority():
	return 100
