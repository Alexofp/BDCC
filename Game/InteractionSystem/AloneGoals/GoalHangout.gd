extends InteractionGoalBase

var stepsAmount:int = 1

func getScore(_pawn:CharacterPawn) -> float:
	return 0.1

func getText():
	return "{main.name} is hanging around!"

func onGoalStart():
	stepsAmount = RNG.randi_range(2, 5)

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
	#doWanderGurantee()
	doLookAround()

	stepsAmount -= 1
	if(stepsAmount <= 0):
		completeGoal()

func saveData():
	var data = .saveData()
	
	data["sa"] = stepsAmount
	return data

func loadData(_data):
	.loadData(_data)
	
	stepsAmount = SAVE.loadVar(_data, "sa", 1)
