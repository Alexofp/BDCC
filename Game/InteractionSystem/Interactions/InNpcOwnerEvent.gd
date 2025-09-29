extends PawnInteractionBase

# A util interaction that holds a pawn in place if they are in a npc owner event

func _init():
	id = "InNpcOwnerEvent"

func start(_pawns:Dictionary, _args:Dictionary):
	doInvolvePawn("main", _pawns["main"])
	setState("", "main")

func init_text():
	saynn("{main.You} {main.youAre} talking..")
	
	if(!GM.main.isCharacterInAnyNPCEvent(getCharIDByRole("main"))):
		addAction("go", "Go!", "Time to go", "default", 1.0, 30, {})
	else:
		addAction("wait", "Wait", "Maybe something will happen..", "default", 1.0, 60, {})

func init_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "go"):
		stopMe()

func canRoleBeInterrupted(_role:String) -> bool:
	return false

func getInterruptActions(_pawn:CharacterPawn) -> Array:
	return []

func getAnimData() -> Array:
	return [StageScene.Solo, "stand", {pc="main"}]

func getPreviewLineForRole(_role:String) -> String:
	if(_role == "main"):
		return "{main.name} is doing something.."
	return .getPreviewLineForRole(_role)

func getActivityIconForRole(_role:String):
	return RoomStuff.PawnActivity.Chat

func saveData():
	var data = .saveData()

	#data["timesWaited"] = timesWaited
	return data

func loadData(_data):
	.loadData(_data)

	#timesWaited = SAVE.loadVar(_data, "timesWaited", 0)
