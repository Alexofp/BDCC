extends EventBase

func _init():
	id = "HideoutFunctionsEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "hideout_near_break_room")
	es.addTrigger(self, Trigger.EnteringRoom, "hideout_hq")

func run(_triggerID, _args):
	var isDoingRec:bool = GM.main.RCS.hasCurrent()
	var isOnMission:bool = GM.main.MS.isOnMission()
	var theRoomID:String = _args[0]
	
	if(theRoomID == "hideout_hq" && getFlag("KaitModule.introCompleted")):
		if(isOnMission):
			addDisabledButton("Mission Board", "You are already on a mission")
		elif(isDoingRec):
			addDisabledButton("Mission Board", "You can't do this while you're recruiting someone")
		else:
			addButtonWithChecks("Mission Board", "Look at what missions you can do now!", "missionboard", [], [[ButtonChecks.NotLate]])
	
	if(theRoomID == "hideout_near_break_room" && isDoingRec):
		var theRecName:String = GM.main.RCS.getRecruitName()
		addButton("Recruit "+str(theRecName), "Make a plan about how you want to recruit "+theRecName, "doRec")
	
func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "doRec"):
		runScene("RecruitStartScene")
	if(_method == "missionboard"):
		runScene("KaitMissionSelectorScene")
