extends PawnInteractionBase

var timesWaited:int = 0

func _init():
	id = "HelpLayEggs"

func start(_pawns:Dictionary, _args:Dictionary):
	doInvolvePawn("main", _pawns["main"])
	doInvolvePawn("target", _pawns["target"])
	setState("", "main")

func init_text():
	saynn("{main.You} {main.youVerb('approach', 'approaches')} {target.you}, trying to help..")
	
	addAction("sex", "Help", "Time to have some fun", "default", 1.0, 300, {start_sex=["main", "target", SexType.DefaultSex, {SexMod.HelpEggsMode: true}],})

func init_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "sex"):
		var _result = getSexResult(_args, true)
		setState("after_sex", "main")

func after_sex_text():
	saynn("After that, it was time for {main.name} to leave fast..")
	
	addAction("leave", "Leave", "Time to go..", "default", 1.0, 60, {})

func after_sex_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "leave"):
		stopMe()

func getAnimData() -> Array:
	if(state == "after_sex"):
		return [StageScene.SexStart, "start", {pc="main", npc="target"}]
	return [StageScene.EggLaying, "idle", {pc="target", npc="main"}]

func getPreviewLineForRole(_role:String) -> String:
	if(_role == "target"):
		return "{target.name} is trying to lay eggs.."
	if(_role == "main"):
		return "{main.name} is doing something with {target.name}."
	return .getPreviewLineForRole(_role)

func getActivityIconForRole(_role:String):
	return RoomStuff.PawnActivity.Chat

func saveData():
	var data = .saveData()

	data["timesWaited"] = timesWaited
	return data

func loadData(_data):
	.loadData(_data)

	timesWaited = SAVE.loadVar(_data, "timesWaited", 0)
