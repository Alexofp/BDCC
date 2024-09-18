extends PawnInteractionBase

const role_main = "main"

func _init():
	id = "FightExhaustion"

func start(_pawns:Dictionary, _args:Dictionary):
	doInvolvePawn(role_main, _pawns[role_main])
	setCurrentRole(role_main)

func getOutputText() -> String:
	return "{main.name} is recovering after a lost fight."

func getActions() -> Array:
	if(getCurrentPawn().getExhaustion() > 0.0):
		return [
			{
				id = "rest",
				name = "Rest",
				desc = "Try to recover some energy",
				score = 1.0,
				args = {},
				time = 30,
			},
		]
	return [
		{
			id = "getup",
			name = "Get up",
			desc = "Time to go",
			score = 1.0,
			args = {},
			time = 30,
		},
	]

func doAction(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "rest"):
		getCurrentPawn().recoverExhaustion(0.08)
	if(_id == "getup"):
		stopMe()

func getAnimData() -> Array:
	return [StageScene.GivingBirth, "idle", {pc=role_main}]

func getPreviewLineForRole(_role:String) -> String:
	if(_role == role_main):
		return "{main.name} is recovering.."
	return .getPreviewLineForRole(_role)

func getActivityIconForRole(_role:String):
	return RoomStuff.PawnActivity.Down

func getInterruptActions(_pawn:CharacterPawn) -> Array:
	var result:Array = []
	if(getPawnAmount() == 1):
		result.append({
			id = "punish",
			name = "Punish",
			desc = "Do mean things to them while they're still down",
			score = 0.1,
			scoreType = "punishMean",
			scoreRole = "main",
			args = {},
		})
	return result

func doInterruptAction(_pawn:CharacterPawn, _id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "punish"):
		GM.main.IS.startInteraction("PunishInteraction", {punisher=_pawn.charID, target=getRoleID("main")})
