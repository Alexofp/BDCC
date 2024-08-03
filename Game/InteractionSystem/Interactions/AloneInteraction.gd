extends PawnInteractionBase

func _init():
	id = "AloneInteraction"

func start(_pawns:Dictionary):
	involvedPawns = {main = _pawns["main"]}
	currentPawn = _pawns["main"]

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

func doAction(_id:String, _args:Dictionary, _actionEntry=null):
	var randomDir = RNG.pick(GameWorld.getAllDirections())
	
	if(GM.world.canGoID(location, randomDir)):
		setLocation(GM.world.applyDirectionID(location, randomDir))
		return {time = 0}
	return {time = 60}
