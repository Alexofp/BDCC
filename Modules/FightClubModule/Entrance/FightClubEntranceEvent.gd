extends EventBase

func _init():
	id = "FightClubEntranceEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "gym_secret")

func run(_triggerID, _args):
	if(!getModuleFlag(FightClubModule.ModID, FightClubModule.BulldogFirstTimeHappened)):
		addButtonUnlessLate("Bulldog", "Approach the guy", "bulldog")
	elif(!getModuleFlag(FightClubModule.ModID, FightClubModule.BulldogBypassed)):
		addButtonUnlessLate("Bulldog", "Approach the guy", "bulldogtalk")
	else:
		addButton("The Underground", "Go down to the fight club", "fightclub")


func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "bulldog"):
		runScene("BulldogFirstTimeScene")
		setModuleFlag(FightClubModule.ModID, FightClubModule.BulldogFirstTimeHappened, true)
	if(_method == "bulldogtalk"):
		runScene("BulldogTalkScene")
	if(_method == "fightclub"):
		GM.pc.setLocation("fight_entrance")
		GM.main.reRun()
