extends InteractionGoalBase

func getScore(_pawn:CharacterPawn) -> float:
	var hunger:float = _pawn.getHunger()
	if(hunger < 0.5):
		return 0.0
	
	return 0.0 + hunger

func getKeepScore() -> float:
	var hunger:float = getPawn().getHunger()
	if(hunger < 0.5):
		return 0.0
	return getScore(getPawn()) + 0.1

func getText():
	var action = getCurrentAction()
	
	if(action == "eat"):
		return "{main.name} {main.is} eating!"
	return "{main.name} {main.is} hungry! Heading to canteen!"

func getActions() -> Array:
	if(getLocation() != "hall_canteen"):
		return [
			{
				id = "go",
				name = "Go to canteen!",
				desc = "Do something",
				score = 1.0,
				args = {},
				time = 30,
			},
		]
	
	return [
		{
			id = "eat",
			name = "Eat!",
			desc = "Do something",
			score = 1.0,
			args = {},
			time = 300,
		},
	]

func doAction(_id:String, _args:Dictionary):
	if(_id == "eat"):
		getPawn().hunger = 0.0
		completeGoal()
	if(_id == "go"):
		goTowards("hall_canteen")

func getAnimData() -> Array:
	if(getLocation() != "hall_canteen"):
		return [StageScene.Solo, "walk", {pc="main"}]
	return [StageScene.Solo, "stand", {pc="main"}]
