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
		getCurrentPawn().recoverExhaustion()
	if(_id == "getup"):
		stopMe()

func getAnimData() -> Array:
	return [StageScene.GivingBirth, "idle", {pc=role_main}]
