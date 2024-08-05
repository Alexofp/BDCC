extends PawnInteractionBase

func _init():
	id = "TestInteraction"

func processTime(_howMuch:int):
	pass

func start(_pawns:Dictionary):
	involvedPawns = {started = _pawns["started"], target = _pawns["target"]}
	currentPawn = "started"
	setLocation(getRolePawn("started").getLocation())

func getOutputText() -> String:
	return "TEST INTERACTION!"

func getActions() -> Array:
	return [
		{
			id = "Test",
			name = "TESSTTTT!",
			desc = "Do something",
			score = 1.0,
			args = {},
			time = 30,
		},
		{
			id = "end",
			name = "ENDDD!",
			desc = "Do something",
			score = 0.0,
			args = {},
			time = 30,
		},
	]

func doAction(_id:String, _args:Dictionary):
	if(currentPawn == "started"):
		currentPawn = "target"
	else:
		currentPawn = "started"
		
	if(RNG.chance(10) || _id == "end"):
		stopMe()

func getDebugInfo():
	var res:Array = .getDebugInfo()

	res.append("currentPawn: "+currentPawn)
	
	return res
