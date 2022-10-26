extends EventBase

func _init():
	id = "TaviFirstEncounterEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "mining_nearentrance")

func react(_triggerID, _args):
	if(!GM.main.getFlag("Mining_IntroducedToMinning") || GM.main.getModuleFlag("TaviModule", "Tavi_IntroducedTo")):
		return false
		
	GM.main.setModuleFlag("TaviModule", "Tavi_IntroducedTo", true)
	GM.main.applyWorldEdit("TaviWorldEdit")
	runScene("TaviFirstEncounterScene")
	return true

func getPriority():
	return 10
