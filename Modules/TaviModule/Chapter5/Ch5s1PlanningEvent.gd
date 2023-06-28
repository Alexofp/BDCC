extends EventBase

func _init():
	id = "Ch5s1PlanningEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.SleepInCell)

func react(_triggerID, _args):
	if(getFlag("TaviModule.Ch4KaitSceneHappened") && !getFlag("TaviModule.Ch5NewPlanSceneHappend")):
		
		runScene("Ch5s1PlanningScene")
		setFlag("TaviModule.Ch5NewPlanSceneHappend", true)
		return true
	
func getPriority():
	return 20
