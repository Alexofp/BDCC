extends EventBase

func _init():
	id = "TaviShowerEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.TakingAShower)

func shouldRun():
	return !getFlag(TaviModule.Tavi_ShowerEventHappened) && TaviModule.trustsPC() && RNG.chance(15) && (GM.pc.hasPenis() || GM.pc.hasVagina())

func run(_args):
	setFlag(TaviModule.Tavi_ShowerEventHappened, true)
	runScene("TaviShowerScene")
	return true

func shouldInterupt():
	return true

func getPriority():
	return 10
