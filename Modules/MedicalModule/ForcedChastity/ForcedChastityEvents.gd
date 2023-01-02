extends EventBase

func _init():
	id = "ForcedChastityEvents"

func registerTriggers(es):
	es.addTrigger(self, Trigger.WakeUpInCell)

func react(_triggerID, _args):
	if(!getFlag("MedicalModule.PC_ReceivedPermanentCage")):
		return false
	
	if(getFlag("MedicalModule.Chastity_Event5LockedForever") && !getFlag("MedicalModule.Chastity_ReceivedRing")):
		setFlag("MedicalModule.Chastity_ReceivedRing", true)
		runScene("ForcedChastityReceiveRingScene")
		return true
	
	if(GM.pc.isWearingPortalPanties()):
		return false
	if(getFlag("MedicalModule.Eliza_BusyDays", 0) > 0):
		return false
	if(!GM.pc.getInventory().hasItemIDEquipped("ChastityCagePermanent") && !GM.pc.getInventory().hasItemIDEquipped("ChastityCagePermanentNormal")):
		return false
	
	var lastDayEventHappened = getFlag("MedicalModule.Chastity_LastEventDay", 0)
	if(GM.main.getDays() < (lastDayEventHappened + 5)): #5 is default. Switch to 1 for testing
		return false
	
	var currentEventNumber = getFlag("MedicalModule.Chastity_EventNumber", 0)
	
	#						DON'T FORGET THESE
	if(currentEventNumber in [0, 1, 2, 3, 4, 5, 6]):
		setFlag("MedicalModule.Chastity_LastEventDay", GM.main.getDays())
		GM.pc.removeAllRestraints()
		
		if(currentEventNumber == 0):
			setFlag("MedicalModule.Chastity_EventNumber", 1)
			runScene("ForcedChastityScene1")
		if(currentEventNumber == 1):
			setFlag("MedicalModule.Chastity_EventNumber", 2)
			runScene("ForcedChastityScene2")
		if(currentEventNumber == 2):
			setFlag("MedicalModule.Chastity_EventNumber", 3)
			runScene("ForcedChastityScene3")
		if(currentEventNumber in [3, 5]):
			var choosenScene = getFlag("MedicalModule.Chastity_FirstChosenPerson", "rahi")
			if(currentEventNumber == 5):
				choosenScene = getFlag("MedicalModule.Chastity_SecondChosenPerson", "rahi")
			
			if(choosenScene == "rahi"):
				setFlag("MedicalModule.Chastity_EventNumber", currentEventNumber + 1)
				runScene("ForcedChastityOptionalRahiScene")
			if(choosenScene == "risha"):
				setFlag("MedicalModule.Chastity_EventNumber", currentEventNumber + 1)
				runScene("ForcedChastityOptionalRishaScene")
			if(choosenScene == "eliza"):
				setFlag("MedicalModule.Chastity_EventNumber", currentEventNumber + 1)
				runScene("ForcedChastityOptionalElizaScene")
			if(choosenScene == "tavi"):
				setFlag("MedicalModule.Chastity_EventNumber", currentEventNumber + 1)
				runScene("ForcedChastityOptionalTaviScene")
			if(choosenScene == "nova"):
				setFlag("MedicalModule.Chastity_EventNumber", currentEventNumber + 1)
				runScene("ForcedChastityOptionalNovaScene")
		if(currentEventNumber == 4):
			setFlag("MedicalModule.Chastity_EventNumber", 5)
			runScene("ForcedChastityScene5")
		if(currentEventNumber == 6):
			setFlag("MedicalModule.Chastity_EventNumber", 7)
			runScene("ForcedChastityScene7")
		
		return true
	
	return false

func getPriority():
	return 10

