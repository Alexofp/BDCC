extends InteractionGoalBase

func getScore(_pawn:CharacterPawn) -> float:
	return 0.1

func getText():
	return "They be wandering!"

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
	
	if(!doWanderGurantee()):
		return {time = 0}
	return {time = 60}
