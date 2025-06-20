extends PawnInteractionBase

# A util interaction that holds a pawn in place if they have decided to join some sex scene dynamically
# Maybe needs a way to always position itself to the current sex engine

func _init():
	id = "InSex"

func start(_pawns:Dictionary, _args:Dictionary):
	doInvolvePawn("main", _pawns["main"])
	setState("", "main")

func init_text():
	saynn("{main.You} {main.youAre} doing sex..")
	
	if(!GM.main.isCharacterInAnySexEngine(getCharIDByRole("main"))):
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
		return "{main.name} is doing sex.."
	return .getPreviewLineForRole(_role)

func getActivityIconForRole(_role:String):
	return RoomStuff.PawnActivity.Sex

func saveData():
	var data = .saveData()

	#data["timesWaited"] = timesWaited
	return data

func loadData(_data):
	.loadData(_data)

	#timesWaited = SAVE.loadVar(_data, "timesWaited", 0)
