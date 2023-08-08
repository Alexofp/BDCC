extends EventBase

func _init():
	id = "Ch5s7BElizaTaviEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.TalkingToNPC, "eliza")
	
func run(_triggerID, _args):
	if(getFlag("TaviModule.Ch5BigSceneStarted") && !getFlag("TaviModule.Ch5FoundPunishedTavi")):
		addButtonUnlessLate("Tavi?", "Ask her about Tavi", "starttavi")

func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "starttavi"):
		GM.main.endCurrentScene()
		runScene("Ch5s7BElizaTaviScene")
		setFlag("TaviModule.Ch5FoundPunishedTavi", true)

