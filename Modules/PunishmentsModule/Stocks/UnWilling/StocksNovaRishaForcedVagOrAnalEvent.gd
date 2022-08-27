extends EventBase

func _init():
	id = "StocksNovaRishaForcedVagOrAnalEvent"

func registerTriggers(es):
	es.addTrigger(self, "StocksUnWillingSex")

func react(_triggerID, _args):
	runScene("StocksNovaRishaForcedVagOrAnal")
	return true

func getPriority():
	return 10
