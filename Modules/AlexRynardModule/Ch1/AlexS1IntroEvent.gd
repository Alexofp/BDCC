extends EventBase

func _init():
	id = "AlexS1IntroEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.TalkingToNPC, "alexrynard")
	
func run(_triggerID, _args):
	# Must finish portal panties quest first
	if(!getFlag("PortalPantiesModule.Panties_FleshlightsReturnedToAlex") && !getFlag("PortalPantiesModule.Panties_PcDenied")):
		return
	if(getFlag("AlexRynardModule.ch1StopAlexContent")):
		return
	
	if(getFlag("AlexRynardModule.ch2SceneNum", 0) >= 1):
		addButtonUnlessLate("Trust exercises", "Check them out", "do_trust")
	
	
	if(!getFlag("AlexRynardModule.ch1IntroSceneHappened")):
		addButtonUnlessLate("Lewd?", "Ask if he would be up for some sexy stuff", "startIntro")
		return
	
	if(!getFlag("AlexRynardModule.ch1FirstFuckup")):
		addButtonUnlessLate("Watch", "Watch Alex work", "watchWork")
		return
	
	if(getFlag("AlexRynardModule.ch1NextDaySceneHappened") && !getFlag("AlexRynardModule.ch1HypnovisorHappened")):
		addButtonUnlessLate("Help", "Help him repair the datapads", "helpRepair")
		return
	

	addButtonUnlessLate("Help", "Help him repair the datapads", "helpRepair2")
	
func react(_triggerID, _args):
	if(getFlag("AlexRynardModule.ch1FirstFuckup") && !getFlag("AlexRynardModule.ch1NextDaySceneHappened")):
		setFlag("AlexRynardModule.ch1NextDaySceneHappened", true)
		runScene("AlexS3NextDayScene")
		return true
	
	return false

func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "startIntro"):
		GM.main.endCurrentScene()
		runScene("AlexS1IntroScene")
	if(_method == "helpRepair"):
		GM.main.endCurrentScene()
		runScene("AlexS4FixingDatapadsScene")
	if(_method == "helpRepair2"):
		GM.main.endCurrentScene()
		runScene("AlexCh2s1Scene")
	if(_method == "watchWork"):
		GM.main.endCurrentScene()
		runScene("AlexS2SittingNearScene")
	if(_method == "do_trust"):
		GM.main.endCurrentScene()
		runScene("AlexTrustExercisesMenuScene")
