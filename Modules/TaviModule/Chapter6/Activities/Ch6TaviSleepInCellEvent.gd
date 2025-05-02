extends EventBase

func _init():
	id = "Ch6TaviSleepInCellEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.SleepInCell)

func react(_triggerID, _args):
	if(!getFlag("TaviModule.Ch6TaviAllowedToSleepInPCCell")):
		return false
	#ACEPREGEXPAC = Tavi can sleep in your cell if she is pregnant
#	if(getCharacter("tavi").isVisiblyPregnant()):
#		return false
	
	runScene("Ch6TaviSleepInCellScene")
	return true

func getPriority():
	return 10
