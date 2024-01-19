extends EventBase

func _init():
	id = "AlexCh2s4ElizaEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.TalkingToNPC, "eliza")
	
func run(_triggerID, _args):
	if(getFlag("AlexRynardModule.ch2GotRektHappened") && !getFlag("AlexRynardModule.ch2CheckAlexSceneHappened")):
		if(GM.main.getDays() <= getFlag("AlexRynardModule.ch2GotRektDay", -1)):
			addDisabledButton("Alex", "Come back another day to check on Alex")
		else:
			addButtonUnlessLate("Alex", "Ask about Alex", "startElizaScene")
	
	if(getFlag("AlexRynardModule.ch2CheckAlexSceneHappened") && getFlag("AlexRynardModule.ch2FoundParts", 0) >= 10 && !getFlag("AlexRynardModule.ch2FinalSceneHappened")):
		addButtonUnlessLate("Alex", "Give Eliza the parts that you have collected!", "startLastScene")

func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "startElizaScene"):
		GM.main.endCurrentScene()
		setFlag("AlexRynardModule.ch2CheckAlexSceneHappened", true)
		runScene("AlexCh2s4ElizaScene")

	if(_method == "startLastScene"):
		GM.main.endCurrentScene()
		setFlag("AlexRynardModule.ch2FinalSceneHappened", true)
		runScene("AlexCh2s5FinalScene")
