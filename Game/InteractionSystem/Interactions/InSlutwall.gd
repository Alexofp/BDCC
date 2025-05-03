extends PawnInteractionBase

var punisherID:String = ""
var struggleText:String = ""
var savedHow:String = ""
var saveTryCount:int = 0
var useCount:int = 0
var tips:int = 0
var shoutedForHelpCount:int = 0
var immediatelyLeft:bool = false

func _init():
	id = "InSlutwall"

func start(_pawns:Dictionary, _args:Dictionary):
	doInvolvePawn("inmate", _pawns["inmate"])
	setState("", "inmate")
	getCharByRole("inmate").getInventory().forceEquipRemoveOther(GlobalRegistry.createItem("SlutwallStatic"))

	if( _args.has("punisherID") ):
		punisherID = _args["punisherID"]

func init_text():
	saynn("{inmate.You} {inmate.youAre} stuck in the slutwall. {inmate.YouHe} {inmate.youAre} completely helpless with {inmate.yourHis} {inmate.thick} {butt} sticking out, free for anyone to fuck..")
	saynn("The tipbox has "+str(tips)+" credits.. There is an automatic mechanism that would unlock {inmate.youHim} automatically at 10 credits..")
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
				saynn("{inmate.He} looks suppressed. But {inmate.he} also doesn't resist at all, {inmate.his} spirit must be broken by now!")
			elif(npcSlave.getBrokenSpirit() > 0.5):
				saynn("{inmate.He} looks suppressed. But {inmate.he} also doesn't resist much, a sign of {inmate.his} spirit breaking.")
			else:
				saynn("{inmate.He} looks suppressed. But {inmate.he} keeps trying to break out occasionally, {inmate.his} spirit is clearly very high.")
		else:
			if(npcSlave.getBrokenSpirit() >= 0.9):
				saynn("{inmate.He} doesn't resist at all, {inmate.his} spirit must be broken by now!")
			elif(npcSlave.getBrokenSpirit() > 0.5):
				saynn("{inmate.He} doesn't resist much, a sign of {inmate.his} spirit breaking.")

	addAction("rest", "Rest", "Stay quiet and try to get some rest", "default", 0.1, 1800, {})
	addAction("shout", "Shout", "Try to get some attention..", "default", (0.1 + scorePersonality("inmate", {PersonalityStat.Naive:0.1})), 30, {})
	if(getRoleChar("inmate").getStamina() > 0):
		addAction("struggle", "Struggle", "Maybe you can escape somehow", "default", 10.0, 300, {})
	else:
		addDisabledAction("Struggle", "You are completely out of stamina and can't struggle")
	if(!getCharByRole("inmate").getInventory().hasLockedStaticRestraints() || (tips >= 10)):
		addAction("escape", "Escape", "Sweet freedom!", "default", 1000.0, 0, {})
	else:
		addDisabledAction("Escape", "You can't escape while the slutwall is still locked..")

func init_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "rest"):
		setState("after_rest", "inmate")
		checkSleep()
		getCharByRole("inmate").addStamina(50)
	if(_id == "shout"):
		shoutedForHelpCount += 1
		setState("about_to_shout", "inmate")
	if(_id == "struggle"):
		if(getRolePawn("inmate").isPlayer()):
			runScene("StrugglingScene", [false, false])
		else:
			setState("about_to_struggle", "inmate")
	if(_id == "escape"):
		if(tips > 0):
			if(getRolePawn("inmate").isPlayer()):
				GM.pc.addCredits(int(tips))
				addMessage("You got "+str(int(tips))+" credits from the tipbox! Nice!")
			elif(getRolePawn("inmate").isSlaveToPlayer()):
				GM.pc.addCredits(int(tips))
				addMessage("Your slave "+getRoleChar("inmate").getName()+" earned you "+str(int(tips))+" credits by being in a slutwall! Nice!")
		getRoleChar("inmate").getInventory().clearStaticRestraints()
		stopMe()


func after_rest_text():
	saynn("{inmate.You} decide to stay quiet and just get some rest.")

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
	saynn("{user.name} approaches the slutwall, about to use {inmate.you}..")

	addAction("continue", "Continue", "Start the sex!", "default", 1.0, 600, {start_sex=["user", "inmate", SexType.SlutwallSex],})

func about_to_use_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "continue"):
		var _sexResult = getSexResult(_args)
		sendSlaveryActivityEvent("inmate", "slutwallUsed", {sex=_sexResult})
		doRepEvent("inmate", "befuckedslutwall")
		setState("after_use", "user")


