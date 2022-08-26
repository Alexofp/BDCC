extends EventBase

func _init():
	id = "TaviShowerEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.TakingAShower)

func react(_triggerID, _args):
	if(getModuleFlag("TaviModule", "Tavi_ShowerEventHappened") || !TaviModule.trustsPC() || !RNG.chance(15) || !(GM.pc.hasPenis() || GM.pc.hasVagina())):
		return false
	
	setModuleFlag("TaviModule", "Tavi_ShowerEventHappened", true)
	runScene("TaviShowerScene")
	return true

func getPriority():
	return 10
