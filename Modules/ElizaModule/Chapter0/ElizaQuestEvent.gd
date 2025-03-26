extends EventBase

func _init():
	id = "ElizaQuestEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.TalkingToNPC, "eliza")
	es.addTrigger(self, Trigger.EnteringRoom, "med_lobbymain")

func run(_triggerID, _args):
	if(_triggerID == Trigger.TalkingToNPC):
		var amountOfNurseryTasks:int = GM.main.SCI.getAmountOfCompletedNurseryTasks()
		
		if(getFlag("ElizaModule.s0hap") && !getFlag("ElizaModule.s1hap") && amountOfNurseryTasks >= 3):
			addButton("Lab Assistant", "Tell Eliza that you have completed the nursery bounties", "s1")
			
		if(getFlag("ElizaModule.s1hap") && !getFlag("ElizaModule.s2hap") && GM.main.SCI.doesPCHaveUnknownStrangePills()):
			addButton("Strange pill!", "Make Eliza scan the strange pill that you have", "s2")
		
		if(getFlag("ElizaModule.s6DateHap") && !getFlag("ElizaModule.s7hap")):
			var amountOfPillsUnlocked:int = GM.main.SCI.getUnlockedStrangePillsCount()
			var amountOfPillsTested:int = GM.main.SCI.getTestedStrangePillsCount()
			
			if(amountOfPillsUnlocked >= GM.main.SCI.getTotalStrangePillCount() && amountOfPillsTested >= 10):
				addButton("Story..", "Tell Eliza that all of the drugs are unlocked now and most of them are tested.", "s7")
			else:
				addDisabledButton("Story..", "Unlock all of the pills and test at least 10 of them in order to finish Eliza's story.")
				
	else:
		if(getFlag("ElizaModule.s6hap") && !getFlag("ElizaModule.s6DateHap")):
			if(GM.main.isVeryLate()):
				addButton("Meet Eliza", "Chill together with Eliza", "s6date")
			else:
				addDisabledButton("Meet Eliza", "You can meet Eliza after her shift ends at 23:00")
		

func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "s1"):
		GM.main.endCurrentScene()
		setFlag("ElizaModule.s1hap", true)
		runScene("Eliza1DrugIntroScene")
	if(_method == "s2"):
		GM.main.endCurrentScene()
		setFlag("ElizaModule.s2hap", true)
		GM.pc.getInventory().removeFirstOf("TFPill")
		runScene("Eliza2FirstDrugScene")
	if(_method == "s6date"):
		setFlag("ElizaModule.s6DateHap", true)
		runScene("Eliza6DateScene")
	if(_method == "s7"):
		GM.main.endCurrentScene()
		setFlag("ElizaModule.s7hap", true)
		setFlag("ElizaModule.storyCompleted", true)
		runScene("Eliza7EndingScene")
