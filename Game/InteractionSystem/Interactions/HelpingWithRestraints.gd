extends PawnInteractionBase

var surrendered:bool = false
var struggleText:String = ""
var tryCount:int = 0
var askCredits:int = 0
var reacterStarted:bool = false
var deterministicOrderHashInt:int = 0
var restraintItemID:String = ""

func _init():
	id = "HelpingWithRestraints"

func start(_pawns:Dictionary, _args:Dictionary):
	doInvolvePawn("starter", _pawns["starter"])
	doInvolvePawn("reacter", _pawns["reacter"])
	deterministicOrderHashInt = RNG.randi_range(1, 1000000)
	if(_args.has("reacterStarted") && _args["reacterStarted"]):
		reacterStarted = true
		setState("init_eager_to_help", "starter")
	else:
		reacterStarted = false
		setState("", "reacter")

func init_text():
	saynn("{starter.You} {starter.youAre} asking for help, wiggling {starter.yourHis} restraints..")
	sayLine("starter", "HelpRestraintsAsk", {main="starter", target="reacter"})

	if(getRoleChar("reacter").getStamina() > 0 && !getRoleChar("reacter").hasBlockedHands() && !getRoleChar("reacter").hasBoundArms()):
		addAction("agree", "Agree", "Agree to help them with their restraints", "help", 1.0, 60, {})
	else:
		addDisabledAction("Agree", "You can't help them while in your current state..")
	addAction("deny", "Deny", "You'd rather not", "default", 0.2, 60, {})

func init_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "agree"):
		setState("restraints_agree", "reacter")
	if(_id == "deny"):
		getRolePawn("reacter").afterSocialInteraction()
		getRolePawn("starter").afterFailedSocialInteraction()
		affectAffection("starter", "reacter", -0.05)
		setState("restraints_deny", "starter")


func init_eager_to_help_text():
	if(struggleText != ""):
		saynn(struggleText)

	var restraintData = getRoleChar("starter").getNextRestraintToStruggleOutOf(deterministicOrderHashInt)
	var restraintIsPlural = getRestraintIsPlural(restraintData.item) if(restraintData != null) else false
	var restraintVisibleName = restraintData.item.getVisibleName() if(restraintData != null) else "the restraint"
	saynn("{reacter.You} {reacter.youAre} about to help {starter.you} remove "+ restraintVisibleName + ".")

	if(struggleText == ""):
		sayLine("reacter", "HelpRestraintsAltStart", {main="reacter", target="starter"}, {restraintIsPlural=restraintIsPlural})

	var acceptHelpProbability = getStarterAcceptHelpProbability()
	var refuseHelpProbability = 1.0 - acceptHelpProbability
	addAction("accept", "Accept", "Allow them to help with your restraints", "default", acceptHelpProbability, 60, {})
	addAction("refuse", "Refuse", "You'd rather keep " + ("it" if(!restraintIsPlural) else "them"), "default", refuseHelpProbability, 60, {})

func init_eager_to_help_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "accept"):
		setState("restraints_agree", "reacter")
	if(_id == "refuse"):
		setState("eager_help_refused", "reacter")


func eager_help_refused_text():
	var restraintData = getRoleChar("starter").getNextRestraintToStruggleOutOf(deterministicOrderHashInt)
	var restraintIsPlural = getRestraintIsPlural(restraintData.item) if(restraintData != null) else false
	var restraintVisibleName = restraintData.item.getVisibleName() if(restraintData != null) else "the restraint"

	saynn("{starter.You} {starter.youVerb('refuse', 'refused')} {reacter.your} help with removing "+restraintVisibleName+".")

	var idSuffix = "Unhappy" if( RNG.chance(50) ) else "Kinky"
	sayLine("starter", "HelpRestraintsAltRefuse"+idSuffix, {main="starter", target="reacter"}, {restraintIsPlural=restraintIsPlural})

	if( (idSuffix == "Kinky") && RNG.chance(50) ):
		sayLine("reacter", "HelpRestraintsAltRefuseKinkyReact", {main="reacter", target="starter"})

	addAction("leave", "Leave", "Time to go", "default", 1.0, 60, {})

func eager_help_refused_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "leave"):
		getRolePawn("starter").afterSocialInteraction()
		getRolePawn("reacter").satisfySocial()
		stopMe()


