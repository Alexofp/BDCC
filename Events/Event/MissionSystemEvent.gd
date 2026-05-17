extends EventBase

func _init():
	id = "MissionSystemEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom)
	es.addTrigger(self, Trigger.TalkingToNPC)

func react(_triggerID, _args):
	if(_triggerID == Trigger.EnteringRoom):
		if(_args.size() == 0 || !GM.main.MS.isOnMission()):
			return
		var roomID:String = _args[0]
		var theMission:MissionBase = GM.main.MS.getMission()
		if(!theMission):
			return
		
		var theScene:Array = theMission.getEventSceneLoc(roomID)
		if(theScene.empty()):
			return false
		runScene(theScene[0], theScene[1] if theScene.size() > 1 else [])
		return true
	
	return false
	
func run(_triggerID, _args):
	if(_triggerID == Trigger.EnteringRoom):
		if(_args.size() == 0 || !GM.main.MS.isOnMission()):
			return
		var roomID:String = _args[0]
		var theMission:MissionBase = GM.main.MS.getMission()
		if(!theMission):
			return
		
		var theActions:Array = theMission.getStartSceneButtonsLoc(roomID)
		for theActionEntry in theActions:
			addButton(theActionEntry[2], theActionEntry[3], "startScene", [theActionEntry])
	elif(_triggerID == Trigger.TalkingToNPC):
		if(_args.size() == 0 || !GM.main.MS.isOnMission()):
			return
		var charID:String = _args[0]
		var theMission:MissionBase = GM.main.MS.getMission()
		if(!theMission):
			return
		
		var theActions:Array = theMission.getStartSceneButtonsCharacter(charID)
		for theActionEntry in theActions:
			addButton(theActionEntry[2], theActionEntry[3], "startScene", [theActionEntry])
	
func getPriority():
	return 1

func onButton(_method, _args):
	if(_method == "startScene"):
		var sceneID:String = _args[0][0]
		var sceneArgs:Array = _args[0][1]
		
		var theMission:MissionBase = GM.main.MS.getMission()
		if(!theMission):
			return
		theMission.onSceneStart(sceneID, sceneArgs)
		runScene(sceneID, sceneArgs)
		
