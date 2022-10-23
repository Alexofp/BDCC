extends EventBase

func _init():
	id = "JackiFirstEncounterEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "yard_westCorridor")
	es.addTrigger(self, Trigger.EnteringRoom, "yard_eastCorridor")

func react(_triggerID, _args):
	if(getFlag("JackiModule.Jacki_FirstTimeEncountered") || GM.pc.getSkillsHolder().getLevel() < 5):
		return false
		
	setFlag("JackiModule.Jacki_FirstTimeEncountered", true)
	setFlag("JackiModule.BathroomBulliesSceneWillHappen", true)
	runScene("JackiFirstEncounterScene")
	return true

func getPriority():
	return 10
