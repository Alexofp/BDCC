extends EventBase

func _init():
	id = "GreenhouseStealEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "main_greenhouses")

func run(_args):
	pass
	#runScene("FightScene", ["risha"], "rishafight")
	
func delayedRun():
	if(!GM.main.getFlag(CellblockModule.Cellblock_GreenhouseLooted, false)):
		addButtonUnlessLate("Steal", "Try and steal something", "steal_apple")
	else:
		addDisabledButton("Steal", "Too dangerous to do this again today")

func shouldInterupt():
	return false

func getPriority():
	return 6

func onButton(_method, _args):
	if(_method == "steal_apple"):
#		GM.pc.getInventory().addItem(GlobalRegistry.createItem("appleitem"))
#		GM.main.addMessage("You stole an apple")
#		GM.main.reRun()
		runScene("StealingFromGreenhouseScene")
		
