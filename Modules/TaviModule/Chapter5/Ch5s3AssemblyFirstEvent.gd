extends EventBase

func _init():
	id = "Ch5s3AssemblyFirstEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "eng_assemblylab")
	
func run(_triggerID, _args):
	if(getFlag("TaviModule.Ch5NewPlanSceneHappend") && !getFlag("TaviModule.Ch5SearchedLabFirstTime")):
		addButton("Mission", "Search for the prototype grenade", "startscene")

func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "startscene"):
		runScene("Ch5s3AssemblyFirstScene")
		setFlag("TaviModule.Ch5SearchedLabFirstTime", true)
