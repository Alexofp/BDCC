extends EventBase

func _init():
	id = "VionMeetingEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "cellblock_lilac_nearcell")
	
func run(_triggerID, _args):
	if(not getFlag("Mining_IntroducedToMinning", false)):
		addDisabledButton("Cell 609", "You should head to the mines before poking around")
	elif(GM.main.getDays() < 4):
		addDisabledButton("Cell 609", "Better spend a few days getting used to the prison before you start poking around")
	else:
		if(!getFlag("HypnokinkModule.DidVionIntroduction")):
			addButtonUnlessLate("Cell 609", "Take a peek in a random cell", "enter_cell")
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
			
