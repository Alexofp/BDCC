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
		saynn("{reacter.name} nods.")
		saynn("[say=reacter]LET'S SEE..[/say]")
	else:
		saynn("{reacter.name} looks at {starter.your} restraints.")
		saynn("[say=reacter]LET ME HELP.[/say]")

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
	saynn("[say=reacter]NO, CAN'T DO.[/say]")

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
	saynn("[say=reacter]That's all that I can do.[/say]")
	saynn("And just like that, {reacter.youHe} {reacter.youVerb('leave')} {starter.youHim} alone..")

	addAction("continue", "Continue", "See what happens next..", "default", 1.0, 60, {})

func restraints_enough_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "continue"):
		getRolePawn("reacter").satisfySocial()
		stopMe()


func restraints_ask_credits_text():
	saynn("{reacter.name} stops helping {starter.you}.")
	saynn("[say=reacter]That's all that I can do.[/say]")
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
	saynn("[say=reacter]THANKS. I WILL GO NOW.[/say]")

	addAction("continue", "Continue", "See what happens next..", "default", 1.0, 60, {})

func restraints_paid_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "continue"):
		getRolePawn("reacter").satisfySocial()
		stopMe()


func restraints_refusedpay_text():
	saynn("{starter.name} refuses to pay!")
	saynn("[say=starter]YOU DIDN'T EVEN DO THAT MUCH.[/say]")

	addAction("whatever", "Whatever", "Just leave", "surrender", 1.0, 60, {})
	addAction("attack", "Attack", "Make them pay", "fight", 1.0, 60, {})

func restraints_refusedpay_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "whatever"):
		setState("restraints_refusedwhatever", "reacter")
	if(_id == "attack"):
		setState("restraints_refuse_attack", "starter")


func restraints_refusedwhatever_text():
	saynn("{reacter.name} huffs.")
	saynn("[say=reacter]WHATEVER THEN.[/say]")

	addAction("continue", "Continue", "See what happens next..", "default", 1.0, 60, {})

func restraints_refusedwhatever_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "continue"):
		getRolePawn("reacter").satisfySocial()
		stopMe()


func restraints_refuse_attack_text():
	saynn("{reacter.You} suddenly {reacter.youVerb('attack')} {starter.you}!")
	saynn("[say=reacter]I WILL FUCK YOU UP![/say]")

	addAction("fight", "Fight", "Fight back", "fight", 1.0, 300, {start_fight=["reacter", "starter"],})
	addAction("surrender", "Surrender", "Just surrender, it's not worth it..", "surrender", 1.0, 60, {})

func restraints_refuse_attack_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "fight"):
		surrendered = false
		var fightResult = getFightResult(_args)
		
		if(fightResult["won"]):
			setState("reacter_won", "reacter")
			
			if(getRolePawn("starter").isPlayer()):
				GM.pc.addCredits(-askCredits)
				addMessage("You lost credits!")
			if(getRolePawn("reacter").isPlayer()):
				GM.pc.addCredits(askCredits)
				addMessage("You got credits!")
		else:
			setState("starter_won", "starter")
	if(_id == "surrender"):
		surrendered = true
		setState("reacter_won", "reacter")
		
		if(getRolePawn("starter").isPlayer()):
			GM.pc.addCredits(-askCredits)
			addMessage("You lost credits!")
		if(getRolePawn("reacter").isPlayer()):
			GM.pc.addCredits(askCredits)
			addMessage("You got credits!")


func reacter_won_text():
	if(!surrendered):
		saynn("{reacter.name} won the fight! {starter.name} hits the floor, unable to continue fighting..")
	else:
		saynn("{starter.name} decides to surrender instantly..")
	saynn("{reacter.You} {reacter.youVerb('fetch', 'fetches')} "+str(askCredits)+" credits from {starter.you}..")

	addAction("punish", "Punish", "Punish them more!", "punish", 1.0, 60, {})
	addAction("leave", "Leave", "Just leave", "surrender", 0.2, 60, {})

func reacter_won_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "punish"):
		startInteraction("PunishInteraction", {punisher=getRoleID("reacter"), target=getRoleID("starter")})
	if(_id == "leave"):
		setState("reacter_won_leave", "reacter")
		#affectAffection("starter", "reacter", 0.05)


func reacter_won_leave_text():
	saynn("{reacter.name} decides to leave {starter.you} alone..")

	addAction("leave", "Leave", "Time to go..", "default", 1.0, 60, {})

func reacter_won_leave_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "leave"):
		stopMe()


func starter_won_text():
	if(!surrendered):
		saynn("{starter.name} won the fight! {reacter.name} hits the floor, unable to continue fighting..")
	else:
		saynn("{reacter.name} decides to surrender instantly..")

	addAction("punish", "Punish", "Have some fun!", "punish", 1.0, 60, {})
	addAction("leave", "Leave", "Just leave", "surrender", 0.2, 60, {})

func starter_won_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "punish"):
		startInteraction("PunishInteraction", {punisher=getRoleID("starter"), target=getRoleID("reacter")})
	if(_id == "leave"):
		setState("starter_won_leave", "starter")
		affectAffection("reacter", "starter", 0.05)


func starter_won_leave_text():
	saynn("{starter.name} decides to leave {reacter.you} alone..")

	addAction("leave", "Leave", "Time to go..", "default", 1.0, 60, {})

func starter_won_leave_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "leave"):
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

