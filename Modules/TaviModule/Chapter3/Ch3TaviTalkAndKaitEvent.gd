extends EventBase

func _init():
	id = "Ch3TaviTalkAndKaitEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.TalkingToNPC, "tavi")
	
func run(_triggerID, _args):
	if(GM.QS.isActive("Ch3TaviQuest") && !getFlag("TaviModule.ch3StartedInfiltration") && getFlag("TaviModule.ch2DrugsGaveToTavi")):
		addButtonUnlessLate("Mission", "Time to do this", "start")

func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "start"):
		GM.main.endCurrentScene()
		runScene("Ch3s1TaviAndKaitScene")
		#setFlag("TaviModule.ch2AlexTalkedTo", true)

