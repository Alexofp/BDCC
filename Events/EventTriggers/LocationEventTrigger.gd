extends EventTrigger
class_name EventTriggerLocation

var eventsWithoutLocation = []
var eventsByLocation = {}

static func sortPriority(a, b):
	if a.getPriority() > b.getPriority():
		return true
	return false

func addEvent(event, args):
	var locID = null
	if(args != null && args is String):
		locID = args
	elif(args != null && args is Array && args.size() > 0):
		locID = args[0]
	
	if(locID == null):
		eventsWithoutLocation.append(event)
	else:
		if(!eventsByLocation.has(locID)):
			eventsByLocation[locID] = []
		
		eventsByLocation[locID].append(event)

func onAllEventsAdded():
	eventsWithoutLocation.sort_custom(self, "sortPriority")
	for locID in eventsByLocation:
		eventsByLocation[locID].sort_custom(self, "sortPriority")

func triggerReact(args):
	var locID = args[0]
	
	if(eventsByLocation.has(locID)):
		var events = eventsByLocation[locID]
		
		for event in events:
			if(event.react(id, args)):
				return true

	for event in eventsWithoutLocation:
		if(event.react(id, args)):
			return true

	return false

func triggerRun(args):
	var locID = args[0]
	
	if(eventsByLocation.has(locID)):
		var events = eventsByLocation[locID]
		
		for event in events:
			event.run(id, args)

	for event in eventsWithoutLocation:
		event.run(id, args)
