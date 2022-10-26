extends EventBase

func _init():
	id = "AlexRynardFirstTalkEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "mining_shafts_entering")
	
func run(_triggerID, _args):
	if(getFlag("Mining_IntroducedToMinning") && !getFlag("PortalPantiesModule.Alex_FirstTimeTalked")):
		if(getFlag("PortalPantiesModule.Alex_BusyDays", 0) > 0):
			addDisabledButton("Alex", "He is not here today")
		else:
			addButtonUnlessLate("Alex", "Approach the fox engineer", "alexfirst")

func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "alexfirst"):
		runScene("AlexRynardFirstTimeTalk")
		setFlag("PortalPantiesModule.Alex_FirstTimeTalked", true)
		GM.main.applyWorldEdit("AlexRynardWorldEdit")