func restraints_agree_text():
	if(!reacterStarted):
		saynn("{reacter.name} nods and starts tugging on {starter.your} restraints.")
		sayLine("reacter", "HelpRestraintsAgree", {main="reacter", target="starter"})
	else:
		saynn("{reacter.name} starts tugging on {starter.your} restraints.")

	addAction("help", "Help", "Start helping..", "default", 1.0, 60, {})

func restraints_agree_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "help"):
		doHelpStruggleForStarter()
		getRolePawn("reacter").afterSocialInteraction()
		getRolePawn("starter").afterSocialInteraction()


func restraints_deny_text():
	saynn("{reacter.name} shakes {reacter.his} head.")
	sayLine("reacter", "HelpRestraintsDeny", {main="reacter", target="starter"})

	addAction("continue", "Continue", "Oh well..", "default", 1.0, 60, {})

func restraints_deny_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "continue"):
		stopMe()


func restraints_helping_text():
	saynn(struggleText)

	if(getRoleChar("starter").getInventory().hasRemovableRestraintsNoLockedSmartlocks() && getRoleChar("reacter").getStamina() > 0 && !getRoleChar("reacter").hasBlockedHands() && !getRoleChar("reacter").hasBoundArms()):
		addAction("help", "Help", "Continue helping..", "default", 1.0, 60, {})
	else:
		addDisabledAction("Help", "Can't help anymore..")
	addAction("stop", "Stop", "Enough helping..", "default", 0.01 if tryCount < 10 else float(tryCount)/10.0, 60, {})
	if(tryCount > 2):
		addAction("stop_ask_credits", "Stop&ask for credits", "You helped them enough, time to get some credits for your work!", "punishMean", 0.01 if tryCount < 10 else float(tryCount)/10.0, 60, {})

func restraints_helping_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "help"):
		doHelpStruggleForStarter()
	if(_id == "stop"):
		setState("restraints_enough", "starter")
	if(_id == "stop_ask_credits"):
		askCredits = int(tryCount)
		if(askCredits > 10):
			askCredits = 10
		setState("restraints_ask_credits", "starter")


func restraints_enough_text():
	saynn("{reacter.name} stops helping {starter.you}.")
	sayLine("reacter", "HelpRestraintsFinished", {main="reacter", target="starter"})
	saynn("And just like that, {reacter.youHe} {reacter.youVerb('leave')} {starter.youHim} alone..")

	addAction("continue", "Continue", "See what happens next..", "default", 1.0, 60, {})

func restraints_enough_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "continue"):
		getRolePawn("reacter").satisfySocial()
		stopMe()


func restraints_ask_credits_text():
	saynn("{reacter.name} stops helping {starter.you}.")
	sayLine("reacter", "HelpRestraintsFinished", {main="reacter", target="starter"})
	saynn("But before {reacter.youHe} {reacter.youVerb('leave')}..")
	saynn("[say=reacter]That will be.. "+str(askCredits)+" credits.[/say]")
	saynn("Wow, looks like {reacter.yourHis} help wasn't free after all..")

	if(!getRolePawn("starter").isPlayer() || GM.pc.getCredits() >= askCredits):
		addAction("pay", "Pay", "It was worth it..", "surrender", 1.0, 60, {})
	else:
		addDisabledAction("Pay", "You don't have enough credits..")
	addAction("refuse", "Refuse", "You're not paying anything!", "fight", 1.0, 60, {})

func restraints_ask_credits_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "pay"):
		if(getRolePawn("starter").isPlayer()):
			GM.pc.addCredits(-askCredits)
		if(getRolePawn("reacter").isPlayer()):
			GM.pc.addCredits(askCredits)
		setState("restraints_paid", "starter")
	if(_id == "refuse"):
		affectAffection("reacter", "starter", -0.3)
		setState("restraints_refusedpay", "reacter")


func restraints_paid_text():
	saynn("{starter.You} {starter.youVerb('decide')} to just pay the credits..")
	sayLine("reacter", "HelpRestraintsPaid", {main="reacter", target="starter"})

	addAction("continue", "Continue", "See what happens next..", "default", 1.0, 60, {})

func restraints_paid_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "continue"):
		getRolePawn("reacter").satisfySocial()
		stopMe()


func restraints_refusedpay_text():
	saynn("{starter.name} refuses to pay!")
	sayLine("starter", "HelpRestraintsRefusePay", {main="starter", target="reacter"})

	addAction("whatever", "Whatever", "Just leave", "surrender", 1.0, 60, {})
	addAction("attack", "Attack", "Make them pay", "fight", 1.0, 60, {})

