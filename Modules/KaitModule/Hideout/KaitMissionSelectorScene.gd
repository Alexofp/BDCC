extends SceneBase

func _init():
	sceneID = "KaitMissionSelectorScene"

func sayMissionInfo(theMission:MissionBase, _isHistory:bool = false):
	sayn("Name: [b] "+theMission.getName()+"[/b]")
	sayn("Description: "+theMission.getDescription())
	
	var rewardStr:String = theMission.getRewardString()
	if(!rewardStr.empty()):
		sayn("Reward: "+rewardStr)
	if(_isHistory):
		var theChoices:Array = GM.main.MS.getDecisionsStrings(theMission.id)
		if(!theChoices.empty()):
			sayn("Decisions:")
			sayn(Util.join(theChoices, "\n"))
	sayn("")

func _run():
	if(state == ""):
		playAnimation(StageScene.Solo, "stand")
		
		saynn("You're standing in front of an improvised mission board. Kait is standing near. What do you wanna do?")

		#addButtonAt(9, "Kait", "Talk with the snow leopard", "endthescene")
		addButtonAt(9, "History", "Look at the history of your missions!", "history_menu")
		addButtonAt(14, "Step away", "You changed your mind", "endthescene")
		
		saynn("[b]=== Missions ====[/b]")
		
		var theMainMissions:Array = GM.main.MS.getAllPossibleMainMissions()
		if(theMainMissions.empty()):
			saynn("No main missions left! Wait until the developer makes more..")
		
		var _i:int = 1
		for theMission in theMainMissions:
			sayMissionInfo(theMission)
			addButton(theMission.getName(), "Start this mission!", "startMission", [theMission.id])
			_i += 1
		
		var theSideMissions:Array = GM.main.MS.getAllPossibleSideMissions()
		if(!theSideMissions.empty()):
			saynn("[b]=== Side Missions ====[/b]")
			_i = 1
			for theMission in theSideMissions:
				sayMissionInfo(theMission)
				addButton(theMission.getName(), "Start this side mission!", "startMission", [theMission.id])
				_i += 1
		
		sayn("[b]Stats[/b]")
		var theStats:Array = GM.main.MS.getMissionStats()
		saynn(Util.join(theStats, "\n"))
	
	if(state == "history_menu" || state == "replay_menu"):
		var _isReplay:bool = (state == "replay_menu")
		addButton("Back", "Go back to the previous menu", "")
		saynn("[b]=== History ====[/b]")
		
		var theMainMissions:Array = GM.main.MS.getAllCompletedMainMissions()
		#if(theMainMissions.empty()):
		#	saynn("No missions left! Wait until the developer makes more..")
		
		var _i:int = 1
		for theMission in theMainMissions:
			sayMissionInfo(theMission, true)
			if(_isReplay):
				addButton(theMission.getName(), "Start this mission!", "replayMission", [theMission.id])
			_i += 1
		
		var theSideMissions:Array = GM.main.MS.getAllCompletedSideMissions()
		if(!theSideMissions.empty()):
			saynn("[b]=== Side Missions ====[/b]")
			_i = 1
			for theMission in theSideMissions:
				sayMissionInfo(theMission, true)
				if(_isReplay):
					addButton(theMission.getName(), "Start this side mission!", "replayMission", [theMission.id])
				_i += 1
		
		if(!_isReplay):
			addButton("Replay mission", "Choose which mission you want to replay", "replay_menu")
	
func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
	if(_action == "startMission"):
		endScene()
		GM.main.MS.startMission(_args[0])
		return
	if(_action == "replayMission"):
		endScene()
		GM.main.MS.startMission(_args[0], true, true, true)
		return

	setState(_action)

func getDebugActions():
	return [
	{
	"id": "completeNext",
	"name": "Complete next main mission",
	"args": [
	],
	},
	]

func doDebugAction(_id, _args = {}):
	if(_id == "completeNext"):
		GM.main.MS.autoCompleteNextMainMission()
