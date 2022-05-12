extends Reference
class_name EventBase

var id = "badevent"

func _init():
	pass

func registerTriggers(_es):
	pass

func shouldRun():
	return true

func run(_args):
	pass
	
func delayedRun():
	pass

func getPriority():
	return 0

func shouldInterupt():
	return false

func onButton(_method, _args):
	pass

func runScene(sceneid: String, args = [], tag = ""):
	var scene = GM.main.runScene(sceneid, args)
	scene.sceneTag = tag

func say(_text: String):
	if(GM.ui):
		GM.ui.say(_text)

func sayn(_text: String):
	say(_text+"\n")

func saynn(_text: String):
	say(_text+"\n\n")

func addButton(text: String, tooltip: String = "", method: String = "", args = []):
	GM.ui.addButton(text, tooltip, "EVENTSYSTEM_BUTTON", [self, method, args])

func addDisabledButton(text: String, tooltip: String = ""):
	GM.ui.addDisabledButton(text, tooltip)

func addButtonUnlessLate(text: String, tooltip: String = "", method: String = "", args = [], latetext: String = "It's way too late for that"):
	if(GM.main.isVeryLate()):
		addDisabledButton(text, latetext)
	else:
		addButton(text, tooltip, method, args)
	
func addButtonWithChecks(text: String, tooltip: String, method: String, args, checks: Array):
	var badCheck = ButtonChecks.check(checks)
	if(badCheck == null):
		addButton(text, ButtonChecks.getPrefix(checks) + tooltip, method, args)
	else:
		addDisabledButton(text, ButtonChecks.getReasonText(badCheck))

func setFlag(flagID, value):
	GM.main.setFlag(flagID, value)

func getFlag(flagID, defaultValue = null):
	return GM.main.getFlag(flagID, defaultValue)

func increaseFlag(flagID, addvalue = 1):
	GM.main.increaseFlag(flagID, addvalue)
