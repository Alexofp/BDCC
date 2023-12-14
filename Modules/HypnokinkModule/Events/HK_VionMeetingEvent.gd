extends EventBase

func _init():
	id = "HK_VionMeetingEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "cellblock_lilac_nearcell")
	
func run(_triggerID, _args):
	if(!getFlag("HypnokinkModule.DidVionIntroduction")):
		addButtonUnlessLate("Cell 609", "Take a peek in a random cell", "enter_cell")
	else:
		addButtonUnlessLate("Vion's cell", "Talk to Vion", "enter_cell")

func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "enter_cell"):
		if(!getFlag("HypnokinkModule.DidVionIntroduction")):
			runScene("HK_VionIntroduction")
			setFlag("HypnokinkModule.DidVionIntroduction", true)
		else:
			runScene("HK_VionRepeatConversation")
			