func after_use_text():
	saynn("{user.name} has finished using {inmate.you}..")
	saynn("The tipbox currently has.. "+str(tips)+" credits in it. {inmate.name} will be able to escape at 10 credits..")

	addAction("leave", "Leave", "Time to go", "default", 1.0, 60, {})
	if(!getRolePawn("user").isPlayer() || GM.pc.getCredits() > 0):
		addAction("leave_a_tip", "Leave a tip", "Leave a single credit as a tip", "help", 2.0, 60, {})
	if(!getRolePawn("user").isPlayer() || GM.pc.getCredits() >= 5):
		addAction("leave_a_big_tip", "Leave a Big Tip", "Leave whole 5 credits!", "help", 0.4, 60, {})
	if(tips > 0):
		addAction("steal_tips", "Steal tips", "Take all the credits for yourself! They won't be happy about it..", "punishMean", (0.1+(0.1*(tips-9)) if tips >= 9 else 0.05), 60, {})

func after_use_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "leave"):
		doRemoveRole("user")
		setState("", "inmate")
	if(_id == "leave_a_tip"):
		if(getRolePawn("user").isPlayer()):
			addMessage("You left a tip!")
			GM.pc.addCredits(-1)
		setState("after_tip", "inmate")
		tips += 1
		if(getRolePawn("inmate").isPlayer()):
			addMessage("You got a tip!")
		affectAffection("user", "inmate", 0.05)
	if(_id == "leave_a_big_tip"):
		if(getRolePawn("user").isPlayer()):
			addMessage("You left a huge ass tip!")
			GM.pc.addCredits(-5)
		setState("after_tip", "inmate")
		tips += 5
		if(getRolePawn("inmate").isPlayer()):
			addMessage("You got a huge ass tip!")
		affectAffection("user", "inmate", 0.1)
	if(_id == "steal_tips"):
		if(getRolePawn("user").isPlayer()):
			addMessage("You took all the tips!")
			GM.pc.addCredits(tips)
		setState("after_steal_tips", "inmate")
		tips = 0
		if(getRolePawn("inmate").isPlayer()):
			addMessage("Your tips got stolen!")
		affectAffection("inmate", "user", -0.2)


func about_to_save_text():
	if(saveTryCount == 0):
		saynn("{saver.You} {saver.youVerb('approach', 'approaches')} {inmate.you}!")
	else:
		saynn("{saver.You} {saver.youVerb('stand')} next to {inmate.you}.")

	saynn("{saver.YouHe} can either spend some of {saver.yourHis} stamina and help {inmate.you} to struggle out of the slutwall.. or use a restraint key to unlock it.")

	if(getRoleChar("saver").getStamina() > 0):
		addAction("help", "Help", "Spend some stamina and help them", "default", 1.0, 180, {})
	else:
		addDisabledAction("Help", "You don't have any stamina left..")
	if(getRoleChar("saver").getInventory().hasItemID("restraintkey")):
		addAction("key", "Restraint key", "Use a restraint key to unlock the slutwall", "help", 0.2, 60, {})
	addAction("leave", "Leave", "", "justleave", 1.0 + (saveTryCount*saveTryCount*0.1), 30, {})

func about_to_save_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "help"):
		if(saveTryCount == 0):
			setState("refusable_save_using_stamina", "inmate")
		else:
			saveUsingStamina()
	if(_id == "key"):
		if(saveTryCount == 0):
			setState("refusable_save_using_key", "inmate")
		else:
			saveUsingKey()
	if(_id == "leave"):
		if(saveTryCount == 0):
			immediatelyLeft = true
		setState("canceled_save", "saver")


func refusable_save_using_stamina_text():
	saynn("{saver.You} {saver.youAre} about to help {inmate.you} struggle out of the slutwall.")

	var acceptHelpProbability = getInmateAcceptHelpProbability()
	var refuseHelpProbability = 1.0 - acceptHelpProbability
	addAction("accept", "Accept", "Allow them to help you", "default", acceptHelpProbability, 60, {})
	addAction("refuse", "Refuse", "You'd rather stay in the slutwall", "default", refuseHelpProbability, 60, {})

func refusable_save_using_stamina_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "accept"):
		saveUsingStamina()
	if(_id == "refuse"):
		setState("refused_save", "saver")


