extends PawnInteractionBase

var surrendered = false
var struggleText = ""
var tryCount = 0
var askCredits = 0
var reacterStarted = false

func _init():
	id = "HelpingWithRestraints"

func start(_pawns:Dictionary, _args:Dictionary):
	doInvolvePawn("starter", _pawns["starter"])
	doInvolvePawn("reacter", _pawns["reacter"])
	if(_args.has("reacterStarted") && _args["reacterStarted"]):
		reacterStarted = true
		setState("restraints_agree", "reacter")
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


func restraints_agree_text():
	if(!reacterStarted):
		saynn("{reacter.name} nods and starts tugging on {starter.your} restraints.")
		sayLine("reacter", "HelpRestraintsAgree", {main="reacter", target="starter"})
	else:
		saynn("{reacter.name} looks at {starter.your} restraints.")
		sayLine("reacter", "HelpRestraintsAltStart", {main="reacter", target="starter"})

	addAction("help", "Help", "Start helping..", "default", 1.0, 60, {})

func restraints_agree_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "help"):
		doHelpStruggleForStarter()
		getRolePawn("reacter").afterSocialInteraction()
		getRolePawn("starter").afterSocialInteraction()
		setState("restraints_helping", "reacter")
		tryCount = 1


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
		setState("restraints_helping", "reacter")
		tryCount += 1
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
	return [StageScene.SexStart, "start", {pc="reacter", npc="starter"}]
	
func getPreviewLineForRole(_role:String) -> String:
	if(_role == "starter"):
		return "{starter.name} is being helped by {reacter.name}."
	if(_role == "reacter"):
		return "{reacter.name} is helping {starter.name} with restraints."
	return .getPreviewLineForRole(_role)

func doHelpStruggleForStarter():
	var theStarter = getRoleChar("starter")
	var struggleData:Dictionary = theStarter.doStruggleOutOfRestraints(false, true, getRoleChar("reacter"), 1.0)
	if(struggleData.empty()):
		struggleText = "Something happened.."
	else:
		struggleText = struggleData["text"]
		if(reacterStarted):
			affectAffection("starter", "reacter", 0.02)

func saveData():
	var data = .saveData()

	data["surrendered"] = surrendered
	data["struggleText"] = struggleText
	data["tryCount"] = tryCount
	data["askCredits"] = askCredits
	data["reacterStarted"] = reacterStarted
	return data

func loadData(_data):
	.loadData(_data)

	surrendered = SAVE.loadVar(_data, "surrendered", false)
	struggleText = SAVE.loadVar(_data, "struggleText", "")
	tryCount = SAVE.loadVar(_data, "tryCount", 0)
	askCredits = SAVE.loadVar(_data, "askCredits", 0)
	reacterStarted = SAVE.loadVar(_data, "reacterStarted", false)

