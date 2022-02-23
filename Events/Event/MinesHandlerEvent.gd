extends EventBase

func _init():
	id = "minesHandlerEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "mining_shafts_entering")

func run():
	pass
	#runScene("FightScene", ["risha"], "rishafight")
	
func delayedRun():
	if(GM.pc.getStamina() > 0):
		if(!GM.main.getFlag(Flag.Mining_IntroducedToMinning, false)):
			addButtonUnlessLate("Work", "See what's it about", "first_time")
		else:
			addButtonUnlessLate("Work", "Go work in the mines", "not_first_time")
	else:
		addDisabledButton("Work", "You are way too tired to work")
	


func shouldInterupt():
	return false

func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "first_time"):
		runScene("FirstTimeInMinesScene")
	if(_method == "not_first_time"):
		runScene("WorkInMinesScene")
