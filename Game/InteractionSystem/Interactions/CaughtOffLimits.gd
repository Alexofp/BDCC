extends PawnInteractionBase

func _init():
	id = "CaughtOffLimits"

func processTime(_howMuch:int):
	pass

func start(_pawns:Dictionary, _args:Dictionary):
	doInvolvePawn("guard", _pawns["guard"])
	doInvolvePawn("inmate", _pawns["inmate"])
	setState("", "inmate")

func shouldRunOnMeet(_pawn1, _pawn2, _pawn2Moved:bool):
	if(!_pawn1.canBeInterrupted() || !_pawn2.canBeInterrupted()):
		return [false]
		
	if(_pawn2.isGuard() && _pawn1.isInmate()):
		var pawnTemp = _pawn1
		_pawn1 = _pawn2
		_pawn2 = pawnTemp
	
	if(_pawn1.isGuard() && _pawn2.isInmate()):
		var pawnLoc = _pawn2.getLocation()
		var pawnRoom = GM.world.getRoomByID(pawnLoc)
		
		var isBadLoc = (pawnRoom.loctag_Greenhouses || pawnRoom.loctag_GuardsEncounter)
		
		if(isBadLoc):
			return [true, {guard=_pawn1.charID, inmate=_pawn2.charID}, {}]

	return [false]

func init_text():
	return "{guard.name} notices {inmate.name} in an off-limits area!"

func init_actions():
	return [
		{
			id = "fight",
			name = "Fight!",
			desc = "Protect yourself",
			score = 1.0,
			args = {},
			time = 600,
			start_fight = ["inmate", "guard"],
			#actionText = "Fight has started!",
		},
		{
			id = "giveup",
			name = "Give up",
			desc = "Just surrender",
			score = 0.2,
			args = {},
			time = 30,
		},
	]

func init_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "fight"):
		var fightResult = getFightResult(_args)
		
		if(fightResult["won"]):
			setState("inmate_won", "inmate")
		else:
			setState("guard_won", "guard")
	if(_id == "giveup"):
		setState("guard_won", "guard")

func inmate_won_text():
	return "{inmate.name} won!"

func inmate_won_actions():
	return [
		{
			id = "leave",
			name = "Leave",
			desc = "Just leave",
			score = 1.0,
			args = {},
			time = 30,
		},
		{
			id = "sex",
			name = "Sex!",
			desc = "Do something",
			score = 1.0,
			args = {},
			time = 30,
			start_sex = ["inmate", "guard"],
		},
	]

func inmate_won_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "leave"):
		makeRoleExhausted("guard")
		stopMe()
	if(_id == "sex"):
		makeRoleExhausted("guard")
		stopMe()




func guard_won_text():
	return "{guard.name} won!"

func guard_won_actions():
	return [
		{
			id = "leave",
			name = "Leave",
			desc = "Just leave",
			score = 0.0,
			args = {},
			time = 30,
		},
		{
			id = "sex",
			name = "Sex!",
			desc = "Do something",
			score = 0.0,
			args = {},
			time = 30,
			start_sex = ["guard", "inmate"],
		},
		{
			id = "punish",
			name = "Punish!",
			desc = "Punish the inmate",
			score = 1.0,
			args = {},
			time = 30,
		},
	]

func guard_won_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "leave"):
		makeRoleExhausted("inmate")
		stopMe()
	if(_id == "sex"):
		makeRoleExhausted("inmate")
		stopMe()
	if(_id == "punish"):
		startInteraction("PunishInteraction", {punisher=getRoleID("guard"), target=getRoleID("inmate")})


func getAnimData() -> Array:
	if(getCurrentAction() == "fight"):
		return [StageScene.Duo, "shove", {pc="inmate", npc="guard", npcAction="hurt"}]
	return [StageScene.Duo, "stand", {pc="inmate", npc="guard"}]
