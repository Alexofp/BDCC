extends EventBase

func _init():
	id = "Ch2e1ElizaTalkEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.TalkingToNPC, "eliza")
	
func run(_triggerID, _args):
	if(GM.QS.isActive("Ch2ElizaQuest") && !getFlag("TaviModule.ch2ElizaBeganCheckup")):
		addButtonUnlessLate("Mission", "You need to steal the drugs from Eliza", "startcheckup")

func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "startcheckup"):
		GM.main.endCurrentScene()
		runScene("Ch2e1MedicalCheckup")
		setFlag("TaviModule.ch2ElizaBeganCheckup", true)

