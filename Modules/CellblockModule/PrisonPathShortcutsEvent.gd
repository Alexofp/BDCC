extends EventBase

var sneakyPaths = {
	"eng_airventskip": {
		"text": "Air vent",
		"desc": "Climb through the air vert and see where it brings you",
		"newloc": "eng_firstjunction",
		"arive": "You climb through the air vent and end up near the engineering block entrance"
	}
}

func _init():
	id = "PrisonPathShortcutsEvent"

func registerTriggers(es):
	for theloc in sneakyPaths:
		es.addTrigger(self, Trigger.EnteringRoom, theloc)

func run(_triggerID, _args):
	if(_args.size() > 0 && sneakyPaths.has(_args[0])):
		var thepath = sneakyPaths[_args[0]]
		addButton(thepath["text"], thepath["desc"], "goto", [_args[0]])

func getPriority():
	return 1

func onButton(_method, _args):
	if(_method == "goto"):
		var thepath = sneakyPaths[_args[0]]
		GM.pc.setLocation(thepath["newloc"])
		GM.main.addMessage(thepath["arive"])
		GM.main.reRun()
		
