extends EventBase

func _init():
	id = "AvyApproachAfterRektEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.TalkingToNPC, "avy")
	
func react(_triggerID, _args):
	if(getFlag("FightClubModule.GotTaskToStealPlant") && !getFlag("FightClubModule.AvyApproachAfterRektHappened")):
		setFlag("FightClubModule.AvyApproachAfterRektHappened", true)
		runScene("AvyApproachAfterRektScene")
		return true
	return false

func getPriority():
	return 10

