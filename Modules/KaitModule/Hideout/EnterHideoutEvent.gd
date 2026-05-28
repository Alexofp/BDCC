extends EventBase

func _init():
	id = "EnterHideoutEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "hideout_enter")
	es.addTrigger(self, Trigger.EnteringRoomWithSlave, "hideout_enter")
	es.addTrigger(self, Trigger.EnteringRoom, "fight_announcer")
	es.addTrigger(self, Trigger.EnteringRoomWithSlave, "fight_announcer")
	es.addTrigger(self, Trigger.EnteringRoom, "gym_secret")
	es.addTrigger(self, Trigger.EnteringRoomWithSlave, "gym_secret")

func run(_triggerID, _args):
	var hasHideout:bool = getModule("KaitModule").hasHideoutAccess()
	if(!hasHideout):
		return
	var isDoingRec:bool = GM.main.RCS.hasCurrent()
	
	var theRoomID:String = _args[0]
	
	if(theRoomID == "hideout_enter"):
		if(isDoingRec):
			addDisabledButton("Exit hideout", "Can't exit the hideout until you complete the recruitment!")
		else:
			addButton("Exit hideout", "Exit your hideout!", "go", ["fight_announcer"])
			addButton("Exit arena", "Exit your hideout and then also exit the arena! This is faster.", "go", ["gym_secret"])
	elif(theRoomID == "fight_announcer" || theRoomID == "gym_secret"):
		addButton("Hideout", "Enter the hideout", "go", ["hideout_enter"])
	
func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "go"):
		GM.pc.setLocation(_args[0])
		GM.main.reRun()
