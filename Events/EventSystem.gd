extends Node
class_name EventSystem

var events = {}
var delayedEvents = []
var enteringRoomEvents = {}

class MyCustomSorter:
	static func sort_descending(a, b):
		if a[0].getPriority() > b[0].getPriority():
			return true
		return false

func _ready():
	name = "EventSystem"
	
	registerEvents()

func registerEvents():
	var loadedevents = GlobalRegistry.getEvents()
	for eventID in loadedevents:
		var event = loadedevents[eventID]
		event.registerTriggers(self)
		
	for triggerType in events:
		events[triggerType].sort_custom(MyCustomSorter, "sort_descending")

func addTrigger(event, triggerType, args = null):
	if(!events.has(triggerType)):
		events[triggerType] = []
	events[triggerType].append([event, args])
	
	if(triggerType == Trigger.EnteringRoom):
		if(!enteringRoomEvents.has(args)):
			enteringRoomEvents[args] = []
		enteringRoomEvents[args].append([event, args])


func trigger(_triggerType, _args = null, onlyDelayed = false):
	if(!events.has(_triggerType)):
		return false
	
	var usefulEvents = events[_triggerType]
	
	# Little optimization so we don't go through the whole list of events each time we enter a new room
	if(_triggerType == Trigger.EnteringRoom):
		if(!enteringRoomEvents.has(_args)):
			return false
		
		usefulEvents = enteringRoomEvents[_args]
	
	for eventData in usefulEvents:
		var event = eventData[0]
		var _eventArg = eventData[1]
		
		if(_triggerType == Trigger.EnteringRoom):
			if(_args != _eventArg):
				continue
		
		if(!event.shouldRun()):
			continue
		
		if(!onlyDelayed):
			event.run()
		if(!delayedEvents.has(event.id)):
			delayedEvents.append(event.id)
		if(event.shouldInterupt()):
			return true
	return false

func triggerOnlyDelayed(_triggerType, _args = null):
	return trigger(_triggerType, _args, true)

func doDelayedEvents():
	for eventID in delayedEvents:
		var event = GlobalRegistry.getEvent(eventID)
		event.delayedRun()

func clearDelayedEvents():
	delayedEvents = []

func checkButtonInput(method, args):
	if(method == "EVENTSYSTEM_BUTTON"):
		args[0].onButton(args[1], args[2])
		return true
	return false

func saveData():
	var data = {}
	data["delayedEvents"] = delayedEvents

	return data

func loadData(data):
	delayedEvents = SAVE.loadVar(data, "delayedEvents", [])
