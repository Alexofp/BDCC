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
	
	var punisherRestraintsPreventPulling:bool = getRoleChar("punisher").hasBlockedHands() || getRoleChar("punisher").hasBoundArms()

	if(!punisherRestraintsPreventPulling && getRoleChar("target").getInventory().hasEquippedItemWithTag(ItemTag.AllowsEnslaving) && canGetToStocks()):
		addAction("stocks", "Stocks", "Lock them up in stocks!", "punishMean", 0.2 * getStocksScoreMult(), 60, {})
	elif(punisherRestraintsPreventPulling):
		addDisabledAction("Stocks", "You can't do that with restraints on your arms..")
	else:
		addDisabledAction("Stocks", ""+("They need to be wearing a collar for this!" if canGetToStocks() else "Stocks are too far..")+"")
	if(!punisherRestraintsPreventPulling && getRolePawn("punisher").isInmate() && getRoleChar("target").getInventory().hasEquippedItemWithTag(ItemTag.AllowsEnslaving) && canGetToSlutwall() && getRolePawn("target").isInmate()):
		addAction("slutwall", "Slutwall", "Force them into a slutwall!", "punishMean", 0.2 * getSlutwallScoreMult(), 60, {})
	elif(punisherRestraintsPreventPulling):
		addDisabledAction("Slutwall", "You can't do that with restraints on your arms..")
	else:
		addDisabledAction("Slutwall", ""+(("They need to be wearing a collar for this!" if !getRoleChar("target").getInventory().hasEquippedItemWithTag(ItemTag.AllowsEnslaving) else "They are not one of the inmates..") if canGetToSlutwall() else "Can't get to the slutwall..")+"")
	if(roleCanStartSex("punisher")):
		addAction("sex", "Sex", "Just have some fun with them!", "sexDom", 1.0, 60, {})
	else:
		addDisabledAction("Sex", "You can't fuck them with your restraints..")
	if(roleCanStartSex("target")):
		addAction("sexsub", "Submit to", "Let them fuck you", "sexSub", 1.0, 60, {})
	else:
		addDisabledAction("Submit to", "They can't fuck you with their restraints..")
	addAction("leave", "Leave", "Just leave", "justleave", 1.0, 30, {})

	addDefeatButtons("punisher", "target")

func init_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "stocks"):
		setState("about_to_stocks", "punisher")
	if(_id == "slutwall"):
		setState("about_to_slutwall", "punisher")
	if(_id == "sex"):
		setState("about_to_sex", "punisher")
	if(_id == "sexsub"):
		setState("about_to_subsex", "punisher")
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
		var _result = getSexResult(_args, true)
		setState("after_sex", "punisher")


func about_to_subsex_text():
	saynn("{punisher.name} submits to {target.you}..")
	sayLine("punisher", "PunishSubSex", {punisher="punisher", target="target"})

	addAction("sex", "Sex", "Start the sex", "default", 1.0, 300, {start_sex=["target", "punisher"],})

func about_to_subsex_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "sex"):
		var _result = getSexResult(_args, true)
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
		addRepScore("target", RepStat.Alpha, -3.0)
		setState("in_stocks", "punisher")


func in_stocks_text():
	saynn("{punisher.name} locks {target.name} into the stocks!")
	sayLine("punisher", "PunishLockIntoStocks", {punisher="punisher", target="target"})

	addAction("leave", "Leave", "Leave them be", "default", 1.0, 30, {})

func in_stocks_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "leave"):
		stopMe()
		startInteraction("InStocks", {inmate=getRoleID("target")}, {punisherID=getRoleID("punisher")})


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


func about_to_slutwall_text():
	saynn("{punisher.name} clips a leash to {target.your} collar.")
	sayLine("punisher", "PunishDecidedSlutwall", {punisher="punisher", target="target"})

	addAction("escort", "Escort", "Escort them towards the slutwall", "default", 1.0, 60, {})

func about_to_slutwall_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "escort"):
		setState("pulling_to_slutwall", "punisher")
		goTowards("fight_slutwall")


func pulling_to_slutwall_text():
	saynn("{punisher.name} is pulling {target.name} towards the slutwall!")

	addAction("escort", "Escort", "Pull them towards the slutwall", "default", 1.0, 60, {})

func pulling_to_slutwall_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "escort"):
		goTowards("fight_slutwall")
		if(getLocation() == "fight_slutwall"):
			setState("about_to_lock_slutwall", "punisher")


func about_to_lock_slutwall_text():
	saynn("{punisher.name} is locking {target.name} in the slutwall.")

	addAction("lock_them", "Lock them", "Force them into the slutwall", "default", 1.0, 120, {})

func about_to_lock_slutwall_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "lock_them"):
		affectAffection("target", "punisher", -0.1)
		addRepScore("target", RepStat.Alpha, -3.0)
		setState("in_slutwall", "punisher")


func in_slutwall_text():
	saynn("{punisher.name} locks {target.name} into the slutwall!")
	sayLine("punisher", "PunishLockIntoSlutwall", {punisher="punisher", target="target"})

	addAction("leave", "Leave", "Leave them be", "default", 1.0, 30, {})

func in_slutwall_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "leave"):
		stopMe()
		startInteraction("InSlutwall", {inmate=getRoleID("target")}, {punisherID=getRoleID("punisher")})


func getAnimData() -> Array:
	if(getState() == "about_to_sex"):
		return [StageScene.SexStart, "start", {pc="punisher", npc="target"}]
	if(getState() == "in_slutwall"):
		return [StageScene.SlutwallSex, "tease", {pc="target", npc="punisher"}]
	if(getState() == "in_stocks"):
		return [StageScene.StocksSexOral, "tease", {npc="punisher", pc="target"}]
	if(getState() in ["pulling_to_stocks", "pulling_to_slutwall"]):
		if(getLocation() != "main_punishment_spot" && getLocation() != "fight_slutwall"):
			return [StageScene.Duo, "walk", {pc="target", npc="punisher", npcAction="walk", flipNPC=true, bodyState={leashedBy="punisher"}}]
	if(getState() in [""]):
		return [StageScene.SexStart, "start", {pc="punisher", npc="target"}]
	
	return [StageScene.Duo, "stand", {pc="target", npc="punisher"}]

func getActivityIconForRole(_role:String):
	return RoomStuff.PawnActivity.Chat

func getPreviewLineForRole(_role:String) -> String:
	if(_role == "target"):
		return "{target.name} is being punished by {punisher.name}."
	if(_role == "punisher"):
		return "{punisher.name} is punishing {target.name}."
	return .getPreviewLineForRole(_role)

func isRoleOnALeash(_role:String) -> bool:
	if(_role == "target" && getState() in ["pulling_to_stocks", "pulling_to_slutwall"]):
		return true
	return false
	
func isRoleLeashing(_role:String) -> bool:
	if(_role == "punisher" && getState() in ["pulling_to_stocks", "pulling_to_slutwall"]):
		return true
	return false

