extends InteractionGoalBase

func getScore(_pawn:CharacterPawn) -> float:
	if(_pawn.getChar().isReadyToLayEggs()):
		if(_pawn.isSlaveToPlayer()):
			return 0.0
		return 1.0
	return 0.0

func getKeepScore() -> float:
	if(getPawn().getChar().isReadyToLayEggs()):
		return 1.1
	return 0.0

func getText():
	return "{main.name} is laying eggs..."

func getActions() -> Array:
	return [
		{
			id = "giveBirth",
			name = "Lay eggs!",
			desc = "Do something",
			score = 1.0,
			args = {},
			time = 7200, # 2 hours
		},
	]

func doAction(_id:String, _args:Dictionary):
	if(_id == "giveBirth"):
		getPawn().getChar().layEggsWithNotificationIfNeeded()
		completeGoal()

func getAnimData() -> Array:
	return [StageScene.EggLaying, "idle", {pc="main", bodyState={naked=true}}]

func getActivityIcon():
	return RoomStuff.PawnActivity.LayEggs
