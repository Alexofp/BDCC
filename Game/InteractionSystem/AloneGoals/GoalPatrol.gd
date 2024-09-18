extends InteractionGoalBase

var nextTarget:String = ""
var zone:String = WorldZone.Greenhouses

func getScore(_pawn:CharacterPawn) -> float:
	if(globalTask != ""):
		return 0.7
	return 0.0

func getKeepScore() -> float:
	return 0.8

func getText():
	return "{main.name} is patroling the prison!"

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

func saveData():
	var data = .saveData()
	
	data["nt"] = nextTarget
	data["z"] = zone
	return data

func loadData(_data):
	.loadData(_data)
	
	nextTarget = SAVE.loadVar(_data, "nt", "")
	zone = SAVE.loadVar(_data, "z", WorldZone.Greenhouses)
