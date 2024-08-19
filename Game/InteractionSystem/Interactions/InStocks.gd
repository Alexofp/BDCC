extends PawnInteractionBase

var struggleText = ""

func _init():
	id = "InStocks"

func start(_pawns:Dictionary, _args:Dictionary):
	doInvolvePawn("inmate", _pawns["inmate"])
	setState("", "inmate")
	getCharByRole("inmate").getInventory().forceEquipRemoveOther(GlobalRegistry.createItem("StocksStatic"))

func init_text():
	saynn("{inmate.You} {inmate.youAre} stuck in stocks, there is very little {inmate.youHe} can do, the movement of {inmate.yourHis} head and arms is blocked by a giant metal frame with 3 holes, its angle is forcing {inmate.youHe} to constantly stay bent forward, exposing {inmate.yourHis} butt, your ankles are chained so {inmate.youHe} can’t really move them too. {inmate.YouHe} {inmate.youAre} completely helpless.")
	if(!getRolePawn("inmate").isPlayer()):
		saynn("{inmate.name} has "+str(getRoleChar("inmate").getStamina())+" stamina left.")

	addAction("rest", "Rest", "Stay quiet and try to get some rest", "default", 0.1, 1800, {})
	if(getRoleChar("inmate").getStamina() > 0):
		addAction("struggle", "Struggle", "Maybe you can escape somehow", "default", 10.0, 300, {})
	else:
		addDisabledAction("Struggle", "You are completely out of stamina and can't struggle")
	if(!getCharByRole("inmate").getInventory().hasLockedStaticRestraints()):
		addAction("escape", "Escape", "Sweet freedom!", "default", 1000.0, 0, {})
	else:
		addDisabledAction("Escape", "You can't escape while the stocks are still locked..")

func init_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "rest"):
		setState("after_rest", "inmate")
		getCharByRole("inmate").addStamina(50)
	if(_id == "struggle"):
		if(getRolePawn("inmate").isPlayer()):
			runScene("StrugglingScene", [false, false])
		else:
			setState("about_to_struggle", "inmate")
	if(_id == "escape"):
		stopMe()


func after_rest_text():
	saynn("{inmate.You} decide to stay quiet. {inmate.YouHe} {inmate.youAre} forced to stand in an uncomfortable pose, it’s humiliating but {inmate.youHe} {inmate.youVerb('get')} some rest.")

	addAction("continue", "Continue", "See what happens next", "default", 1.0, 0, {})

func after_rest_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "continue"):
		setState("", "inmate")


func about_to_struggle_text():
	saynn("{inmate.name} is trying to struggle!")

	addAction("continue", "Continue", "See what happens next..", "default", 1.0, 60, {})

func about_to_struggle_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "continue"):
		var inmate = getRoleChar("inmate")
		var struggleData:Dictionary = inmate.doStruggleOutOfRestraints()
		if(struggleData.empty()):
			return
		struggleText = struggleData["text"]
		setState("after_struggle", "inmate")


func after_struggle_text():
	saynn(struggleText)

	addAction("continue", "Continue", "See what happens next..", "default", 1.0, 60, {})

func after_struggle_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "continue"):
		setState("", "inmate")


func about_to_use_text():
	saynn("{user.name} approaches the stocks, about to use {inmate.you}..")

	addAction("continue", "Continue", "Start the sex!", "default", 1.0, 600, {start_sex=["user", "inmate", SexType.StocksSex],})

func about_to_use_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "continue"):
		var _sexResult = getSexResult(_args)
		setState("after_use", "user")


func after_use_text():
	saynn("{user.name} has finished using {inmate.you}..")

	addAction("leave", "Leave", "Time to go", "default", 1.0, 60, {})

func after_use_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "leave"):
		doRemoveRole("user")
		setState("", "inmate")


func getInterruptActions(_pawn:CharacterPawn) -> Array:
	var result:Array = []
	if(getPawnAmount() == 1):
		result.append({
			id = "use",
			name = "Use",
			desc = "Use them while they are stuck in stocks",
			score = 1.0,
			scoreType = "default",
			scoreRole = "inmate",
			args = {},
		})
	return result

func doInterruptAction(_pawn:CharacterPawn, _id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "use"):
		doInvolvePawn("user", _pawn)
		setState("about_to_use", "user")


func getAnimData() -> Array:
	if(getState() in ["about_to_use", "after_use"]):
		return [StageScene.StocksSexOral, "tease", {pc="inmate", npc="user"}]
	return [StageScene.Stocks, "idle", {pc="inmate"}]

func saveData():
	var data = .saveData()

	data["struggleText"] = struggleText
	return data

func loadData(_data):
	.loadData(_data)

	struggleText = SAVE.loadVar(_data, "struggleText", "")

