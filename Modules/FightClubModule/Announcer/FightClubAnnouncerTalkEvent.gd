extends EventBase

func _init():
	id = "FightClubAnnouncerTalkEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "fight_announcer")

func run(_triggerID, _args):
	if(!getFlag("FightClubModule.AnnouncerIntroduced")):
		addButtonUnlessLate("Announcer", "Approach the guy", "announcerfirst")
	else:
		addButtonUnlessLate("Announcer", "Approach the guy", "announcer")

func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "announcerfirst"):
		runScene("AnnouncerFirstTimeTalkScene")
		setFlag("FightClubModule.AnnouncerIntroduced", true)
	if(_method == "announcer"):
		runScene("AnnouncerTalkScene")
