extends EventBase

func _init():
	id = "GreenhouseStealEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "main_greenhouses")

func run():
	pass
	#runScene("FightScene", ["risha"], "rishafight")
	
func delayedRun():
	addButton("Steal an apple", "Steal an apple from the crates", "steal_apple")

func shouldInterupt():
	return false

func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "steal_apple"):
		GM.pc.getInventory().addItem(GlobalRegistry.createItem("appleitem"))
		GM.main.addMessage("You stole an apple")
		GM.main.reRun()
		
	#if(_method == "not_first_time"):
	#	runScene("WorkInMinesScene")
