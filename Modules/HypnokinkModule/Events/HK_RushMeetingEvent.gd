extends EventBase

func _init():
	id = "RushMeetingEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "cellblock_red_nearcell")
	
func run(_triggerID, _args):
	if(GM.main.getFlag("HypnokinkModule.KnowAboutRush", false) and GM.main.getFlag("HypnokinkModule.OnTheHouseSessions", 0) <= 0):
		addButtonUnlessLate("Find Rush", "Time to be a hero", "find_rush")

func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "find_rush"):
		if(!getFlag("HypnokinkModule.DidRushIntroduction")):
			runScene("RushIntroduction")
			setFlag("HypnokinkModule.DidRushIntroduction", true)
		else:
			runScene("RushRepeatConversation")
			
			
