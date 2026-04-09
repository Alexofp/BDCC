extends Reference
class_name SexToyGameplay

# Contains all of the triggers and stuff

var triggers:Dictionary = {} # trigger indx = 

func checkForRemovedTriggers():
	for triggerID in triggers.keys():
		if(triggers[triggerID].shouldBeRemoved()):
			triggers.erase(triggerID)

func getTrigger(_id:int) -> SexToyTriggerEntry:
	if(_id < 0 || _id >= SexToyTrigger.TOTAL_AMOUNT):
		return null
	if(!triggers.has(_id)):
		var newTrigger := SexToyTriggerEntry.new()
		newTrigger.type = _id
		triggers[_id] = newTrigger
	return triggers[_id]
