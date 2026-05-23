extends SceneBase

func _init():
	sceneID = "KaitMissionSelectorScene"

func sayMissionInfo(theMission:MissionBase):
	sayn("Name: [b] "+theMission.getName()+"[/b]")
	sayn("Description: "+theMission.getDescription())
	
	var rewardStr:String = theMission.getRewardString()
	if(!rewardStr.empty()):
		sayn("Reward: "+rewardStr)
	sayn("")

func _run():
	if(state == ""):
		playAnimation(StageScene.Solo, "stand")
		
		saynn("You're standing in front of an improvised mission board. Kait is standing near. What do you wanna do?")

		addButtonAt(9, "Kait", "Talk with the snow leopard", "endthescene")
		addButtonAt(14, "Step away", "You changed your mind", "endthescene")
		
		saynn("[b]=== Missions ====[/b]")
		
		var theMainMissions:Array = GM.main.MS.getAllPossibleMainMissions()
		if(theMainMissions.empty()):
			saynn("No missions left! Wait until the developer makes more..")
		
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
		
func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
	if(_action == "startMission"):
		endScene()
		GM.main.MS.startMission(_args[0])
		return

	setState(_action)
