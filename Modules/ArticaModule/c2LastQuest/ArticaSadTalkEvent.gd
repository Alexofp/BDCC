extends EventBase

func _init():
	id = "ArticaSadTalkEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "cellblock_lilac_nearcell")

func run(_triggerID, _args):
	if(getFlag("ArticaModule.lastQuestStarted") && !getFlag("ArticaModule.LQArticaGotDreamCatcher") && !getFlag("ArticaModule.LQArticaGotBrainwashed")):
		if(checkCharacterBusy("ArticaBusy", "Seems like the fluff is not here", "Artica")):
			return

		addButtonUnlessLate("Artica", "Talk with the herm fluff", "talk")
		return
	
func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "talk"):
		GM.main.applyWorldEdit("ArticaWorldEdit")
		if(getCharacter("artica").hasEffect(StatusEffect.ArticaFullWithPlantEggs)):
			var fullWithEggs = getCharacter("artica").getEffect(StatusEffect.ArticaFullWithPlantEggs)
			if(fullWithEggs.turns <= 0):
				runScene("articaEventTentacles4Scene")
				return
		
		if(!GM.ES.triggerReact(Trigger.TalkingToNPC, ["artica"])):
			runScene("articaSadTalkScene")