func restraints_refusedpay_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "whatever"):
		setState("restraints_refusedwhatever", "reacter")
	if(_id == "attack"):
		#setState("restraints_refuse_attack", "starter")
		startInteraction("GenericAttack", {starter=getRoleID("reacter"), reacter=getRoleID("starter")}, {askCredits=askCredits})


func restraints_refusedwhatever_text():
	saynn("{reacter.name} huffs.")
	sayLine("reacter", "HelpRestraintsRefusePayWhatever", {main="reacter", target="starter"})

	addAction("continue", "Continue", "See what happens next..", "default", 1.0, 60, {})

func restraints_refusedwhatever_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "continue"):
		getRolePawn("reacter").satisfySocial()
		stopMe()


func getAnimData() -> Array:
	if(getState() in ["restraints_refuse_attack", "reacter_won", "reacter_won_leave", "starter_won", "starter_won_leave"]):
		return [StageScene.Duo, "stand", {pc="starter", npc="reacter"}]
	if((getState() == "init_eager_to_help" && (tryCount == 0)) || getState() == "eager_help_refused"):
		return [StageScene.Duo, "stand", {pc="reacter", npc="starter"}]
	return [StageScene.SexStart, "start", {pc="reacter", npc="starter"}]
	
func getPreviewLineForRole(_role:String) -> String:
	if(_role == "starter"):
		return "{starter.name} is being helped by {reacter.name}."
	if(_role == "reacter"):
		return "{reacter.name} is helping {starter.name} with restraints."
	return .getPreviewLineForRole(_role)

func doHelpStruggleForStarter():
	var restraintData = getRoleChar("starter").getNextRestraintToStruggleOutOf(deterministicOrderHashInt)
	restraintItemID = restraintData.item.id if(restraintData != null) else ""

	var theStarter = getRoleChar("starter")
	var struggleData:Dictionary = theStarter.doStruggleOutOfRestraints(false, true, getRoleChar("reacter"), 1.0, deterministicOrderHashInt)
	if(struggleData.empty()):
		struggleText = "Something happened.."
	else:
		struggleText = struggleData["text"]
		if(reacterStarted):
			affectAffection("starter", "reacter", 0.02)

	tryCount += 1

	if(reacterStarted && !getRoleChar("starter").getInventory().hasItemIDEquipped(restraintItemID) && getRoleChar("starter").getInventory().hasRemovableRestraintsNoLockedSmartlocks() && getRoleChar("reacter").getStamina() > 0):
		setState("init_eager_to_help", "starter")
	else:
		setState("restraints_helping", "reacter")

func getStarterAcceptHelpProbability() -> float:
	var acceptHelpProbability:float = 1.0

	var starterDommyness:float = getRolePawn("starter").scorePersonalityMax({PersonalityStat.Subby: -1.0})
	var saverDommyness:float = getRolePawn("reacter").scorePersonalityMax({PersonalityStat.Subby: -1.0})
	var dommynessDisadvantageRatio:float = max(saverDommyness - starterDommyness, 0.0) / 2.0

	acceptHelpProbability = clamp(1.0 - getRolePawn("starter").scoreFetishMax({ Fetish.Bondage: 0.60 }) + 0.45 * dommynessDisadvantageRatio, 0.0, 1.0)
	return acceptHelpProbability

func getRestraintIsPlural(item:ItemBase) -> bool:
	# Ideally there'd be item.isPlural(), but the best we can do for now is an approximate guess
	return ( item.getClothingSlot() in [InventorySlot.Wrists, InventorySlot.Hands, InventorySlot.Ankles] )

func saveData():
	var data = .saveData()

	data["surrendered"] = surrendered
	data["struggleText"] = struggleText
	data["tryCount"] = tryCount
	data["askCredits"] = askCredits
	data["reacterStarted"] = reacterStarted
	data["deterministicOrderHashInt"] = deterministicOrderHashInt
	data["restraintItemID"] = restraintItemID
	return data

func loadData(_data):
	.loadData(_data)

	surrendered = SAVE.loadVar(_data, "surrendered", false)
	struggleText = SAVE.loadVar(_data, "struggleText", "")
	tryCount = SAVE.loadVar(_data, "tryCount", 0)
	askCredits = SAVE.loadVar(_data, "askCredits", 0)
	reacterStarted = SAVE.loadVar(_data, "reacterStarted", false)
	deterministicOrderHashInt = SAVE.loadVar(_data, "deterministicOrderHashInt", 0)
	restraintItemID = SAVE.loadVar(_data, "restraintItemID", "")

