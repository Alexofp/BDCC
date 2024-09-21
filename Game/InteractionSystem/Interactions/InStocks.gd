extends PawnInteractionBase

var struggleText = ""
var savedHow = ""
var saveTryCount = 0

func _init():
	id = "InStocks"

func start(_pawns:Dictionary, _args:Dictionary):
	doInvolvePawn("inmate", _pawns["inmate"])
	setState("", "inmate")
	getCharByRole("inmate").getInventory().forceEquipRemoveOther(GlobalRegistry.createItem("StocksStatic"))

func init_text():
	saynn("{inmate.You} {inmate.youAre} stuck in stocks, there is very little {inmate.youHe} can do, the movement of {inmate.yourHis} head and arms is blocked by a giant metal frame with 3 holes, its angle is forcing {inmate.youHe} to constantly stay bent forward, exposing {inmate.yourHis} butt, your ankles are chained so {inmate.youHe} can’t really move them too. {inmate.YouHe} {inmate.youAre} completely helpless.")
	var thePawn = getRolePawn("inmate")
	if(!thePawn.isPlayer()):
		saynn("{inmate.name} has "+str(getRoleChar("inmate").getStamina())+" stamina left.")
	var npc = getRoleChar("inmate")
	if(npc.hasEffect(StatusEffect.HasTallyMarks)):
		var tallyMarks = npc.getEffect(StatusEffect.HasTallyMarks)
		var tallyAmount = tallyMarks.totalAmount
		if(tallyAmount > 0):
			saynn("{inmate.YourHis} body has "+str(tallyAmount)+" tallymark"+("s" if tallyAmount != 1 else "")+" on it which means that {inmate.youHe} got used roughly that many times.")
	if(thePawn.isSlaveToPlayer()):
		var npcSlave:NpcSlave = thePawn.getNpcSlavery()
		if(npcSlave.getWorkEfficiency() <= 0.1):
			saynn("Your slave is very tired. Using {inmate.him} now will make {inmate.him} more depressed.")
		if(npcSlave.getDespair() >= 0.8):
			saynn("{inmate.He} looks very depressed, {inmate.his} mind might snap at any moment.")
		elif(npcSlave.getDespair() >= 0.5):
			if(npcSlave.getBrokenSpirit() >= 0.9):
				saynn("{inmate.He} looks supressed. But {inmate.he} also doesn't resist at all, {inmate.his} spirit must be broken by now!")
			elif(npcSlave.getBrokenSpirit() > 0.5):
				saynn("{inmate.He} looks supressed. But {inmate.he} also doesn't resist much, a sign of {inmate.his} spirit breaking.")
			else:
				saynn("{inmate.He} looks supressed. But {inmate.he} keeps trying to break out occasionally, {inmate.his} spirit is clearly very high.")
		else:
			if(npcSlave.getBrokenSpirit() >= 0.9):
				saynn("{inmate.He} doesn't resist at all, {inmate.his} spirit must be broken by now!")
			elif(npcSlave.getBrokenSpirit() > 0.5):
				saynn("{inmate.He} doesn't resist much, a sign of {inmate.his} spirit breaking.")

	addAction("rest", "Rest", "Stay quiet and try to get some rest", "default", 0.1, 1800, {})
	addAction("shout", "Shout", "Try to get some attetion to you..", "default", (0.1 + scorePersonality("inmate", {PersonalityStat.Naive:0.1})), 30, {})
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
		checkSleep()
		getCharByRole("inmate").addStamina(50)
	if(_id == "shout"):
		setState("about_to_shout", "inmate")
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
		sendSlaveryActivityEvent("inmate", "stocksUsed", {sex=_sexResult})
		doRepEvent("inmate", "befuckedstocks")
		setState("after_use", "user")


func after_use_text():
	saynn("{user.name} has finished using {inmate.you}..")

	addAction("leave", "Leave", "Time to go", "default", 1.0, 60, {})

func after_use_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "leave"):
		doRemoveRole("user")
		setState("", "inmate")


