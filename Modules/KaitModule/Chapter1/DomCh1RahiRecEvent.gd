extends EventBase

func _init():
	id = "DomCh1RahiRecEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.TalkingToNPC, "rahi")
	es.addTrigger(self, Trigger.TalkingToNPC, "rahiSlavery")
	
func run(_triggerID, _args):
	if(getFlag("KaitModule.joinedTeam") && !getFlag("KaitModule.caughtRahi")):
		if(_args[0] == "rahi"):
			addButton("Recruit!", "(Dom route) Try to recruit this cat into your team", "rahiIntro")
		else:
			addButton("Recruit!", "(Dom route) Try to recruit Rahi into your team", "rahiSlavery")

func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "rahiIntro"):
		GM.main.endCurrentScene()
		runScene("DomCh1RahiRecScene")
	if(_method == "rahiSlavery"):
		GM.main.endCurrentScene()
		runScene("DomCh1RahiRecEnsScene")