func refusable_save_using_key_text():
	saynn("{saver.You} {saver.youAre} about to use a restraint key to unlock the slutwall.")

	var acceptHelpProbability = getInmateAcceptHelpProbability()
	var refuseHelpProbability = 1.0 - acceptHelpProbability
	addAction("accept", "Accept", "Allow them to unlock the slutwall", "default", acceptHelpProbability, 60, {})
	addAction("refuse", "Refuse", "You'd rather stay in the slutwall", "default", refuseHelpProbability, 60, {})

func refusable_save_using_key_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "accept"):
		saveUsingKey()
	if(_id == "refuse"):
		setState("refused_save", "saver")


func refused_save_text():
	saynn("{inmate.You} {inmate.youVerb('refuse', 'refused')} {saver.your} help.")
	sayLine("inmate", "HelpStocksSlutwallRefuse", {main="inmate", target="saver"})

	addAction("leave", "Leave", "Time to go", "default", 1.0, 60, {})

func refused_save_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "leave"):
		setState("canceled_save", "saver")


func canceled_save_text():
	if(immediatelyLeft):
		saynn("{saver.You} {saver.youVerb('walk')} away, leaving {inmate.you} to {inmate.yourHis} fate..")
	else:
		saynn("{saver.You} {saver.youVerb('leave')}, no longer trying to save {inmate.you}..")

	addAction("continue", "Continue", "See what happens next..", "default", 1.0, 30, {})

func canceled_save_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "continue"):
		doRemoveRole("saver")
		setState("", "inmate")


func save_saved_text():
	if(savedHow=="help"):
		saynn("{saver.name} manages to unlock the slutwall by using {saver.his} raw strength.")
	else:
		saynn("{saver.name} unlocks the slutwall with a restraint key!")

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
	saynn("{inmate.You} {inmate.youVerb('wiggle')} {inmate.yourHis} body and {inmate.thick} butt, trying to catch anyone's attention..")

	addAction("continue", "Continue", "See what happens next..", "default", 1.0, 180, {})

func about_to_shout_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "continue"):
		getCharByRole("inmate").addStamina(20)
		if(!shoutForInterruptions("inmate", 4, 4, 0.5, "You notice "+getCharByRole("inmate").getName()+" wiggling their ass in the slutwall..")):
			setState("after_shout", "inmate")
			checkSleep()


func after_shout_text():
	saynn("No one came after {inmate.your} attempts..")

	addAction("continue", "Continue", "See what happens next..", "default", 1.0, 30, {})

func after_shout_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "continue"):
		setState("", "inmate")


func about_to_sleep_text():
	saynn("It's getting quiet.. Must be because of night time..")
	saynn("Are they just gonna.. leave you like this?")
	saynn("Well, time to get comfy then..")

	addAction("sleep", "Sleep", "Try and sleep like this..", "default", 1.0, 60, {})

func about_to_sleep_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "sleep"):
		GM.main.startNewDay()
		getRoleChar("inmate").addStamina(50)
		setState("after_sleep", "inmate")


func after_sleep_text():
	saynn("You open your eyes.. and realize that you are still stuck in a slutwall.. Yep, it's not a dream, this is really happening..")
	saynn("Welcome to day "+str(GM.main.getDays())+" of your sentence.")

	addAction("continue", "Continue", "See what happens next..", "default", 1.0, 60, {})

func after_sleep_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "continue"):
		setState("", "inmate")


func after_tip_text():
	saynn("Just before leaving, {user.name} decides to add to the tipbox..")
	sayLine("user", "SlutwallAddTip", {main="user", target="inmate"})
	saynn("The tipbox now has.. "+str(tips)+" credits in it. {inmate.name} will be able to get to them.. after freeing {inmate.himself}..")

	addAction("continue", "Continue", "See what happens next..", "default", 1.0, 60, {})

func after_tip_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "continue"):
		doRemoveRole("user")
		setState("", "inmate")


func after_steal_tips_text():
	saynn("{user.name} decides to break into the tipbox and take all of it!")
	sayLine("user", "SlutwallStealCredits", {main="user", target="inmate"})
	saynn("Wow..")

	addAction("continue", "Continue", "Wow.. Here go your creds..", "default", 1.0, 60, {})

func after_steal_tips_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "continue"):
		doRemoveRole("user")
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
			name = "Unlock slave",
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
		saveTryCount = 0
		immediatelyLeft = false
		doInvolvePawn("saver", _pawn)
		setState("about_to_save", "saver")
	if(_id == "free_slave"):
		doInvolvePawn("saver", _pawn)
		setState("free_slave", "inmate")


