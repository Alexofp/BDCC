extends PawnInteractionBase

func _init():
	id = "PunishInteraction"

func start(_pawns:Dictionary, _args:Dictionary):
	doInvolvePawn("punisher", _pawns["punisher"])
	doInvolvePawn("target", _pawns["target"])
	setState("", "punisher")

func init_text():
	saynn("{punisher.name} looms over {target.you}.")
	sayLine("punisher", "PunishDecide", {punisher="punisher", target="target"})

	addAction("stocks", "Stocks", "Lock them up in stocks!", "punishMean", 1.0, 60, {})
	addAction("sex", "Sex", "Just have some fun with them!", "punish", 1.0, 60, {})
	addAction("leave", "Leave", "Just leave", "default", 0.01, 30, {})

func init_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "stocks"):
		setState("about_to_stocks", "punisher")
	if(_id == "sex"):
		setState("about_to_sex", "punisher")
	if(_id == "leave"):
		setState("just_leaving", "punisher")


func about_to_stocks_text():
	saynn("{punisher.name} clips a leash to {target.your} collar.")
	sayLine("punisher", "PunishDecideStocks", {punisher="punisher", target="target"})

	addAction("stocks", "Escort", "Escort them towards the stocks", "default", 1.0, 60, {})

func about_to_stocks_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "stocks"):
		setState("pulling_to_stocks", "punisher")
		goTowards("main_punishment_spot")


func about_to_sex_text():
	saynn("{punisher.name} grabs {target.you}..")
	sayLine("punisher", "PunishSex", {punisher="punisher", target="target"})

	addAction("sex", "Sex", "Start the sex", "default", 1.0, 300, {start_sex=["punisher", "target"],})

func about_to_sex_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "sex"):
		var _result = getSexResult(_args)
		setState("after_sex", "punisher")


func pulling_to_stocks_text():
	saynn("{punisher.name} is pulling {target.name} towards the punishment platform!")

	addAction("stocks", "Escort", "Pull them towards the stocks", "default", 1.0, 60, {})

func pulling_to_stocks_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "stocks"):
		goTowards("main_punishment_spot")
		if(getLocation() == "main_punishment_spot"):
			setState("about_to_lock_stocks", "punisher")


func about_to_lock_stocks_text():
	saynn("{punisher.name} guides {target.name} to the stocks.")
	sayLine("punisher", "PunishAboutToStocks", {punisher="punisher", target="target"})

	addAction("lock_them", "Lock them", "Force them into the stocks", "default", 1.0, 120, {})

func about_to_lock_stocks_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "lock_them"):
		affectAffection("target", "punisher", -0.1)
		setState("in_stocks", "punisher")


func in_stocks_text():
	saynn("{punisher.name} locks {target.name} into the stocks!")
	sayLine("punisher", "PunishLockIntoStocks", {punisher="punisher", target="target"})

	addAction("leave", "Leave", "Leave them be", "default", 1.0, 30, {})

func in_stocks_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "leave"):
		stopMe()
		startInteraction("InStocks", {inmate=getRoleID("target")})


func after_sex_text():
	saynn("After sex, {punisher.name} leaves {target.you} alone..")

	addAction("leave", "Leave", "Time to go", "default", 1.0, 30, {})

func after_sex_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "leave"):
		stopMe()


func just_leaving_text():
	saynn("{punisher.name} decides to just leave {target.name} alone..")

	addAction("leave", "Leave", "Time to go", "default", 1.0, 30, {})

func just_leaving_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "leave"):
		stopMe()


func getAnimData() -> Array:
	if(getState() == "about_to_sex"):
		return [StageScene.SexStart, "start", {pc="punisher", npc="target"}]
	if(getState() == "in_stocks"):
		return [StageScene.StocksSexOral, "tease", {npc="punisher", pc="target"}]
	if(getState() == "pulling_to_stocks"):
		if(getLocation() != "main_punishment_spot"):
			return [StageScene.Duo, "walk", {pc="target", npc="punisher", npcAction="walk", flipNPC=true, bodyState={leashedBy="punisher"}}]
	
	return [StageScene.Duo, "stand", {pc="target", npc="punisher"}]

