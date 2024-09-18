extends PawnInteractionBase

func _init():
	id = "TestInteraction"

func processTime(_howMuch:int):
	pass

func start(_pawns:Dictionary, _args:Dictionary):
	doInvolvePawn("started", _pawns["started"])
	doInvolvePawn("target", _pawns["target"])
	setState("", "started")
	setLocation(getRolePawn("started").getLocation())

func shouldRunOnMeet(_pawn1, _pawn2, _pawn2Moved:bool):
	if(true):
		return [false]
	if(_pawn1.canBeInterrupted() && _pawn2.canBeInterrupted() && RNG.chance(5)):
		return [true, {started=_pawn1.charID, target=_pawn2.charID}, {}]
	return [false]

func init_text():
	return "{started.name} approaches!"

func init_actions():
	return [
		{
			id = "test",
			name = "TESSTTTT!",
			desc = "Do something",
			score = 1.0,
			args = {},
			time = 30,
		},
	]

func init_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "test"):
		setState("test", "target")

func test_text():
	return "Test state!"

func test_actions():
	return [
#		{
#			id = "Test",
#			name = "TESSTTTT!",
#			desc = "Do something",
#			score = 1.0,
#			args = {},
#			time = 30,
#		},
#		{
#			id = "end",
#			name = "ENDDD!",
#			desc = "Do something",
#			score = 1.0,
#			args = {},
#			time = 30,
#		},
		{
			id = "fight",
			name = "Start fight!",
			desc = "Do something",
			score = 1.0,
			args = {},
			time = 30,
			start_fight = ["target", "started"],
		},
		{
			id = "punish",
			name = "Start punish!",
			desc = "Do something",
			score = 1000.0,
			args = {},
			time = 30,
		},
	]


func test_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "Test"):
		setState("", "started")
		if(RNG.chance(10)):
			stopMe()
	if(_id == "punish"):
		startInteraction("PunishInteraction", {punisher=getRoleID("target"), target=getRoleID("started")})
		
	if(_id == "end"):
		stopMe()

	if(_id == "fight"):
		var fightResult = getFightResult(_args)
		print(fightResult)
		#startFight("target", "started", _context)
		setState("", "started")
		
		affectAffection("target", "started", -0.1)
		
		if(fightResult["won"]):
			stopMe()

func getAnimData() -> Array:
	if(getCurrentAction() == "fight"):
		return [StageScene.Duo, "shove", {pc="started", npc="target", npcAction="hurt"}]
	return [StageScene.Duo, "stand", {pc="started", npc="target"}]
