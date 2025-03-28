extends EventBase

func _init():
	id = "ElizaTalkEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "med_lobbymain")

func run(_triggerID, _args):
	if(checkCharacterBusy("ElizaBusy", "Seems like Doctor Quinn is not here", "Dr. Quinn")):
		return
	
	if(getFlag("MedicalModule.Mental_PlayerEscaped") || getFlag("MedicalModule.Eliza_BusyDays", 0) > 0):
		addDisabledButton("Dr. Quinn", "She is not here")
	else:
		saynn("A doctor is sitting behind the counter")
		addButtonUnlessLate("Dr. Quinn", "Talk to the doctor", "talk")

func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "talk"):
		if(!getCharacter("eliza").getInventory().hasItemIDEquipped("LabcoatOutfit")):
			getCharacter("eliza").resetEquipment()
		runScene("ElizaTalkScene")
