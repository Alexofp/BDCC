extends EventBase

func _init():
	id = "PlayerSlaveryStartMemeEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "fight_meme")

func run(_triggerID, _args):
	saynn("You notice that there is a credits chip on the floor here.")
	
	addButton("Credits chip", "There is a credits chip on the floor", "credits")

func getPriority():
	return 11

func onButton(_method, _args):
	if(_method == "credits"):
		runScene("PlayerSlaveryStartMemeScene")
