extends EventBase

func _init():
	id = "FightClubEntranceEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "gym_secret")

func shouldRun():
	return true

func run(_args):
	pass
	
func delayedRun():
	if(!getModuleFlag(FightClubModule.ModID, FightClubModule.BulldogFirstTimeHappened)):
		addButtonUnlessLate("Bulldog", "Approach the guy", "bulldog")
	elif(!getModuleFlag(FightClubModule.ModID, FightClubModule.BulldogBypassed)):
		addButtonUnlessLate("Bulldog", "Approach the guy", "bulldogtalk")
	else:
		pass

func shouldInterupt():
	return false

func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "bulldog"):
		runScene("BulldogFirstTimeScene")
		setModuleFlag(FightClubModule.ModID, FightClubModule.BulldogFirstTimeHappened, true)
	if(_method == "bulldogtalk"):
		runScene("BulldogTalkScene")
