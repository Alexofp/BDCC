extends EventBase

func _init():
	id = "TaviQuest2SkarEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "cd_near_captain_office")

func react(_triggerID, _args):
	if(GM.QS.isCompleted("TaviQuest2")):
		return false
	if(!GM.main.getModuleFlag("TaviModule", "Tavi_Quest2Started", false)):
		return false
	if(!GM.main.getModuleFlag("TaviModule", "Tavi_Quest2MetHer", false)):
		return false
	
	runScene("TaviQuest2Skar")
	return true

func getPriority():
	return 10

