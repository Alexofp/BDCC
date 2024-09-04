extends InteractionGoalBase

func getScore(_pawn:CharacterPawn) -> float:
	if(_pawn.isSlaveToPlayer()):
		var npcSlave:NpcSlave = _pawn.getNpcSlavery()
		var activity = npcSlave.getActivity()
		if(activity != null && activity.id == "Prostitution" && activity.canReceiveCredits()):
			return 2.0
	return 0.0

func getKeepScore() -> float:
	return 100.0

func getText():
	return "{main.name} is trying to give you credits.."

func getActions() -> Array:
	return [
		{
			id = "go",
			name = "Go",
			desc = "Do something",
			score = 1.0,
			args = {},
			time = 15,
		},
	]

func doAction(_id:String, _args:Dictionary):
	if(_id == "go"):
		if(!getPawn().isSlaveToPlayer() || getPawn().getNpcSlavery().getActivityID() != "Prostitution"):
			completeGoal()
			return
		
		var leaveTarget:String = GM.pc.getLocation()
		if(GM.main.IS.hasPawn("pc") && GM.main.IS.getPawn("pc").canBeInterrupted()):
			if(getLocation() == leaveTarget):
				completeGoal()
				#if(getPawn().isSlaveToPlayer()):
				#	getPawn().getNpcSlavery().stopActivity()
				#getPawn().deleteMe()
				GM.main.runScene("SlutProstitutionReceiveCredits", [getPawn().charID])
		var room = GM.world.getRoomByID(leaveTarget)
		if(room != null && !room.isOfflimitsForInmates()):
			goTowards(leaveTarget)
		

func getAnimData() -> Array:
	return [StageScene.Solo, "walk", {pc="main"}]

func getActivityIcon():
	return RoomStuff.PawnActivity.None
