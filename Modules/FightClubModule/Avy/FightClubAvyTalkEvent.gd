extends EventBase

func _init():
	id = "FightClubAvyTalkEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "fight_neararena")

func shouldRun():
	return true

func run(_args):
	pass
	
func delayedRun():
	saynn("Avy stands near the fences that make up the improvised arena")
	
	if(!getModuleFlag(FightClubModule.ModID, FightClubModule.AnnouncerIntroduced)):
		addDisabledButton("Avy", "Talk to the announcer first")
	else:
		if(!getModuleFlag(FightClubModule.ModID, FightClubModule.AvyIntroduced)):
			addButtonUnlessLate("Avy", "Approach the dickgirl", "avyfirst")
		else:
			addButtonUnlessLate("Avy", "Approach the dickgirl", "avy")

func shouldInterupt():
	return false

func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "avyfirst"):
		runScene("AvyFirstTimeTalkScene")
		setModuleFlag(FightClubModule.ModID, FightClubModule.AvyIntroduced, true)
	if(_method == "avy"):
		runScene("AvyTalkScene")