func about_to_save_text():
	saynn("{saver.name} approaches {inmate.you}!")
	saynn("{saver.YouHe} can either spend some of {saver.yourHis} stamina and help {inmate.you} to struggle out of stocks.. or use a restraint key to unlock it.")

	if(getRoleChar("saver").getStamina() > 0):
		addAction("help", "Help", "Spend some stamina and help them", "default", 1.0, 180, {})
	else:
		addDisabledAction("Help", "You don't have any stamina left..")
	if(getRoleChar("saver").getInventory().hasItemID("restraintkey")):
		addAction("key", "Restraint key", "Use a restraint key to unlock the stocks", "help", 0.2, 60, {})
	addAction("leave", "Leave", "", "justleave", 1.0 + (saveTryCount*saveTryCount*0.1), 30, {})

func about_to_save_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "help"):
		saveTryCount += 1
		var inmate = getRoleChar("inmate")
		var struggleData:Dictionary = inmate.doStruggleOutOfRestraints(false, true, getRoleChar("saver"), 2.0)
		if(struggleData.empty()):
			struggleText = "Something happened.."
		else:
			struggleText = struggleData["text"]
		
		if(inmate.getInventory().hasItemIDEquipped("StocksStatic")):
			setState("save_after_help", "inmate")
		else:
			savedHow = "help"
			setState("save_saved", "inmate")
			affectAffection("inmate", "saver", 0.2)
	if(_id == "key"):
		savedHow = "key"
		setState("save_saved", "inmate")
		affectAffection("inmate", "saver", 0.2)
		getRoleChar("saver").getInventory().removeXOfOrDestroy("restraintkey", 1)
		getRoleChar("inmate").getInventory().clearStaticRestraints()
	if(_id == "leave"):
		setState("canceled_save", "saver")


func canceled_save_text():
	saynn("{saver.name} is leaving, no longer trying to save {inmate.you}..")

	addAction("leave", "Leave", "Time to go", "default", 1.0, 60, {})

func canceled_save_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "leave"):
		doRemoveRole("saver")
		setState("", "inmate")


func save_saved_text():
	if(savedHow=="help"):
		saynn("{saver.name} manages to unlock the stocks by using {saver.his} raw strength.")
	else:
		saynn("{saver.name} unlocks the stocks with a restraint key!")

	addAction("leave", "Free!", "You're free!", "default", 1.0, 60, {})

func save_saved_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "leave"):
		stopMe()


func save_after_help_text():
	saynn(struggleText)

	addAction("continue", "Continue", "See what happens next..", "default", 1.0, 30, {})
	addAction("stop", "Stop them", "Wiggle them off", "default", 0.0, 60, {})

func save_after_help_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "continue"):
		setState("about_to_save", "saver")
	if(_id == "stop"):
		setState("canceled_save", "saver")


func about_to_shout_text():
	if(getRoleChar("inmate").isGagged()):
		saynn("{inmate.You} {inmate.youAre} gagged but {inmate.youHe} still {inmate.youVerb('try', 'tries')} to get some attention by wiggling {inmate.yourHis} body..")
	else:
		saynn("{inmate.You} {inmate.youVerb('try', 'tries')} to shout to get someone's attention..")
		sayLine("inmate", "StocksShout", {main="inmate"})

	addAction("continue", "Continue", "See what happens next..", "default", 1.0, 180, {})

func about_to_shout_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "continue"):
		getCharByRole("inmate").addStamina(20)
		if(!shoutForInterruptions("inmate", 3, 2, 0.5, "You hear begging coming from "+getCharByRole("inmate").getName()+" who is stuck in stocks at the punishment platform..")):
			setState("after_shout", "inmate")
			checkSleep()


func after_shout_text():
	saynn("No one came after {inmate.your} attempts.. At least {inmate.youHe} got a small rest..")

	addAction("continue", "Continue", "See what happens next..", "default", 1.0, 30, {})

func after_shout_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "continue"):
		setState("", "inmate")


func about_to_sleep_text():
	saynn("It seems to be very late.. everyone is heading to their cells and rooms..")
	saynn("Are they just gonna.. leave you like this?")
	saynn("Well, time to get comfy then..")

	addAction("sleep", "Sleep", "Try and sleep like this..", "default", 1.0, 60, {})

