extends EventBase

func _init():
	id = "testEvent"

func registerTriggers(es):
	#es.addTrigger(self, Trigger.EnteringRoom, "hall_mainentrance")
	es.addTrigger(self, Trigger.CaughtOffLimits)

func shouldRun():
	return false

func run():
	GM.pc.addLust(-100)
	GM.pc.addLust(69)
	
	runScene("FightScene", ["risha"], "rishafight")
	return true
	
func delayedRun():
	saynn("HeckHECKHECK")

func shouldInterupt():
	return false

func getPriority():
	return -1
