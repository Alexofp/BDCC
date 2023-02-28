extends EventBase

func _init():
	id = "rahi2RahiEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.TalkingToNPC, "rahi")
	
func run(_triggerID, _args):
	if(GM.QS.isActive("RahiSlaveryQuest") && !getFlag("RahiModule.rahi2SceneHappened")):
		addButtonUnlessLate("Alcohol", "Talk with the kitty about the alcohol", "rahitalk")

func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "rahitalk"):
		GM.main.endCurrentScene()
		runScene("rahi2RahiScene")
		setFlag("RahiModule.rahi2SceneHappened", true)

