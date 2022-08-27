extends EventBase

func _init():
	id = "TaviStocksEscapeEvent"

func registerTriggers(es):
	es.addTrigger(self, "StocksEscape")

func react(_triggerID, _args):
	if(GM.main.getModuleFlag("TaviModule", "Tavi_IntroducedTo") && !GM.main.getModuleFlag("TaviModule", "Tavi_IsAngryAtPlayer")):
		runScene("TaviStocksEscape")
		return true

func getPriority():
	return 10