func about_to_sleep_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "sleep"):
		GM.main.startNewDay()
		getRoleChar("inmate").addStamina(50)
		setState("after_sleep", "inmate")


func after_sleep_text():
	saynn("You open your eyes.. and realize that you are still bound in stocks.. Yep, it's not a dream, this is really happening..")
	saynn("Welcome to day "+str(GM.main.getDays())+" of your sentence.")

	addAction("continue", "Continue", "See what happens next..", "default", 1.0, 60, {})

func after_sleep_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "continue"):
		setState("", "inmate")


func free_slave_text():
	saynn("Enough stocks, you free {inmate.name} up and then order {inmate.him} to return back to your cell.")

	addAction("continue", "Continue", "See what happens next..", "default", 1.0, 60, {})

func free_slave_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "continue"):
		stopMe()


func getInterruptActions(_pawn:CharacterPawn) -> Array:
	var result:Array = []
	if(getPawnAmount() == 1):
		result.append({
			id = "use",
			name = "Use",
			desc = "Use them while they are stuck in stocks",
			score = 1.0,
			scoreType = "sexUse",
			scoreRole = "inmate",
			args = {},
		})
	if(getPawnAmount() == 1):
		result.append({
			id = "free",
			name = "Free",
			desc = "Try to free them!",
			score = 1.0,
			scoreType = "help",
			scoreRole = "inmate",
			args = {},
		})
	if(getPawnAmount() == 1 && getRolePawn("inmate").isSlaveToPlayer()):
		result.append({
			id = "free_slave",
			name = "Unlock stocks",
			desc = "Let your slave return back to your cell..",
			score = 0.0,
			scoreType = "default",
			scoreRole = "inmate",
			args = {},
		})
	return result

func doInterruptAction(_pawn:CharacterPawn, _id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "use"):
		doInvolvePawn("user", _pawn)
		setState("about_to_use", "user")
	if(_id == "free"):
		doInvolvePawn("saver", _pawn)
		setState("about_to_save", "saver")
		saveTryCount = 0
	if(_id == "free_slave"):
		doInvolvePawn("saver", _pawn)
		setState("free_slave", "inmate")


func getAnimData() -> Array:
	if(getState() in ["save_saved", "free_slave"]):
		return [StageScene.Duo, "stand", {pc="inmate", npc="saver"}]
	if(getState() in ["about_to_save", "save_after_help"]):
		return [StageScene.StocksSexOral, "tease", {pc="inmate", npc="saver"}]
	if(getState() in ["about_to_use", "after_use"]):
		return [StageScene.StocksSexOral, "tease", {pc="inmate", npc="user"}]
	return [StageScene.Stocks, "idle", {pc="inmate"}]

func getActivityIconForRole(_role:String):
	if(_role == "inmate"):
		return RoomStuff.PawnActivity.Stocks
	else:
		return RoomStuff.PawnActivity.Chat
	#return .getActivityIconForRole(_role)

func getPreviewLineForRole(_role:String) -> String:
	if(_role == "inmate"):
		if(getState() in ["about_to_use", "after_use"]):
			return "{inmate.name} is being used by {user.name}.."
		if(getState() in ["about_to_save", "save_after_help"]):
			return "{inmate.name} is being saved by {saver.name}.."
		return "{inmate.name} is stuck in stocks.."
	if(_role == "user"):
		return "{user.name} is using {inmate.name}."
	if(_role == "saver"):
		return "{saver.name} is trying to free {inmate.name} from stocks."
	return .getPreviewLineForRole(_role)

func checkSleep():
	if(GM.main.isVeryLate() && getRolePawn("inmate").isPlayer()):
		setState("about_to_sleep", "inmate")

func onStopped():
	if(hasRoleChar("inmate")):
		getRoleChar("inmate").getInventory().clearStaticRestraints()

func saveData():
	var data = .saveData()

	data["struggleText"] = struggleText
	data["savedHow"] = savedHow
	data["saveTryCount"] = saveTryCount
	return data

func loadData(_data):
	.loadData(_data)

	struggleText = SAVE.loadVar(_data, "struggleText", "")
	savedHow = SAVE.loadVar(_data, "savedHow", "")
	saveTryCount = SAVE.loadVar(_data, "saveTryCount", 0)

