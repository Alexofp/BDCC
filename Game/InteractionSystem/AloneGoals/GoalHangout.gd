extends InteractionGoalBase

var stepsAmount:int = 1

func getScore(_pawn:CharacterPawn) -> float:
	return 0.1

func getText():
	return "They be hanging around!"

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

	stepsAmount -= 1
	if(stepsAmount <= 0):
		completeGoal()
