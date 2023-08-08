extends EventBase

func _init():
	id = "Ch5s5TaviPreparationEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.TalkingToNPC, "tavi")

func react(_triggerID, _args):
	if((getFlag("TaviModule.Ch5StoleDatapadFromNova") || getFlag("TaviModule.Ch5StoleDatapadFromGuard")) && getFlag("TaviModule.Ch5SentinelXHappened") && !getFlag("TaviModule.Ch5BigSceneStarted")):
		
		runScene("Ch5s5TaviPreparationScene")
		setFlag("TaviModule.Ch5PreparationHappened", true)
		return true
	
func getPriority():
	return 20
