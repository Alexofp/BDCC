extends PawnInteractionBase

func _init():
	id = "InStocks"

func start(_pawns:Dictionary, _args:Dictionary):
	doInvolvePawn("inmate", _pawns["inmate"])
	setState("", "inmate")
	getCharByRole("inmate").getInventory().forceEquipRemoveOther(GlobalRegistry.createItem("StocksStatic"))

func init_text():
	saynn("{inmate.You} {inmate.youAre} stuck in stocks, there is very little {inmate.youHe} can do, the movement of {inmate.yourHis} head and arms is blocked by a giant metal frame with 3 holes, its angle is forcing {inmate.youHe} to constantly stay bent forward, exposing {inmate.yourHis} butt, your ankles are chained so {inmate.youHe} can’t really move them too. {inmate.YouHe} {inmate.youAre} completely helpless.")

	addAction("rest", "Rest", "Stay quiet and try to get some rest", "default", 1.0, 1800, {})
	addAction("struggle", "Struggle", "Maybe you can escape somehow", "default", 1.0, 300, {})
	if(!getCharByRole("inmate").getInventory().hasLockedStaticRestraints()):
		addAction("escape", "Escape", "Sweet freedom!", "default", 100.0, 0, {})

func init_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "rest"):
		setState("after_rest", "inmate")
		getCharByRole("inmate").addStamina(50)
	if(_id == "struggle"):
		if(getRolePawn("inmate").isPlayer()):
			runScene("StrugglingScene", [false, false])
		else:
			print("TRYING TO REMOVE A RANDOM RESTRAINT")
	if(_id == "escape"):
		stopMe()


func after_rest_text():
	saynn("{inmate.You} decide to stay quiet. {inmate.YouHe} {inmate.youAre} forced to stand in an uncomfortable pose, it’s humiliating but {inmate.youHe} {inmate.youVerb('get')} some rest.")

	addAction("continue", "Continue", "See what happens next", "default", 1.0, 0, {})

func after_rest_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "continue"):
		setState("", "inmate")


func getAnimData() -> Array:
	return [StageScene.Stocks, "idle", {pc="inmate"}]

