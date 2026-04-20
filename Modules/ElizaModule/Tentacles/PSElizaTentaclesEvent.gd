extends EventBase

func _init():
	id = "PSElizaTentaclesEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.TalkingToNPC, "eliza")
	es.addTrigger(self, Trigger.WakeUpInCell)

func react(_triggerID, _args):
	if(getFlag("ElizaModule.tent_returnedegged", false) || getFlag("ArticaModule.gaveBirthToEggs", false)):
		if(!getFlag("ElizaModule.tent_started", false)):
			setFlag("ElizaModule.tent_started", true)
			runScene("PSElizaTentaclesIntro", [!getFlag("ElizaModule.tent_returnedegged", false)])
			return true
	
	if(getFlag("ElizaModule.tent_eliza", false) && !getFlag("ElizaModule.tent_elizaAnnoy", false)):
		setFlag("ElizaModule.tent_elizaAnnoy", true)
		runScene("PSElizaEggedUpAnnoyed")
		return true
	return false

func run(_triggerID, _args):
	if(_triggerID == Trigger.TalkingToNPC):
		if(getFlag("ElizaModule.tent_started", false) && !getFlag("ElizaModule.tent_born", false)):
			if(!getFlag("ElizaModule.tent_firstegg", false)):
				if (GM.pc.getInventory().hasItemID("PlantEgg")):
					addButton("Give plant egg!", "Give Eliza the tentacle egg that she wanted", "doFirst")
				else:
					addDisabledButton("Give plant egg!", "You don't have any tentacle eggs to give to Eliza..")
			else:
				addButton("Plant eggs..", "Talk about the tentacle eggs with Eliza", "giveEgg")
	

func getPriority():
	return 10

func onButton(_method, _args):
	if(_method == "doFirst"):
		GM.main.endCurrentScene()
		GM.pc.getInventory().removeXOfOrDestroy("PlantEgg", 1)
		setFlag("ElizaModule.tent_firstegg", true)
		runScene("PSElizaTentaclesFirstEgg")
	if(_method == "giveEgg"):
		GM.main.endCurrentScene()
		runScene("PSElizaTentaclesGiveEgg")
