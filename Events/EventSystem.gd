extends Node
class_name EventSystem

var eventTriggers = {}
var eventChecks = {}
var datapackEvents = []

func _ready():
	GM.ES = self
	name = "EventSystem"
	
	registerEventTriggers()
	
	registerEvents()

func registerEventTriggers():
	# Default event triggers
	registerEventTrigger(Trigger.EnteringRoom, EventTriggerLocation.new())
	registerEventTrigger(Trigger.EnteringRoomWithSlave, EventTriggerLocation.new())
	registerEventTrigger(Trigger.TalkingToNPC, EventTriggerLocation.new())
	registerEventTrigger(Trigger.CaughtStealingInGreenhouse, EventTriggerWeighted.new())
	registerEventTrigger(Trigger.CaughtOffLimits, EventTriggerWeighted.new())
	registerEventTrigger(Trigger.HighExposureInmateEvent, EventTriggerWeighted.new())
	registerEventTrigger(Trigger.PCLookingForTrouble, EventTriggerWeighted.new())
	registerEventTrigger(Trigger.MasturbationSpottedGuard, EventTriggerWeighted.new())
	registerEventTrigger(Trigger.MasturbationSpottedInmate, EventTriggerWeighted.new())
	registerEventTrigger(Trigger.SleepInCell, EventTriggerWeighted.new())
	registerEventTrigger(Trigger.SceneAndStateHook, EventTriggerSceneHook.new())
	registerEventTrigger(Trigger.SlaverySlutLookAtEvent, EventTriggerWeighted.new())
	registerEventTrigger(Trigger.SlaverySlutImportantEvent, EventTriggerWeighted.new())
	registerEventTrigger(Trigger.TalkingToDynamicNPC, EventTriggerWeighted.new())
	registerEventTrigger(Trigger.MeetDynamicNPC, EventTriggerWeighted.new())
	registerEventTrigger(Trigger.UnconsciousPCGrabbed, EventTriggerWeighted.new())
	
	var modules = GlobalRegistry.getModules()
	for moduleID in modules:
		var module: Module = modules[moduleID]
		
		module.registerEventTriggers()

func registerEvents():
	var loadedevents = GlobalRegistry.getEvents()
	for eventID in loadedevents:
		var event = loadedevents[eventID]
		event.registerTriggers(self)
		
	for triggerID in eventTriggers:
		eventTriggers[triggerID].onAllEventsAdded()

func registerDatapackEvents(datapackIDs): # Very slow, use with caution
	eventTriggers = {}
	eventChecks = {}
	datapackEvents = []
	
	registerEventTriggers()
	
	# Re-Registering normal events
	var loadedevents = GlobalRegistry.getEvents()
	for eventID in loadedevents:
		var event = loadedevents[eventID]
		event.registerTriggers(self)
	
	# Registering datapack events
	var _i = 0
	for datapackID in datapackIDs:
		var datapack = GlobalRegistry.getDatapack(datapackID)
		if(datapack == null):
			continue
		for sceneID in datapack.scenes:
			var datapackScene = datapack.scenes[sceneID]
			
			for trigger in datapackScene.triggers:
				var newEvent = preload("res://Game/Datapacks/DatapackScene/DatapackSceneEvent.gd").new()
				newEvent.id = "DatapackEvent"+str(_i)
				newEvent.setDatapackData(datapack, datapackScene, trigger)
				newEvent.registerTriggers(self)
				datapackEvents.append(newEvent)
				_i += 1
	
	for triggerID in eventTriggers:
		eventTriggers[triggerID].onAllEventsAdded()
	
func registerEventTrigger(triggerID, eventTriggerObject):
	eventTriggerObject.id = triggerID
	eventTriggers[triggerID] = eventTriggerObject

func addTrigger(event, triggerID, args = []):
	if(!eventTriggers.has(triggerID)):
		registerEventTrigger(triggerID, EventTriggerPriority.new())
	
	eventTriggers[triggerID].addEvent(event, args)

func addDatapackTrigger(event, triggerID, args = []):
	addTrigger(event, triggerID, args)

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

func addEventCheck(event, checkID):
	if(!eventChecks.has(checkID)):
		eventChecks[checkID] = []
	
	eventChecks[checkID].append(event)

func eventCheck(checkID, args = []):
	if(!eventChecks.has(checkID)):
		return null
	
	for theEventCheck in eventChecks[checkID]:
		var eventCheckData = theEventCheck.eventCheck(checkID, args)
		if(eventCheckData != null):
			return eventCheckData
	return null

func saveData():
	var data = {}

	return data

func loadData(_data):
	pass
