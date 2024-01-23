extends EventBase

func _init():
	id = "VionMeetingEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "cellblock_lilac_nearcell")
	
func run(_triggerID, _args):
	if(getFlag("Mining_IntroducedToMinning", false)):
		if(!getFlag("HypnokinkModule.DidVionIntroduction")):
			addButtonUnlessLate("Random cell", "Take a peek in a random cell", "enter_cell")
		else:
			addButtonUnlessLate("Vion's cell", "Talk to Vion", "enter_cell")

func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "enter_cell"):
		if(!getFlag("HypnokinkModule.DidVionIntroduction")):
			runScene("VionIntroduction")
			setFlag("HypnokinkModule.DidVionIntroduction", true)
		else:
			runScene("VionRepeatConversation")
			
