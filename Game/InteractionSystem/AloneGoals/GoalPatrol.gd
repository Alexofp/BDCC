extends InteractionGoalBase

var nextTarget:String = ""
var zone:String = WorldZone.Greenhouses

func getScore(_pawn:CharacterPawn) -> float:
	if(globalTask != ""):
		return 0.7
	return 0.2

func getKeepScore() -> float:
	return 0.6

func getText():
	if(getCurrentAction() != "go"):
		return "{main.name} {main.is} resting!"
	return "{main.name} {main.is} patroling!"

func getActions() -> Array:
	if(getLocation() == nextTarget):
		return [
			{
				id = "rest",
				name = "Rest",
				desc = "Take a short rest",
				score = 1.0,
				args = {},
				time = 90,
			},
		]
	return [
		{
			id = "go",
			name = "Patrol!",
			desc = "Patrol the station",
			score = 1.0,
			args = {},
			time = 60,
		},
	]
	

func doAction(_id:String, _args:Dictionary):
	if(_id == "go"):
		if(nextTarget == ""):
			nextTarget = GM.world.getRandomZoneRoom(zone)
		
		if(nextTarget != ""):
			goTowards(nextTarget)
	if(_id == "rest"):
		nextTarget = GM.world.getRandomZoneRoom(zone)

func getAnimData() -> Array:
	if(getCurrentAction() == "go"):
		return [StageScene.Solo, "walk", {pc="main"}]
	return [StageScene.Solo, "stand", {pc="main"}]
