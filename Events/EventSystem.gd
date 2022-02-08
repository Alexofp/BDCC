extends Node
class_name EventSystem

var events = {}
var delayedEvents = []

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

func addTrigger(event, triggerType, args = null):
	if(!events.has(triggerType)):
		events[triggerType] = []
	events[triggerType].append([event, args])
	
	events[triggerType].sort_custom(MyCustomSorter, "sort_descending")


func trigger(_triggerType, _args = null):
	if(!events.has(_triggerType)):
		return false
	
	for eventData in events[_triggerType]:
		var event = eventData[0]
		var _eventArg = eventData[1]
		
		if(_triggerType == Trigger.EnteringRoom):
			if(_args != _eventArg):
				continue
		
		if(!event.shouldRun()):
			continue
		
		event.run()
		delayedEvents.append(event.id)
		if(event.shouldInterupt()):
			return true
	return false

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
