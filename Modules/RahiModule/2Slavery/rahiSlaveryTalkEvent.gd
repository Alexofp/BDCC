extends EventBase

func _init():
	id = "rahiSlaveryTalkEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "cellblock_orange_nearcell")
	es.addEventCheck(self, "RahiBusy")

func run(_triggerID, _args):
	if(checkCharacterBusy("RahiSlaveryBusy", "Seems like the kitty is not here", "Rahi")):
		return
	
	if(!getFlag("RahiModule.rahi4SceneHappened")):
		return
	if(GM.main.getDays() <= getFlag("RahiModule.rahi4DayHappened", 0)):
		return
	
	addButtonUnlessLate("Rahi", "Talk to the feline", "talk")

func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "talk"):
		if(GM.ES.triggerReact(Trigger.TalkingToNPC, ["rahiSlavery"])):
			return
		
		if(!getFlag("RahiModule.rahi5SceneHappened")):
			setFlag("RahiModule.rahi5SceneHappened", true)
			setFlag("RahiModule.rahiSlaveryDidTaskToday", true)
			runScene("rahi5SlaveryStartScene")
			return
		
		if(!getFlag("RahiModule.rahiSlaveryDidTaskToday")):
			setFlag("RahiModule.rahiSlaveryDidTaskToday", true)
			runScene("rahiSlaveryMorningScene")
		else:
			runScene("rahiSlaveryTalkScene")

func eventCheck(_checkID, _args = []):
	if(getFlag("RahiModule.rahi4SceneHappened")):
		return {busy=true}
