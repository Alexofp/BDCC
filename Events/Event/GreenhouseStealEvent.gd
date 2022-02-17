extends EventBase

func _init():
	id = "GreenhouseStealEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "main_greenhouses")

func run():
	pass
	#runScene("FightScene", ["risha"], "rishafight")
	
func delayedRun():
	addButton("Steal", "Try and steal something", "steal_apple")

func shouldInterupt():
	return false

func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "steal_apple"):
#		GM.pc.getInventory().addItem(GlobalRegistry.createItem("appleitem"))
#		GM.main.addMessage("You stole an apple")
#		GM.main.reRun()
		runScene("StealingFromGreenhouseScene")
		
