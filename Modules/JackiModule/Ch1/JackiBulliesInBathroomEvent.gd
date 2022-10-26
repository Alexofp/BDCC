extends EventBase

func _init():
	id = "JackiBulliesInBathroomEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "main_bathroom2")

func react(_triggerID, _args):
	if(!getFlag("JackiModule.BathroomBulliesSceneWillHappen")):
		return false
		
	setFlag("JackiModule.BathroomBulliesSceneWillHappen", false)
	setFlag("JackiModule.BathroomBulliesSceneHappened", true)
	runScene("JackiBulliesInBathroomScene")
	return true

func getPriority():
	return 10
