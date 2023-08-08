extends EventBase

func _init():
	id = "Ch5s2DefeatedGuardEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.DefeatedDynamicNPC)
	
func run(_triggerID, _args):
	if(getFlag("TaviModule.Ch5NewPlanSceneHappend") && !getFlag("TaviModule.Ch5StoleDatapadFromNova") && !getFlag("TaviModule.Ch5StoleDatapadFromGuard")):
		if(getFlag("TaviModule.Ch5LastGuardLooted", "") == _args[0]):
			addDisabledButton("Datapad", "You already checked them")
		else:
			var character = getCharacter(_args[0])
			if(character.getCharacterType() == CharacterType.Guard):
				addButton("Datapad", "See if they have a datapad", "checkdatapad", [_args[0]])

func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "checkdatapad"):
		setFlag("TaviModule.Ch5LastGuardLooted", _args[0])
		increaseFlag("TaviModule.Ch5GuardsLooted")
		
		var amountLooted = getFlag("TaviModule.Ch5GuardsLooted", 0)
		if((RNG.chance(10) && amountLooted > 0) || amountLooted > 3):
			addMessage("This guard had a datapad! You took it. Task updated!")
			addExperienceToPlayer(100)
			setFlag("TaviModule.Ch5StoleDatapadFromGuard", true)
		else:
			addMessage("This guard doesn't have a datapad. You gotta check someone else.")
		GM.main.reRun()