func getAnimData() -> Array:
	if(getState() in ["save_saved", "free_slave"]):
		return [StageScene.Duo, "stand", {pc="inmate", npc="saver"}]
	if(getState() in ["about_to_save", "refusable_save_using_stamina", "refusable_save_using_key", "refused_save", "save_after_help"]):
		return [StageScene.SlutwallSex, "tease", {pc="inmate", npc="saver"}]
	if(getState() in ["about_to_use", "after_use", "after_tip"]):
		return [StageScene.SlutwallSex, "tease", {pc="inmate", npc="user"}]
	return [StageScene.Slutwall, "idle", {pc="inmate"}]

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
		if(getState() in ["about_to_save", "refusable_save_using_stamina", "refusable_save_using_key", "save_after_help"]):
			return "{inmate.name} is being saved by {saver.name}.."
		return "{inmate.name} is stuck in a slutwall.."
	if(_role == "user"):
		return "{user.name} is using {inmate.name}."
	if(_role == "saver"):
		return "{saver.name} is trying to free {inmate.name} from the slutwall."
	return .getPreviewLineForRole(_role)

func checkSleep():
	if(GM.main.isVeryLate() && getRolePawn("inmate").isPlayer()):
		setState("about_to_sleep", "inmate")

func onStopped():
	if(hasRoleChar("inmate")):
		getRoleChar("inmate").getInventory().clearStaticRestraints()

func getInmateAcceptHelpProbability() -> float:
	var acceptHelpProbability:float = 1.0

	if(shoutedForHelpCount > 0):
		acceptHelpProbability = 1.0
		return acceptHelpProbability

	var inmateDommyness:float = getRolePawn("inmate").scorePersonalityMax({PersonalityStat.Subby: -1.0})
	var saverDommyness:float = getRolePawn("saver").scorePersonalityMax({PersonalityStat.Subby: -1.0})
	var dommynessDisadvantageRatio:float = max(saverDommyness - inmateDommyness, 0.0) / 2.0

	acceptHelpProbability = clamp(1.0 - getRolePawn("inmate").scoreFetishMax({ Fetish.Bondage: 0.4 }) + 0.3 * dommynessDisadvantageRatio, 0.0, 1.0)
	return acceptHelpProbability

func saveUsingStamina() -> void:
	saveTryCount += 1
	var inmate = getRoleChar("inmate")
	var struggleData:Dictionary = inmate.doStruggleOutOfRestraints(false, true, getRoleChar("saver"), 2.0)
	if(struggleData.empty()):
		struggleText = "Something happened.."
	else:
		struggleText = struggleData["text"]
	
	if(inmate.getInventory().hasItemIDEquipped("SlutwallStatic")):
		setState("save_after_help", "inmate")
	else:
		savedHow = "help"
		setState("save_saved", "inmate")
		affectAffectionOnSave()

func saveUsingKey() -> void:
	savedHow = "key"
	setState("save_saved", "inmate")
	affectAffectionOnSave()
	getRoleChar("saver").getInventory().removeXOfOrDestroy("restraintkey", 1)
	getRoleChar("inmate").getInventory().clearStaticRestraints()

func affectAffectionOnSave() -> void:
	var affectionGain:float = 0.05 if(getRoleChar("saver").getID() == punisherID) else 0.2
	affectAffection("inmate", "saver", affectionGain)

func saveData():
	var data = .saveData()

	data["punisherID"] = punisherID
	data["struggleText"] = struggleText
	data["savedHow"] = savedHow
	data["saveTryCount"] = saveTryCount
	data["useCount"] = useCount
	data["tips"] = tips
	data["shoutedForHelpCount"] = shoutedForHelpCount
	data["immediatelyLeft"] = immediatelyLeft
	return data

func loadData(_data):
	.loadData(_data)

	punisherID = SAVE.loadVar(_data, "punisherID", "")
	struggleText = SAVE.loadVar(_data, "struggleText", "")
	savedHow = SAVE.loadVar(_data, "savedHow", "")
	saveTryCount = SAVE.loadVar(_data, "saveTryCount", 0)
	useCount = SAVE.loadVar(_data, "useCount", 0)
	tips = SAVE.loadVar(_data, "tips", 0)
	shoutedForHelpCount = SAVE.loadVar(_data, "shoutedForHelpCount", 0)
	immediatelyLeft = SAVE.loadVar(_data, "immediatelyLeft", false)

