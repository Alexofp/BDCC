extends EventBase

func _init():
	id = "Ch6TaviTalkEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "cellblock_red_nearcell")
	es.addEventCheck(self, "TaviBusy")

func run(_triggerID, _args):
	if(checkCharacterBusy("TaviSlaveryBusy", "Seems like Tavi is not here", "Tavi")):
		return
	
	if(!getFlag("TaviModule.Ch5FoundPunishedTavi")):
		return
	if(GM.main.getDays() <= getFlag("TaviModule.Ch5TaviSavedDay", 0)):
		addDisabledButton("Tavi", "Give her some rest. Come back tomorrow")
		return
	
	addButtonUnlessLate("Tavi", "Talk to the feline", "talk")

func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "talk"):
		if(GM.ES.triggerReact(Trigger.TalkingToNPC, ["taviSlavery"])):
			return
		
		if(!getFlag("TaviModule.Ch6IntroHappened")):
			setFlag("TaviModule.Ch6IntroHappened", true)
			setFlag("TaviModule.Ch6TaviSatisfied", true)
			runScene("Ch6TaviIntroScene")
			return
		
		runScene("Ch6TaviTalkScene")

func eventCheck(_checkID, _args = []):
	if(getFlag("TaviModule.Ch5BigSceneStarted")):
		return {busy=true}
