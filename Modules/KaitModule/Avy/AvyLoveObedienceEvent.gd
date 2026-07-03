extends EventBase

func _init():
	id = "AvyLoveObedienceEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.TalkingToNPC, "avy")
	
func run(_triggerID, _args):
	if(!getModule("KaitModule").hasHideoutAccess()):
		return
	
	var theLove:int = GM.main.MS.getAvyLove()
	var theObedience:int = GM.main.MS.getAvyObedience()
	
	if(theLove >= 2):
		addButton("Sex", "See what lewd stuff you can do with Avy", "lovemenu")
	if(theObedience >= 2):
		addButton("Dominate", "See how you can dominate this dickgirl", "obeymenu")

func getPriority():
	return 33

func onButton(_method, _args):
	if(_method == "lovemenu"):
		GM.main.endCurrentScene()
		runScene("AvyLoveMenuScene")
	if(_method == "obeymenu"):
		GM.main.endCurrentScene()
		runScene("AvyObedienceMenuScene")

