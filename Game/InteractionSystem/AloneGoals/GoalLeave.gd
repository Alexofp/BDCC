extends InteractionGoalBase

func getScore(_pawn:CharacterPawn) -> float:
	if(_pawn.isSlaveToPlayer()):
		return 0.0
	if(_pawn.tiredness >= 1.0):
		return _pawn.tiredness - 0.2
	return 0.0

func getKeepScore() -> float:
	return 1.0

func getText():
	return "{main.name} is leaving.."

func getActions() -> Array:
	return [
		{
			id = "go",
			name = "Go",
			desc = "Do something",
			score = 1.0,
			args = {},
			time = 60,
		},
	]

func doAction(_id:String, _args:Dictionary):
	if(_id == "go"):
		var leaveTarget:String = "hall_elevator"
		var pawn = getPawn()
		if(pawn.isInmate()):
			if(pawn.isLilac()):
				leaveTarget = "cellblock_lilac_nearcell"
			elif(pawn.isHighSecInmate()):
				leaveTarget = "cellblock_red_nearcell"
			else:
				leaveTarget = "cellblock_orange_nearcell"
		elif(pawn.isGuard()):
			leaveTarget = "hall_elevator"
		elif(pawn.isEngineer()):
			leaveTarget = "mining_elevator"
		elif(pawn.isNurse()):
			leaveTarget = "med_elevator"
		
		if(getLocation() == leaveTarget):
			completeGoal()
			getPawn().deleteMe()
		goTowards(leaveTarget)
		

func getAnimData() -> Array:
	return [StageScene.Solo, "walk", {pc="main"}]

func getActivityIcon():
	return RoomStuff.PawnActivity.None
