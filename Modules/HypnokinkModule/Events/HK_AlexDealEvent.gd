extends EventBase

func _init():
	id = "AlexVionDealEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.TalkingToNPC, "alexrynard")
	
func run(_triggerID, _args):
	if(getFlag("HypnokinkModule.Vion_HaveCage")):
		addButtonUnlessLate("Return datapad", "Give Alex back his datapad and Vion's cage", "finish_deal")
		return
	
	if(not getFlag("HypnokinkModule.VionTopicKnown_Chastity") or getFlag("HypnokinkModule.Vion_HaveDatapad") or getFlag("HypnokinkModule.Vion_FreedFromCage")):
		return
		
	if(not getFlag("AlexRynardModule.ch1HypnovisorHappened")):
		addDisabledButton("Vion's issue", "Better wait till Alex is more friendly with you")
	else:
		addButtonUnlessLate("Vion's issue", "Maybe Alex knows where to get the gizmo Vion wanted", "make_deal")

func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "make_deal"):
		GM.main.endCurrentScene()
		runScene("Alex_TalkAboutVion")
	if(_method == "finish_deal"):
		GM.main.endCurrentScene()
		runScene("Alex_GiveCage")
