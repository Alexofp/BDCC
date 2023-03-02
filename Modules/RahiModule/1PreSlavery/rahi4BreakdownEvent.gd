extends EventBase

func _init():
	id = "rahi4BreakdownEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "main_bench2")
	es.addEventCheck(self, "RahiBusy")

func react(_triggerID, _args):
	if(getFlag("RahiModule.rahi4SceneHappened")):
		return false
	if(!getFlag("RahiModule.rahi3SceneHappened")):
		return false
	if(!getFlag("RahiModule.rahi2SceneHappened")):
		return false
	if(GM.main.getDays() > getFlag("RahiModule.rahi3DayHappened", 0)):
		setFlag("RahiModule.rahi4SceneHappened", true)
		setFlag("RahiModule.rahi4DayHappened", GM.main.getDays())
		runScene("rahi4BreakdownScene")
		return true
	return false

func getPriority():
	return 5

func eventCheck(_checkID, _args = []):
	if(!getFlag("RahiModule.rahi4SceneHappened") && getFlag("RahiModule.rahi3SceneHappened")):
		return {busy=true}
