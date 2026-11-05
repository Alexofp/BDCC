extends EventBase

func _init():
	id = "KaitFirstTimePregnantEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "hideout_middle")
	es.addTrigger(self, Trigger.EnteringRoom, "hideout_hq")

func react(_triggerID, _args):
	if(!GM.main.MS.isCompleted("Mission0")):
		return false
	
	if(!getFlag("KaitModule.ftphap", false) && getCharacter("kait").isVisiblyPregnant() && (getFlag("KaitModule.gotKaitPregMaybe", false) || getCharacter("kait").isPregnantFrom("pc"))):
		setFlag("KaitModule.ftphap", true)
		runScene("KaitFirstTimePregnantScene")
		return true
	
	return false

func getPriority():
	return 12
