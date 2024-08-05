extends InteractionGoalBase

var stepsAmount:int = 1

func getScore(_pawn:CharacterPawn) -> float:
	return 0.1

func getText():
	return "They be wandering!"

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

	var pawns = GM.main.IS.getPawnsAt(getLocation())
	for pawn in pawns:
		if(pawn == getPawn()):
			continue
		if(true):
			GM.main.IS.startInteraction(load("res://Game/InteractionSystem/Interactions/TestInteraction.gd").new(), {started=getPawn().charID, target=pawn.charID})
			return
			
	stepsAmount -= 1
	if(stepsAmount <= 0):
		completeGoal()
