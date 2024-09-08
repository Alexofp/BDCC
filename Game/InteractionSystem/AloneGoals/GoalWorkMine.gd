extends InteractionGoalBase

func getScore(_pawn:CharacterPawn) -> float:
	if(!_pawn.isInmate()):
		return 0.0
	var hunger:int = _pawn.timeSinceLastWork
	if(hunger < 60*100): # 100 minutes
		return 0.0
	
	return 0.05

func getKeepScore() -> float:
	return 0.6

func getText():
	var action = getCurrentAction()
	
	if(action == "work"):
		return "{main.name} is hitting rocks!"
	return "{main.name} is going to work!"

func getActions() -> Array:
	if(getLocation() != "mining_shafts_entering"):
		return [
			{
				id = "go",
				name = "Go to shaft!",
				desc = "Do something",
				score = 1.0,
				args = {},
				time = 30,
			},
		]
	
	return [
		{
			id = "work",
			name = "Work!",
			desc = "Do something",
			score = 1.0,
			args = {},
			time = 30*60,#60*60*2,
		},
	]

func doAction(_id:String, _args:Dictionary):
	if(_id == "work"):
		getPawn().timeSinceLastWork = 0
		completeGoal()
	if(_id == "go"):
		goTowards("mining_shafts_entering")

func getAnimData() -> Array:
	if(getLocation() != "mining_shafts_entering"):
		return [StageScene.Solo, "walk", {pc="main"}]
	return [StageScene.Solo, "stand", {pc="main"}]

func getActivityIcon():
	return RoomStuff.PawnActivity.Work
