extends InteractionGoalBase

func getScore(_pawn:CharacterPawn) -> float:
	if(_pawn.getChar().isReadyToGiveBirth()):
		if(_pawn.isSlaveToPlayer()):
			return 0.0
		return 1.0
	return 0.0

func getKeepScore() -> float:
	if(getPawn().getChar().isReadyToGiveBirth()):
		return 1.1
	return 0.0

func getText():
	if(getLocation() == "medical_nursery"):
		return "{main.name} is giving birth!"
	return "{main.name} is heading to nursery to give birth!"

func getActions() -> Array:
	if(getLocation() == "medical_nursery"):
		return [
			{
				id = "giveBirth",
				name = "Give birth!",
				desc = "Do something",
				score = 1.0,
				args = {},
				time = 300,
			},
		]
	return [
		{
			id = "go",
			name = "Go!",
			desc = "Do something",
			score = 1.0,
			args = {},
			time = 90,
		},
	]

func doAction(_id:String, _args:Dictionary):
	if(_id == "go"):
		goTowards("medical_nursery")
	if(_id == "giveBirth"):
		getPawn().getChar().giveBirthWithNotification()
		completeGoal()

func getAnimData() -> Array:
	if(getLocation() != "medical_nursery"):
		return [StageScene.Solo, "walk", {pc="main"}]
	return [StageScene.GivingBirth, "birth", {pc="main", bodyState={naked=true}}]

func getActivityIcon():
	return RoomStuff.PawnActivity.GiveBirth
