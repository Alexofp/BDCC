extends EventBase

func _init():
	id = "testEvent2"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "hall_mainentrance")
	es.addTrigger(self, Trigger.EatingInCanteen)

func shouldRun():
	return false

func run():
	GM.pc.addLust(-100)
	GM.pc.addLust(68)
	
	#runScene("FightScene", ["risha"], "rishafight")
	
func delayedRun():
	saynn("TEST EVENT 2")
	addButton("Hello world", "say hello world", "HELLOHELLOHELLO")

func shouldInterupt():
	return false

func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "HELLOHELLOHELLO"):
		runScene("FightScene", ["risha"], "rishafight")
