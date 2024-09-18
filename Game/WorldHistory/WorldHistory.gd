extends Reference
class_name WorldHistory

var eventsByEventID:Dictionary = {}
# dict(eventID=dict(charID=array of events))

func addEvent(eventID:String, whoID:String, byWhoID:String, args:Dictionary = {}):
	if(whoID != "pc" && byWhoID != "pc"):
		return # Remove when world history should start supporting npcs
	
	if(!eventsByEventID.has(eventID)):
		eventsByEventID[eventID] = []
	
	var newEvent:WorldHistoryEvent = WorldHistoryEvent.new()
	newEvent.id = eventID
	newEvent.whoID = whoID
	newEvent.byWhoID = byWhoID
	newEvent.args = args
	
	# Auto filled stuff
	newEvent.day = GM.main.getDays()
	newEvent.time = GM.main.getTime()
	
	eventsByEventID[eventID].append(newEvent)
	#if(!eventsByEventID[eventID].has(whoID)):
	#	eventsByEventID[eventID][whoID] = [newEvent]
	#else:
	#	eventsByEventID[eventID][whoID].append(newEvent)
	
	return newEvent

func satisfiesCondition(event:WorldHistoryEvent, condInfo:Array, _i:int = 0) -> bool:
	var condType:int = condInfo[_i]
	match condType:
		WHCond.Who:
			return event.whoID == condInfo[_i+1]
		WHCond.Target:
			return event.byWhoID == condInfo[_i+1]
		WHCond.Today:
			return event.day == GM.main.getDays()
		WHCond.Yesterday:
			return event.day == (GM.main.getDays() - 1)
		WHCond.MinDaysAgo:
			return (GM.main.getDays() - event.day) >= condInfo[_i+1]
		WHCond.MaxDaysAgo:
			return (GM.main.getDays() - event.day) <= condInfo[_i+1]
		WHCond.ArgTrue:
			return (event.args.has(condInfo[_i+1]) && event.args[condInfo[_i+1]])
		WHCond.ArgFalse:
			return (event.args.has(condInfo[_i+1]) && !event.args[condInfo[_i+1]])
		WHCond.Not:
			return !satisfiesCondition(event, condInfo, _i+1)

	Log.printerr("Unknown condition info found: "+str(condInfo))
	return false

func queryHappened(eventID:String, conditions:Array = []) -> bool:
	if(!eventsByEventID.has(eventID) || eventsByEventID[eventID].empty()):
		return false
	
	if(conditions.empty()):
		return true
	
	for event in eventsByEventID[eventID]:
		var allGood:bool = true
		for condInfo in conditions:
			if(!satisfiesCondition(event, condInfo)):
				allGood = false
				break
		if(allGood):
			return true
	return false

func queryAmount(eventID:String, conditions:Array = []) -> int:
	var result:int = 0
	
	if(!eventsByEventID.has(eventID) || eventsByEventID[eventID].empty()):
		return 0
	if(conditions.empty()):
		return eventsByEventID[eventID].size()
	
	for event in eventsByEventID[eventID]:
		for condInfo in conditions:
			if(!satisfiesCondition(event, condInfo)):
				continue
		result += 1
	
	return result

func getKeepDaysOfHistory() -> int:
	return 7

func clearHistory():
	eventsByEventID.clear()

# Purges old history
func onNewDay():
	var newEventsByType:Dictionary = {}
	var eraseDay:int = GM.main.getDays() - getKeepDaysOfHistory()
	
	for eventID in eventsByEventID:
		newEventsByType[eventID] = []
	
		for event in eventsByEventID[eventID]:
			if(event.day >= eraseDay):
				newEventsByType[eventID].append(event)
		
		if(newEventsByType[eventID].empty()):
			var _ok = newEventsByType.erase(eventID)
	eventsByEventID = newEventsByType
