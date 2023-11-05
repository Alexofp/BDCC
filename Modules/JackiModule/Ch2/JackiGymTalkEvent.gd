extends EventBase

func _init():
	id = "JackiGymTalkEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "gym_yoga")

func run(_triggerID, _args):
	if(!getFlag("JackiModule.Jacki_StocksSceneHappened")):
		return
	if(getFlag("JackiModule.Jacki_ContentDisabled")):
		return
	
	if(checkCharacterBusy("JackiBusy", "Seems like Jacki is not here", "Jacki")):
		return
	

	if(GM.main.getDays() < getFlag("JackiModule.jackiBusyUntil", -1)):
		saynn("Looks like Jacki is not here today.")
		addDisabledButton("Jacki", "She is not here today. Come back some other day")
		return
	saynn("Looks like Jacki is doing yoga here.")
	addButtonUnlessLate("Jacki", "Talk to the wolfie", "talk")

func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "talk"):
		if(GM.ES.triggerReact(Trigger.TalkingToNPC, ["jacki"])):
			return

		if(!getFlag("JackiModule.Jacki_ch2IntroSceneHappened")):
			getCharacter("jacki").removeAllRestraints()
			setFlag("JackiModule.Jacki_ch2IntroSceneHappened", true)
			runScene("jackiCh2s1Intro")
			return
		
		var jackiCorruption = getFlag("JackiModule.jackiCorruption", 0.0)
		var jackiLust = getFlag("JackiModule.jackiLust", 0.0)
		if(!getFlag("JackiModule.Jacki_punchingBagSceneHappened") && (jackiCorruption >= 0.4 || jackiLust >= 0.4)):
			runScene("jackiPunchingBagScene")
			setFlag("JackiModule.Jacki_punchingBagSceneHappened", true)
			return
		if(!getFlag("JackiModule.Jacki_urinalSceneHappened") && (jackiCorruption >= 1.0 || jackiLust >= 1.0)):
			runScene("jackiUrinalScene")
			setFlag("JackiModule.Jacki_urinalSceneHappened", true)
			return
		
		runScene("jackiCh2s2GymScene")

