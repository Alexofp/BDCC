extends EventBase

func _init():
	id = "TestMasturbationSpottedSceneEvent"

func registerTriggers(es):
	es.addTrigger(self, "MasturbationSpottedGuard")
	es.addTrigger(self, "MasturbationSpottedInmate")

func react(_triggerID, _args):
	runScene("TestMasturbationSpottedScene")
	return true

func getPriority():
	return 0.01
