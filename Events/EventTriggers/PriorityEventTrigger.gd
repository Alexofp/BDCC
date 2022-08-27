extends EventTrigger
class_name EventTriggerPriority

var events = []

static func sortPriority(a, b):
	if a.getPriority() > b.getPriority():
		return true
	return false

func addEvent(event, _args):
	events.push_back(event)

func onAllEventsAdded():
	events.sort_custom(self, "sortPriority")

func triggerReact(args):
	for event in events:
		if(event.react(id, args)):
			return true
	return false

func triggerRun(args):
	for event in events:
		event.run(id, args)
