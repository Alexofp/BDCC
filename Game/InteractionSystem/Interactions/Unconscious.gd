extends PawnInteractionBase

func _init():
	id = "Unconscious"

func start(_pawns:Dictionary, _args:Dictionary):
	doInvolvePawn("main", _pawns["main"])
	setState("", "main")

func init_text():
	saynn("{main.You} {main.youAre} unconscious..")
	
	addAction("wait", "Wait", "Maybe something will happen..", "default", 1.0, 600, {})

func init_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "wait"):
		setState("", "main")

func about_to_fuck_text():
	saynn("{user.name} approaches {main.you}..")
	
	saynn("A sinister glint shines in {user.his} eyes..")
	
	addAction("sex", "Sex", "Time to have some fun", "default", 1.0, 300, {start_sex=["user", "main", SexType.DefaultSex, {unconscious=true}],})

func about_to_fuck_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "sex"):
		var _result = getSexResult(_args, true)
		setState("after_sex", "user")

func after_sex_text():
	saynn("After that, it was time for {user.name} to leave fast..")
	
	addAction("leave", "Leave", "Time to go..", "default", 1.0, 60, {})

func after_sex_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "leave"):
		doRemoveRole("user")
		setState("", "main")

func getInterruptActions(_pawn:CharacterPawn) -> Array:
	var result:Array = []
	if(getPawnAmount() == 1 && _pawn.getChar().canStartSex()):
		result.append({
			id = "fuck",
			name = "Fuck",
			desc = "Fuck them while they are unconscious",
			score = 0.5,
			scoreType = "sexUse",
			scoreRole = "main",
			args = {},
		})
	if(getPawnAmount() == 1 && !_pawn.isPlayer() && getRolePawn("main").isPlayer()):
		result.append({
			id = "grab",
			name = "Grab",
			desc = "Do something interesting with them..",
			score = (0.5 if _pawn.getSocial() > 0.4 else 0.0),
			scoreType = "punishMean",
			scoreRole = "main",
			args = {},
		})
	return result

func doInterruptAction(_pawn:CharacterPawn, _id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "fuck"):
		doInvolvePawn("user", _pawn)
		setState("about_to_fuck", "user")
	if(_id == "grab"):
		if(triggerUnconsciousPCGrabEvent(_pawn)):
			stopMe()

func getAnimData() -> Array:
	if(getState() in ["about_to_fuck", "after_sex"]):
		return [StageScene.SexStart, "defeated", {pc="user", npc="main"}]
	return [StageScene.Sleeping, "sleep", {pc="main"}]

func getPreviewLineForRole(_role:String) -> String:
	if(_role == "main"):
		return "{main.name} is unconscious.."
	if(_role == "user"):
		return "{nurse.name} is doing something with {main.name}."
	return .getPreviewLineForRole(_role)

func getActivityIconForRole(_role:String):
	if(_role == "main"):
		return RoomStuff.PawnActivity.Unconscious
	else:
		return RoomStuff.PawnActivity.Chat
