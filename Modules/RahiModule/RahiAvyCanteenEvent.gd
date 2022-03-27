extends EventBase

func _init():
	id = "RahiAvyCanteenEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EatingInCanteen)

func shouldRun():
	return RNG.chance(50) && GM.main.getFlag(RahiModule.Rahi_Introduced) && !GM.main.getFlag(RahiModule.Rahi_CanteenSceneHappened)

func run(_args):
	runScene("RahiAvyCanteenScene")
	return true

func getPriority():
	return 5
