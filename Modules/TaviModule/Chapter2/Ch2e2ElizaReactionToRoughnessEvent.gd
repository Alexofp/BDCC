extends EventBase

func _init():
	id = "Ch2e2ElizaReactionToRoughnessEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.TalkingToNPC, "eliza")
	
func react(_triggerID, _args):
	if(getFlag("TaviModule.ch2PCDidBadThingsToEliza") && !getFlag("TaviModule.ch2ElizaReactedToRoughness")):
		setFlag("TaviModule.ch2ElizaReactedToRoughness", true)
		runScene("Ch2e2ElizaReactionToRoughness")
		return true

func getPriority():
	return 0

