extends Reference
class_name NpcOwnerEventRunner

var eventStack:Array = []
var texts:Array = []
var buttons:Array = []

func runEvent(_id:String, _args:Array = []):
	var theEvent = GlobalRegistry.createNpcOwnerEvent(_id)
	if(!theEvent):
		return
	eventStack.append(theEvent)
	theEvent.setEventRunner(self)
	theEvent.startEvent(_args)

func removeEvent(_event):
	eventStack.erase(_event)

func getCurrentEvent():
	if(eventStack.empty()):
		return null
	return eventStack.back()

func run():
	texts.clear()
	buttons.clear()
	if(eventStack.empty()):
		Log.printerr("NO EVENTS IN THE EVENT RUNNER!")
		return
	getCurrentEvent().run()

func doAction(_id:String, _args:Array):
	if(eventStack.empty()):
		Log.printerr("NO EVENTS IN THE EVENT RUNNER!")
		return
	getCurrentEvent().doAction(_id, _args)
	run()

func saynn(_text:String):
	texts.append(_text)

func getFinalText() -> String:
	return Util.join(texts, "\n\n")

func getFinalButtons() -> Array:
	return buttons
