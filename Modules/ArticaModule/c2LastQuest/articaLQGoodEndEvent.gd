extends EventBase

func _init():
	id = "articaLQGoodEndEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.TalkingToNPC, "rahi")
	es.addTrigger(self, Trigger.TalkingToNPC, "rahiSlavery")
	
func run(_triggerID, _args):
	if(getFlag("ArticaModule.lastQuestStarted") && !getFlag("ArticaModule.LQArticaGotDreamCatcher") && !getFlag("ArticaModule.LQArticaGotBrainwashed")):
		saynn("You notice.. that she is sneakily playing with something.")
		
		addButton("Something..", "What is that kitty doing?", "goodend")

func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "goodend"):
		GM.main.endCurrentScene()
		runScene("articaLastQuest2Scene")

