extends EventBase

func _init():
	id = "FightClubAvyTalkEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "fight_neararena")
	
func run(_triggerID, _args):
	saynn("Avy stands near the fences that make up the improvised arena")
	
	if(!getFlag("FightClubModule.AnnouncerIntroduced")):
		addDisabledButton("Avy", "Talk to the announcer first")
	else:
		if(!getFlag("FightClubModule.AvyIntroduced")):
			addButtonUnlessLate("Avy", "Approach the dickgirl", "avyfirst")
		else:
			if(getFlag("FightClubModule.AvyIsInSlutwall")):
				addDisabledButton("Avy", "Avy is still stuck inside the slutwall")
			else:
				addButtonUnlessLate("Avy", "Approach the dickgirl", "avy")

func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "avyfirst"):
		runScene("AvyFirstTimeTalkScene")
		setFlag("FightClubModule.AvyIntroduced", true)
	if(_method == "avy"):
		runScene("AvyTalkScene")
