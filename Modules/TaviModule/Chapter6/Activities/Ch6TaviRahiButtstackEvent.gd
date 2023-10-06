extends EventBase

func _init():
	id = "Ch6TaviRahiButtstackEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.WakeUpInCell)

func react(_triggerID, _args):
	if(getFlag("TaviModule.Ch6TaviAndRahiStackSceneHappened")):
		return false
	if(getModule("TaviModule").getSkillScore("taviSkillPetplay") < 7 || getModule("RahiModule").getSkillScore("rahiSkillPetplay") < 15):
		return false
	if(getCharacter("tavi").isVisiblyPregnant() || getCharacter("rahi").isVisiblyPregnant()):
		return false
	if(GM.pc.hasBoundArms() || GM.pc.hasBoundLegs() || GM.pc.hasBlockedHands() || GM.pc.isBlindfolded() || GM.pc.isGagged()):
		return false
	
	setFlag("TaviModule.Ch6TaviAndRahiStackSceneHappened", true)
	runScene("Ch6TaviRahiButtstackScene", [true])
	return true

func getPriority():
	return 10

