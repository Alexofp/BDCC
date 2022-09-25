extends EventBase

func _init():
	id = "Ch1s1ApproachingTaviEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.TalkingToNPC, "tavi")

func react(_triggerID, _args):
	if(GM.QS.isCompleted("TaviQuest2") && !getFlag("TaviModule.ch1ApproachedAfterQuest2")):
		
		runScene("Ch1s1ApproachingTavi")
		setFlag("TaviModule.ch1ApproachedAfterQuest2", true)
		return true
	
func getPriority():
	return 20
