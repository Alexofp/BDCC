extends Node
class_name EventSystem

var eventTriggers = {}

func _ready():
	GM.ES = self
	name = "EventSystem"
	
	# Default event triggers
	registerEventTrigger(Trigger.EnteringRoom, LocationEventTrigger.new())
	registerEventTrigger(Trigger.TalkingToNPC, LocationEventTrigger.new())
	registerEventTrigger(Trigger.CaughtStealingInGreenhouse, WeightedEventTrigger.new())
	registerEventTrigger(Trigger.CaughtOffLimits, WeightedEventTrigger.new())
	
	var modules = GlobalRegistry.getModules()
	for moduleID in modules:
		var module: Module = modules[moduleID]
		
		module.registerEventTriggers()
	
	registerEvents()

func registerEvents():
	var loadedevents = GlobalRegistry.getEvents()
	for eventID in loadedevents:
		var event = loadedevents[eventID]
		event.registerTriggers(self)
		
	for triggerID in eventTriggers:
		eventTriggers[triggerID].onAllEventsAdded()

func registerEventTrigger(triggerID, eventTriggerObject):
	eventTriggerObject.id = triggerID
	eventTriggers[triggerID] = eventTriggerObject

func addTrigger(event, triggerID, args = []):
	if(!eventTriggers.has(triggerID)):
		registerEventTrigger(triggerID, PriorityEventTrigger.new())
	
	eventTriggers[triggerID].addEvent(event, args)
	

func triggerReact(triggerID, args = []):
	if(!eventTriggers.has(triggerID)):
		return false
	
	return eventTriggers[triggerID].triggerReact(args)

func triggerRun(triggerID, args = []):
	if(!eventTriggers.has(triggerID)):
		return
	
	return eventTriggers[triggerID].triggerRun(args)

func checkButtonInput(method, args):
	if(method == "EVENTSYSTEM_BUTTON"):
		args[0].onButton(args[1], args[2])
		return true
	return false

func saveData():
	var data = {}

	return data

func loadData(_data):
	pass
