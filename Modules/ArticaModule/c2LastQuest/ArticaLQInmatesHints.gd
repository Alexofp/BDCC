extends EventBase

func _init():
	id = "ArticaLQInmatesHints"

func registerTriggers(es):
	es.addTrigger(self, Trigger.DefeatedDynamicNPC)

func run(_triggerID, _args):
	if(getFlag("ArticaModule.lastQuestStarted") && !getFlag("ArticaModule.LQArticaGotDreamCatcher") && !getFlag("ArticaModule.LQArticaGotBrainwashed")):
		if(getFlag("ArticaModule.lqLastNPC", "") == _args[0]):
			addDisabledButton("Interogate", "You already interogated them")
		else:
			var character = getCharacter(_args[0])
			if(character != null && character.getCharacterType() == CharacterType.Inmate):
				addButton("Interogate", "See if they know something about Artica's dreamcatcher", "dointerogate", [_args[0]])

func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "dointerogate"):
		setFlag("ArticaModule.lqLastNPC", _args[0])
		
		var clueNumber = getFlag("ArticaModule.lqClues", 0)
		var allClues = getModule("ArticaModule").getLastQuestHints()

		if(clueNumber < allClues.size()):
			addMessage("The inmate told you some information about Artica's dreamcatcher. New hint is:")
			addMessage("'"+allClues[clueNumber]+"'")
			addMessage("You can see all your learned hints in the task list.")
			addExperienceToPlayer(10)
			increaseFlag("ArticaModule.lqClues")
		else:
			addMessage("This inmate doesn't know anything new.. Looks like that's all the hints you're gonna get!")
			addMessage("You can see all your learned hints in the task list.")
		
		GM.main.reRun()
