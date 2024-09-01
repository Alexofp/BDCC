extends InteractionGoalBase

func getScore(_pawn:CharacterPawn) -> float:
	if(_pawn.getCharacter().hasBoundArms() || _pawn.getCharacter().hasBlockedHands()):
		return 0.0
	if(_pawn.getCharacter().canRepairClothes()):
		return 0.05
	return 0.0

func getKeepScore() -> float:
	return 0.7

func getText():
	return "{main.name} is heading to laundry room to get {main.his} clothes repaired!"

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
		if(getLocation() == "main_laundry"):
			getPawn().getCharacter().repairAllClothes()
			completeGoal()
		goTowards("main_laundry")
		

func getAnimData() -> Array:
	return [StageScene.Solo, "walk", {pc="main"}]

func getActivityIcon():
	return RoomStuff.PawnActivity.None
