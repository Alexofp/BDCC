extends EventBase

func _init():
	id = "rahi3RahiPassOutEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.WakeUpInCell)
	es.addEventCheck(self, "RahiBusy")

func react(_triggerID, _args):
	if(getFlag("RahiModule.rahi3SceneHappened")):
		return false
	if(!getFlag("RahiModule.rahi2SceneHappened")):
		return false
	setFlag("RahiModule.rahi3SceneHappened", true)
	setFlag("RahiModule.rahi3DayHappened", GM.main.getDays())
	runScene("rahi3RahiPassOutScene")
	return true

func getPriority():
	return 5

func eventCheck(_checkID, _args = []):
	if(!getFlag("RahiModule.rahi3SceneHappened") && getFlag("RahiModule.rahi2SceneHappened")):
		return {busy=true}
