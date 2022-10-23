extends EventBase

func _init():
	id = "JackiStuckInStocksEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "main_punishment_spot")

func run(_triggerID, _args):
	if(!getFlag("JackiModule.Jacki_StocksSceneHappened") && getFlag("JackiModule.Jacki_FirstTimeEncountered")):
		saynn("You notice someone locked in one of the pillories. Someone who you recognize. A female guard is standing near them.")

		addButtonUnlessLate("Inmate", "(chastity piercings, urethra penetration) See what is happening there", "jackiscene")

func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "jackiscene"):
		setFlag("JackiModule.Jacki_StocksSceneHappened", true)
		runScene("JackiStuckInStocksScene")
