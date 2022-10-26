extends EventBase

func _init():
	id = "Ch2a1AlexTalkEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.TalkingToNPC, "alexrynard")
	
func run(_triggerID, _args):
	if(GM.QS.isActive("Ch2AlexQuest") && !getFlag("TaviModule.ch2AlexTalkedTo")):
		addButtonUnlessLate("Mission", "You must figure out how to get to the bluespace transmitter", "startch2quest")

func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "startch2quest"):
		GM.main.endCurrentScene()
		runScene("Ch2a1AlexTalkScene")
		setFlag("TaviModule.ch2AlexTalkedTo", true)

