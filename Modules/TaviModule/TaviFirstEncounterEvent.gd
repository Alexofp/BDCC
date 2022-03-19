extends EventBase

func _init():
	id = "TaviFirstEncounterEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "mining_nearentrance")

func shouldRun():
	return GM.main.getFlag(Flag.Mining_IntroducedToMinning) && !GM.main.getFlag(TaviModule.Tavi_IntroducedTo)

func run(_args):
	runScene("TaviFirstEncounterScene")
	
func delayedRun():
	pass

func shouldInterupt():
	return true

func getPriority():
	return 10
