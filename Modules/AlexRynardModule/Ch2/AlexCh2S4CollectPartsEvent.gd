extends EventBase

func _init():
	id = "AlexCh2S4CollectPartsEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.DefeatedDynamicNPC)
	es.addTrigger(self, Trigger.EnteringRoom, "eng_storage")

func arun(_triggerID, _args):
	if(!GM.main.getModuleFlag("CellblockModule", "Cellblock_GreenhouseLooted", false)):
		addButtonUnlessLate("Steal", "Try and steal something", "steal_apple")
	else:
		addDisabledButton("Steal", "Too dangerous to do this again today")
	
func run(_triggerID, _args):
	if(getFlag("AlexRynardModule.ch2CheckAlexSceneHappened") && !getFlag("AlexRynardModule.ch2FinalSceneHappened")):
		if(_triggerID == Trigger.DefeatedDynamicNPC):
			if(getFlag("AlexRynardModule.ch2LastCheckedNPC", "") == _args[0]):
				addDisabledButton("Parts!", "You already checked them")
			else:
				var character = getCharacter(_args[0])
				if(character != null && character.getCharacterType() == CharacterType.Engineer):
					addButton("Parts!", "See if they have the required parts", "checkparts", [_args[0]])
		if(_triggerID == Trigger.EnteringRoom):
			if(getFlag("AlexRynardModule.ch2StolePartsStorageDay", -1) >= GM.main.getDays()):
				addDisabledButton("Parts!", "You have already searched for parts today")
			else:
				addButton("Parts!", "Steal some parts for Alex", "stealparts")

func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "stealparts"):
		setFlag("AlexRynardModule.ch2StolePartsStorageDay", GM.main.getDays())
		increaseFlag("AlexRynardModule.ch2FoundParts", 5)
		addExperienceToPlayer(50)
		addMessage("You have found 5 parts that Alex needs. You now have.. "+str(getFlag("AlexRynardModule.ch2FoundParts", 0)))
		if(getFlag("AlexRynardModule.ch2FoundParts", 0) >= 10):
			addMessage("You have all the required parts, go talk to Eliza!")
		GM.main.reRun()
	
	if(_method == "checkparts"):
		setFlag("AlexRynardModule.ch2LastCheckedNPC", _args[0])
		increaseFlag("AlexRynardModule.ch2FoundParts")
		
		addExperienceToPlayer(10)
		addMessage("You have found one of the parts that Alex needs. You now have.. "+str(getFlag("AlexRynardModule.ch2FoundParts", 0)))
		if(getFlag("AlexRynardModule.ch2FoundParts", 0) >= 10):
			addMessage("You have all the required parts, go talk to Eliza!")
		GM.main.reRun()
