extends EventBase

func _init():
	id = "Ch4s8KaitEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "cellblock_lilac_nearcell")
	
func run(_triggerID, _args):
	if(GM.QS.isActive("Ch3TaviQuest") && !getFlag("TaviModule.Ch4KaitSceneHappened") && getFlag("TaviModule.Ch4ServedPunishment")):
		
		if(GM.main.getTime() <= 7*60*60):
			addButtonWithChecks("Kait", "Look around for Kait and 'ask' her some questions.", "kait", [], [ButtonChecks.NotHandsBlocked, ButtonChecks.NotArmsRestrained, ButtonChecks.NotBlindfolded])
		else:
			addDisabledButton("Kait", "Kait is not here currently. Come back during the mornings before 7am")
	
func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "kait"):
		runScene("Ch4s8KaitScene")
		setFlag("TaviModule.Ch4KaitSceneHappened", true)
	
