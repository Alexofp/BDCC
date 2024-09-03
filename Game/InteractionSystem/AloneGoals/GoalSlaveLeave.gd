extends InteractionGoalBase

func getScore(_pawn:CharacterPawn) -> float:
	if(_pawn.isSlaveToPlayer()):
		var npcSlave:NpcSlave = _pawn.getNpcSlavery()
		var activity = npcSlave.getActivity()
		if(activity == null || activity.pawnShouldReturnHome()):
			return 0.7
	return 0.0

func getKeepScore() -> float:
	return 10.0

func getText():
	return "{main.name} is heading back to your cell.."

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
		var leaveTarget:String = GM.pc.getCellLocation()

		if(getLocation() == leaveTarget):
			completeGoal()
			getPawn().deleteMe()
		goTowards(leaveTarget)
		

func getAnimData() -> Array:
	return [StageScene.Solo, "walk", {pc="main"}]

func getActivityIcon():
	return RoomStuff.PawnActivity.None
