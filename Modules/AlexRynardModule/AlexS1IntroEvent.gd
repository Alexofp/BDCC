extends EventBase

func _init():
	id = "AlexS1IntroEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.TalkingToNPC, "alexrynard")
	
func run(_triggerID, _args):
	# Must finish portal panties quest first
	if(!getFlag("PortalPantiesModule.Panties_FleshlightsReturnedToAlex") && !getFlag("PortalPantiesModule.Panties_PcDenied")):
		return
	
	if(!getFlag("AlexRynardModule.ch1IntroSceneHappened")):
		addButtonUnlessLate("Lewd?", "Ask if he would be up for some sexy stuff", "startIntro")

func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "startIntro"):
		GM.main.endCurrentScene()
		runScene("AlexS1IntroScene")
