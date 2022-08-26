extends EventBase

func _init():
	id = "TaviFirstEncounterEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "mining_nearentrance")

func react(_triggerID, _args):
	if(!GM.main.getFlag(Flag.Mining_IntroducedToMinning) || GM.main.getModuleFlag("TaviModule", "Tavi_IntroducedTo")):
		return false
		
	GM.main.setModuleFlag("TaviModule", "Tavi_IntroducedTo", true)
	runScene("TaviFirstEncounterScene")
	return true

func getPriority():
	return 10
