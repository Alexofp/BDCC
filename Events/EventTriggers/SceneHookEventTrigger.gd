extends EventTrigger
class_name EventTriggerSceneHook

var eventsBySceneAndState = {}

static func sortPriority(a, b):
	if a.getPriority() > b.getPriority():
		return true
	return false

func addEvent(event, args):
	var sceneID = args[0]
	var stateString = args[1]
	
	if(!eventsBySceneAndState.has(sceneID)):
		eventsBySceneAndState[sceneID] = {}
	if(!eventsBySceneAndState[sceneID].has(stateString)):
		eventsBySceneAndState[sceneID][stateString] = []
		
	eventsBySceneAndState[sceneID][stateString].append(event)

func onAllEventsAdded():
	pass

func triggerReact(args):
	var sceneID = args[0]
	var stateString = args[1]
	
	if(eventsBySceneAndState.has(sceneID) && eventsBySceneAndState[sceneID].has(stateString)):
		var events = eventsBySceneAndState[sceneID][stateString]
		
		for event in events:
			if(event.react(id, args)):
				return true

	return false

func triggerRun(args):
	var sceneID = args[0]
	var stateString = args[1]
	
	if(eventsBySceneAndState.has(sceneID) && eventsBySceneAndState[sceneID].has(stateString)):
		var events = eventsBySceneAndState[sceneID][stateString]
		
		for event in events:
			event.run(id, args)
