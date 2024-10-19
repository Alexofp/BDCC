extends InteractionGoalBase

var stepsAmount:int = 1

func getScore(_pawn:CharacterPawn) -> float:
	return 0.1

func getText():
	return "{main.name} is wandering!"

func onGoalStart():
	stepsAmount = RNG.randi_range(3, 6)

func getActions() -> Array:
	return [
		{
			id = "wander",
			name = "Wander",
			desc = "Do something",
			score = 1.0,
			args = {},
			time = 60,
		},
	]

func doAction(_id:String, _args:Dictionary):
#	var randomDir = RNG.pick(GameWorld.getAllDirections())
#
#	if(GM.world.canGoID(location, randomDir)):
#		setLocation(GM.world.applyDirectionID(location, randomDir))
#		return {time = 0}
	#var pawn = getPawn()
	
	doWanderGurantee()
	doLookAround()

	stepsAmount -= 1
	if(stepsAmount <= 0):
		completeGoal()

func getAnimData() -> Array:
	return [StageScene.Solo, "walk", {pc="main"}]

func saveData():
	var data = .saveData()
	
	data["sa"] = stepsAmount
	return data

func loadData(_data):
	.loadData(_data)
	
	stepsAmount = SAVE.loadVar(_data, "sa", 1)
