extends EventTrigger
class_name EventTriggerWeighted

var events = []
var weights = []

func addEvent(event, _args):
	events.push_back(event)
	weights.push_back(event.getPriority())

func triggerReact(args):
	var eventsCopy = events.duplicate()
	var weightsCopy = weights.duplicate()
	
	while(!eventsCopy.empty()):
		var event = RNG.grabWeighted(eventsCopy, weightsCopy)
		if(event.react(id, args)):
			return true
	return false

func triggerRun(args):
	for event in events:
		event.run(id, args)
