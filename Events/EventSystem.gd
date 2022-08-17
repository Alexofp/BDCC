extends Node
class_name EventSystem

var events = {}
var delayedEvents = []
var enteringRoomEvents = {}
var enteringAnyRoomEvents = []

class MyCustomSorter:
	static func sort_descending(a, b):
		if a[0].getPriority() > b[0].getPriority():
			return true
		return false

func _ready():
	GM.ES = self
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
		if(args != null):
			if(!enteringRoomEvents.has(args)):
				enteringRoomEvents[args] = []
			enteringRoomEvents[args].append([event, args])
		else:
			enteringAnyRoomEvents.append([event, args])


func trigger(_triggerType, _args = null, _passArgs = null, onlyDelayed = false):
	if(!events.has(_triggerType)):
		return false
		
	if(!TriggerCondition.canTrigger(_triggerType)):
		return false
	if(!onlyDelayed):
		TriggerCondition.onTrigger(_triggerType)
	
	var usefulEvents = events[_triggerType]
	
	# Little optimization so we don't go through the whole list of events each time we enter a new room
	if(_triggerType == Trigger.EnteringRoom):
		usefulEvents = enteringAnyRoomEvents.duplicate()
		if(enteringRoomEvents.has(_args)):
			usefulEvents.append_array(enteringRoomEvents[_args])
		usefulEvents.sort_custom(MyCustomSorter, "sort_descending")
	
	if(_triggerType == Trigger.CaughtOffLimits):
		usefulEvents.shuffle()
	
	for eventData in usefulEvents:
		var event = eventData[0]
		var _eventArg = eventData[1]
		
		if(_triggerType == Trigger.EnteringRoom):
			if(_args != _eventArg && _eventArg != null):
				continue
		
		if(!event.shouldRun()):
			continue
			
		if(!delayedEvents.has(event.id)):
			delayedEvents.append(event.id)
		if(!onlyDelayed):
			if(event.run(_passArgs)):
				return true
		if(event.shouldInterupt()):
			return true
	return false

func triggerOnlyDelayed(_triggerType, _args = null, _passArgs = null):
	return trigger(_triggerType, _args, _passArgs, true)

func doDelayedEvents():
	for eventID in delayedEvents:
		var event = GlobalRegistry.getEvent(eventID)
		if(event == null):
			Log.printerr("Trying to run an event that doesn't exist "+str(eventID))
			continue
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
