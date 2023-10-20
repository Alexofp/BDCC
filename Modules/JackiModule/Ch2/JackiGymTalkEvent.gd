extends EventBase

func _init():
	id = "JackiGymTalkEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "gym_yoga")

func run(_triggerID, _args):
	if(!getFlag("JackiModule.Jacki_StocksSceneHappened")):
		return
	
	if(checkCharacterBusy("JackiBusy", "Seems like Jacki is not here", "Jacki")):
		return
	

	#if(GM.main.getDays() <= getFlag("TaviModule.Ch5TaviSavedDay", 0)):
	#	addDisabledButton("Tavi", "Give her some rest. Come back tomorrow")
	#	return
	saynn("Looks like Jacki is doing yoga here.")
	addButtonUnlessLate("Jacki", "Talk to the wolfie", "talk")

func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "talk"):
		if(GM.ES.triggerReact(Trigger.TalkingToNPC, ["jacki"])):
			return
		
		if(!getFlag("JackiModule.Jacki_ch2IntroSceneHappened")):
			setFlag("JackiModule.Jacki_ch2IntroSceneHappened", true)
			runScene("jackiCh2s1Intro")
			return
		
		runScene("jackiCh2s2GymScene")

