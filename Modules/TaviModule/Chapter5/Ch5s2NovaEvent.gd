extends EventBase

func _init():
	id = "Ch5s2NovaEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.TalkingToNPC, "nova")
	
func run(_triggerID, _args):
	if(getFlag("TaviModule.Ch5NewPlanSceneHappend") && !getFlag("TaviModule.Ch5StoleDatapadFromNova") && !getFlag("TaviModule.Ch5StoleDatapadFromGuard")):
		addButtonUnlessLate("Mission", "You must get her datapad for Tavi", "startnova")

func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "startnova"):
		GM.main.endCurrentScene()
		runScene("Ch5s2NovaScene")
