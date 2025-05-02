extends InteractionGoalBase

var targetLoc:String = ""

func getScore(_pawn:CharacterPawn) -> float:
	if(!_pawn.isInmate() && !_pawn.shouldPersueGoalOverride(id)):
		return 0.0
	return 0.05

func getKeepScore() -> float:
	return 0.2

func getText():
	return "{main.name} is heading somewhere."

func getActions() -> Array:
	return [
		{
			id = "go",
			name = "Walk",
			desc = "Go somewhere",
			score = 1.0,
			args = {},
			time = 60,
		},
	]

func doAction(_id:String, _args:Dictionary):
	if(_id == "go"):
		if(targetLoc == ""):
			targetLoc = RNG.pick(GM.world.getZoneRooms("poi", [
				"cellblock_nearcells",
				"main_punishment_spot",
				"main_laundry",
				"main_bathroom1",
				"main_bathroom2",
				"yard_deadend2",
				"gym_entrance",
				"fight_neararena",
				"fight_slutwall",
				"med_lobby_start",
				"mining_nearentrance",
			]))
		
		goTowards(targetLoc)
		if(doLookAround()):
			return
		if(getLocation() == targetLoc):
			completeGoal()

func getAnimData() -> Array:
	return [StageScene.Solo, "walk", {pc="main"}]

func saveData():
	var data = .saveData()
	
	data["tl"] = targetLoc
	return data

func loadData(_data):
	.loadData(_data)
	
	targetLoc = SAVE.loadVar(_data, "tl", "")
