extends EventBase

func _init():
	id = "Ch2t3TaviTalkEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.TalkingToNPC, "tavi")
	
func run(_triggerID, _args):
	if(GM.QS.isCompleted("Ch2ElizaQuest") && !getFlag("TaviModule.ch2DrugsGaveToTavi")):
		addButtonUnlessLate("Drugs", "Show her the drugs you stole", "tavidrugs")

func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "tavidrugs"):
		GM.main.endCurrentScene()
		runScene("Ch2t3TaviDrugsScene")
		setFlag("TaviModule.ch2DrugsGaveToTavi", true)

