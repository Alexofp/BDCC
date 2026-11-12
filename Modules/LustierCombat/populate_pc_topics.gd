extends EventBase

func _init():
	id = "populate_pc_topics"
	
func registerTriggers(es):
	es.addTrigger(self, Trigger.SceneAndStateHook, ["EncountersMenuScene", ""]) 

func run(_triggerID, _args):
	var myTopics:LustInterests = GM.pc.getLustInterests()
#	var _dummy = myTopics.interests
	if(not myTopics.interests.empty()):
		return
	else:
		for each in GlobalRegistry.getLustTopicObjects():
			for topicID in each.handles_ids:
				myTopics.addInterest(topicID, "Neutral")


