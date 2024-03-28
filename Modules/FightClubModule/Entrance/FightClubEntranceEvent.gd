extends EventBase

func _init():
	id = "FightClubEntranceEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "gym_secret")
	es.addTrigger(self, Trigger.EnteringRoomWithSlave, "gym_secret")

func run(_triggerID, _args):
	if(!getFlag("FightClubModule.BulldogFirstTimeHappened")):
		if(_triggerID == Trigger.EnteringRoom):
			addButtonUnlessLate("Bulldog", "Approach the guy", "bulldog")
	elif(!getFlag("FightClubModule.BulldogBypassed")):
		if(_triggerID == Trigger.EnteringRoom):
			addButtonUnlessLate("Bulldog", "Approach the guy", "bulldogtalk")
	else:
		addButton("The Underground", "Go down to the fight club", "fightclub")


func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "bulldog"):
		runScene("BulldogFirstTimeScene")
		setFlag("FightClubModule.BulldogFirstTimeHappened", true)
	if(_method == "bulldogtalk"):
		runScene("BulldogTalkScene")
	if(_method == "fightclub"):
		GM.pc.setLocation("fight_entrance")
		GM.main.reRun()
