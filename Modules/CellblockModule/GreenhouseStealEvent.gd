extends EventBase

func _init():
	id = "GreenhouseStealEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "main_greenhouses")

func run(_triggerID, _args):
	if(!GM.main.getModuleFlag("CellblockModule", "Cellblock_GreenhouseLooted", false)):
		addButtonUnlessLate("Steal", "Try and steal something", "steal_apple")
	else:
		addDisabledButton("Steal", "Too dangerous to do this again today")

func getPriority():
	return 6

func onButton(_method, _args):
	if(_method == "steal_apple"):
#		GM.pc.getInventory().addItem(GlobalRegistry.createItem("appleitem"))
#		GM.main.addMessage("You stole an apple")
#		GM.main.reRun()
		runScene("StealingFromGreenhouseScene")
		
