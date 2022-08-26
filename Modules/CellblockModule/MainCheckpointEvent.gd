extends EventBase

func _init():
	id = "MainCheckpointEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "hall_checkpoint")

func react(_triggerID, _args):
	if(GM.main.getModuleFlag("CellblockModule", "Cellblock_FreeToPassCheckpoint")):
		return false
	
	if(_args != null && _args.size() > 1 && _args[1] == Direction.North):
		if(GM.pc.getInventory().getItemsWithTag(ItemTag.Illegal).size() > 0 || GM.pc.getInventory().getEquippedItemsWithTag(ItemTag.Illegal).size() > 0):
			runScene("MainCheckpointScene")
			return true
	return false

func getPriority():
	return 100
