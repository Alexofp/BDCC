extends EventBase

func _init():
	id = "ElizaQuestReactEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "med_lobby_start")
	es.addTrigger(self, Trigger.EnteringRoom, "med_lobbymain")

func react(_triggerID, _args):
	if(getFlag("ElizaModule.s2hap") && !getFlag("ElizaModule.s3hap")):
		var amountOfPillsUnlocked:int = GM.main.SCI.getUnlockedStrangePillsCount()
		
		if(amountOfPillsUnlocked >= 3):
			setFlag("ElizaModule.s3hap", true)
			runScene("Eliza3DrugDenIntroScene")
			return true
	if(getFlag("ElizaModule.s3hap") && !getFlag("ElizaModule.s4hap")):
		var amountOfPillsUnlocked:int = GM.main.SCI.getUnlockedStrangePillsCount()
		var amountOfPillsTested:int = GM.main.SCI.getTestedStrangePillsCount()
		
		if(amountOfPillsUnlocked >= 8 && amountOfPillsTested >= 1):
			setFlag("ElizaModule.s4hap", true)
			runScene("Eliza4MomScene")
			return true
	if(getFlag("ElizaModule.s4hap") && !getFlag("ElizaModule.s5hap")):
		var amountOfPillsUnlocked:int = GM.main.SCI.getUnlockedStrangePillsCount()
		var amountOfPillsTested:int = GM.main.SCI.getTestedStrangePillsCount()
		
		if(amountOfPillsUnlocked >= 12 && amountOfPillsTested >= 3):
			setFlag("ElizaModule.s5hap", true)
			runScene("Eliza5UnlockMilkingScene")
			return true
	if(getFlag("ElizaModule.s5hap") && !getFlag("ElizaModule.s6hap")):
		var amountOfPillsUnlocked:int = GM.main.SCI.getUnlockedStrangePillsCount()
		var amountOfPillsTested:int = GM.main.SCI.getTestedStrangePillsCount()
		
		if(amountOfPillsUnlocked >= 15 && amountOfPillsTested >= 6):
			setFlag("ElizaModule.s6hap", true)
			runScene("Eliza6DateOfferScene")
			return true
	return false

func getPriority():
	return 1
