extends PawnInteractionBase

var jobTime = 0
var minTime = 0
var askCreds = 0
var askType = ""
var slutDom = false
var clientSatisfaction = 0.0
var lastClientID = ""
var clientApproached = false

func _init():
	id = "Prostitution"

func start(_pawns:Dictionary, _args:Dictionary):
	doInvolvePawn("main", _pawns["main"])
	setState("", "main")
	if(_args.has("minTime")):
		minTime = _args["minTime"]

func init_text():
	saynn("{main.You} {main.youAre} standing near a wall, {main.yourHis} leg pressed up against it..")

	addAction("search", "Find clients", "Actively seek out clients", "default", 0.5, 60, {})
	addAction("wait", "Just wait", "Just wait until someone decides to approache you", "default", 1.0, 180, {})
	addAction("stop", "Stop", "Enough whooring..", "default", (0.2 if (jobTime > (60*30)) else 0.01) if minTime <= 0 else (0.2 if (jobTime > minTime) else 0.0), 0, {})

func init_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "search"):
		var pawnIDs = findProstitutionTargetsNearby([lastClientID])
		if(!pawnIDs.empty()):
			var pawnID = RNG.pick(pawnIDs)
			lastClientID = pawnID
			doInvolvePawn("client", pawnID)
			clientApproached = false
			setState("found_client", "main")
			return
		setState("", "main")
	if(_id == "wait"):
		setState("", "main")
	if(_id == "stop"):
		stopMe()


func found_client_text():
	if(!clientApproached):
		saynn("{main.name} calls {client.you} to get closer..")
	else:
		saynn("{client.name} approaches {main.you}..")
	sayLine("main", "ProstitutionStart", {main="main", target="client"})
	sayLine("client", "ProstitutionOffer", {main="client", target="main"})

	addAction("usual", "Usual", "Let them fuck you any way they want for relatively cheap..", "sexSub", 1.0, 60, {})
	if(roleCanStartSex("main") && hasRepLevelPC("main", RepStat.Whore, 4)):
		addAction("service", "Service Dom", "You will be in charge. It takes more effort.. so you will be taking more credits", "sexDom", 1.0, 60, {})
	else:
		addDisabledAction("Service Dom", "You can't be a service dom with your restraints.." if !roleCanStartSex("main") else "Your whore reputation is not high enough for this..")
	if(hasRepLevelPC("main", RepStat.Whore, 8)):
		addAction("pricy_slut", "Pricy slut", "Ask for a lot of credits to let them fuck you.. You will have to really satisfy them though..", "resist", 1.0, 60, {})
	else:
		addDisabledAction("Pricy slut", "Your whore reputation is not high enough for this..")
	addAction("cancel", "Cancel", "You changed your mind, you don't wanna service them", "default", 0.0, 60, {})

func found_client_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "usual"):
		askType="usual"
		askCreds = getRolePawn("main").getProstitutionCreditsCost(getRolePawn("client"))
		slutDom = false
		setState("giving_offer", "client")
	if(_id == "service"):
		askType="service"
		askCreds = getRolePawn("main").getProstitutionCreditsCost(getRolePawn("client"), 2.0, true)
		slutDom = true
		setState("giving_offer", "client")
	if(_id == "pricy_slut"):
		askType="pricy"
		askCreds = getRolePawn("main").getProstitutionCreditsCost(getRolePawn("client"), 3.0)
		slutDom = false
		setState("giving_offer", "client")
	if(_id == "cancel"):
		setState("cancelled_service", "main")
		affectAffection("client", "main", -0.05)


func giving_offer_text():
	saynn("{main.name} winks.")
	if(askType=="usual"):
		sayLine("main", "ProstitutionUsual", {main="main", target="client"}, {credits=askCreds})
	elif(askType=="service"):
		sayLine("main", "ProstitutionServiceDom", {main="main", target="client"}, {credits=askCreds})
		saynn("Looks like {main.name} is offering to be a dom..")
	elif(askType=="pricy"):
		sayLine("main", "ProstitutionPricySlut", {main="main", target="client"}, {credits=askCreds})

	if(!getRolePawn("client").isPlayer() || GM.pc.getCredits() >= askCreds):
		addAction("agree", "Agree", "Give them the credits and do the thing", "agreeSexWithSlut", 1.0, 60, {})
	else:
		addDisabledAction("Agree", "You don't have enough credits..")
	addAction("deny", "Deny", "You'd rather not..", "default", 1.0, 60, {})
	if(false):
		addAction("haggle", "Haggle", "The slut clearly doesn't deserve that much.. Try to haggle", "default", 1.0, 60, {})

func giving_offer_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "agree"):
		if(getRolePawn("client").isPlayer()):
			GM.pc.addCredits(-askCreds)
		if(getRolePawn("main").isPlayer()):
			GM.pc.addCredits(askCreds)
		setState("offer_accepted", "main")
		sendSlaveryActivityEvent("main", "slutPaid", {credits=askCreds})
	if(_id == "deny"):
		setState("offer_denied", "main")
	if(_id == "haggle"):
		setState("meow", "inmate")


func offer_denied_text():
	sayLine("client", "ProstitutionDenied", {main="client", target="main"})
	sayLine("main", "ProstitutionDeniedWhatever", {main="main", target="client"})

	addAction("continue", "Continue", "See what happens next..", "default", 1.0, 60, {})

func offer_denied_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "continue"):
		getRolePawn("main").afterFailedSocialInteraction()
		getRolePawn("client").satisfySocial()
		doRemoveRole("client")
		setState("", "main")


func offer_accepted_text():
	saynn("{client.name} hands {main.you} the creds.")
	sayLine("client", "ProstitutionAccept", {main="client", target="main"})
	saynn("Time for the fun part..")

	addAction("sex", "Sex", "Prepare to do this..", "default", 1.0, 60, {})
	addAction("scam", "Scam", "Suddenly demand more creds", "punishMean", 0.5, 60, {})

func offer_accepted_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "sex"):
		setState("about_to_sex", "main")
	if(_id == "scam"):
		setState("slut_scam", "client")
		affectAffection("client", "main", -0.15)


func about_to_sex_text():
	saynn("The pair gets out of the way of others..")
	saynn("{main.name} pulls {client.you} closer for some sexy time..")

	addAction("continue", "Continue", "See what happens next..", "default", 1.0, 60, {start_sex=["main" if slutDom else "client", "client" if slutDom else "main", SexType.DefaultSex, {bondageDisabled=!slutDom}],})

func about_to_sex_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "continue"):
		var _result = getSexResult(_args, true)
		if(slutDom):
			clientSatisfaction = _result["subs"][getRoleID("client")]["satisfaction"]
		else:
			clientSatisfaction = _result["doms"][getRoleID("client")]["satisfaction"]
		setState("after_sex", "client")


func after_sex_text():
	saynn("The sex has ended..")
	saynn("Client's satisfaction is.. "+str(Util.roundF(clientSatisfaction*100.0, 1))+"%")

	addAction("leave", "Leave", "That was alright", "default", (clientSatisfaction if (askType!="pricy") else (clientSatisfaction/2.0)), 60, {})
	addAction("demand_creds_back", "Demand creds back", "That sucked, the slut should give you the credits back", "default", (0.05 if clientSatisfaction > 0.9 else (1.0 if clientSatisfaction <= 0.5 else 0.4)), 60, {})

func after_sex_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "leave"):
		addRepScore("main", RepStat.Whore, float(askCreds)/50.0)
		doRepEvent("main", "whoreany")
		if(askCreds >= 30):
			doRepEvent("main", "whorelot")
		setState("client_leaving", "client")
	if(_id == "demand_creds_back"):
		setState("client_demands_credits", "main")


func client_leaving_text():
	saynn("{client.name} is leaving, satisfied.")

	addAction("continue", "Continue", "See what happens next..", "default", 1.0, 60, {})

func client_leaving_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "continue"):
		doRemoveRole("client")
		setState("", "main")


func client_demands_credits_text():
	sayLine("client", "ProstitutionDemandCreds", {main="client", target="main"})
	saynn("The client is clearly angry..")

	addAction("return_creds", "Return creds", "You won't be missing them anyway", "surrender", 1.0, 60, {})
	addAction("refuse", "Refuse", "", "fight", 1.0, 60, {})

func client_demands_credits_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "return_creds"):
		if(getRolePawn("client").isPlayer()):
			GM.pc.addCredits(askCreds)
			addMessage("You got the credits back!")
		if(getRolePawn("main").isPlayer()):
			GM.pc.addCredits(-askCreds)
		setState("client_got_credits_back", "client")
		affectAffection("client", "main", 0.1)
		sendSlaveryActivityEvent("main", "slutReturnedCredits", {credits=askCreds})
	if(_id == "refuse"):
		setState("slut_refused_creds_back", "client")
		affectAffection("client", "main", -0.2)


func client_got_credits_back_text():
	saynn("{main.name} huffs but hands {client.you} the credits back.")
	saynn("The client nods and leaves.")

	addAction("continue", "Continue", "See what happens next..", "default", 1.0, 60, {})

func client_got_credits_back_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "continue"):
		doRemoveRole("client")
		setState("", "main")


func slut_refused_creds_back_text():
	sayLine("main", "ProstitutionRefuseReturnCreds", {main="main", target="client"})
	saynn("The situation is quickly getting heated..")

	addAction("whatever", "Whatever", "Let them keep the creds", "surrender", 1.0, 60, {})
	addAction("attack", "Attack", "Try to get them back forcefully..", "fight", 1.0, 60, {})

func slut_refused_creds_back_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "whatever"):
		setState("client_leaving_grumbly", "client")
	if(_id == "attack"):
		setState("client_attacked_slut", "main")


func client_leaving_grumbly_text():
	saynn("{client.name} grumbles.. but leaves eventually.")

	addAction("continue", "Continue", "See what happens next..", "default", 1.0, 60, {})

func client_leaving_grumbly_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "continue"):
		doRemoveRole("client")
		setState("", "main")


func client_attacked_slut_text():
	saynn("{client.name} decides to attack {main.you}!")
	sayLine("client", "AttackStart", {main="client", target="main"})

	addAction("fight", "Fight", "Time to fight back..", "default", 1.0, 600, {start_fight=["client", "main"],})

func client_attacked_slut_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "fight"):
		var fightResult = getFightResult(_args)
		
		if(fightResult["won"]):
			if(getRolePawn("client").isPlayer()):
				GM.pc.addCredits(askCreds)
				addMessage("You got the credits back!")
			if(getRolePawn("main").isPlayer()):
				GM.pc.addCredits(-askCreds)
		
			setState("client_won", "client")
			sendSlaveryActivityEvent("main", "slutReturnedCredits", {credits=askCreds})
		else:
			setState("slut_won", "main")


func client_won_text():
	saynn("{client.You} won! {main.Name} is on the floor, unable to continue fighting..")
	saynn("{client.You} {client.youVerb('take')} the credits back from the slut..")

	addAction("leave", "Leave", "Time to go..", "default", 0.2, 60, {})
	addAction("punish", "Punish", "Make them regret what they did.", "punishMean", 1.0, 60, {})

func client_won_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "leave"):
		setState("client_won_leave", "client")
	if(_id == "punish"):
		startInteraction("PunishInteraction", {punisher=getRoleID("client"), target=getRoleID("main")})


func client_won_leave_text():
	saynn("After taking the credits back, {client.name} just leaves..")

	addAction("continue", "Continue", "See what happens next..", "default", 1.0, 60, {})

func client_won_leave_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "continue"):
		stopMe()


func slut_won_text():
	saynn("{main.You} won! {client.Name} is on the floor, unable to continue fighting..")

	addAction("kick_them_away", "Kick them away", "Kick the trash away", "default", 0.4, 60, {})
	addAction("punish", "Punish", "Make them regret it", "punishMean", 1.0, 60, {})

func slut_won_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "kick_them_away"):
		setState("slut_won_kick", "main")
	if(_id == "punish"):
		startInteraction("PunishInteraction", {punisher=getRoleID("main"), target=getRoleID("client")})


func slut_won_kick_text():
	saynn("{main.name} decides to just kick {client.name} away from {main.his} working spot..")

	addAction("continue", "Continue", "See what happens next..", "default", 1.0, 60, {})

func slut_won_kick_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "continue"):
		var theLoc:String = getLocation()
		var _ok = doWanderGurantee()
		doRemoveRole("client")
		setLocation(theLoc)
		setState("", "main")


func slut_scam_text():
	sayLine("main", "ProstitutionScam", {main="main", target="client"})
	saynn("[say=client]Are you serious?[/say]")
	saynn("[say=main]Pay up or leave.[/say]")
	saynn("Looks like {main.your} services have just gotten more expensive..")

	if(!getRolePawn("client").isPlayer() || GM.pc.getCredits() >= 5):
		addAction("pay", "Pay", "Add 5 more credits on top", "surrender", 1.0, 60, {})
	addAction("leave", "Leave", "Whatever..", "surrender", 1.0, 60, {})
	addAction("demand_creds_back", "Demand creds back", "That's enough. You just want your credits back now.", "fight", 1.0, 60, {})

func slut_scam_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "pay"):
		askCreds += 5
		if(getRolePawn("client").isPlayer()):
			GM.pc.addCredits(-5)
		if(getRolePawn("main").isPlayer()):
			GM.pc.addCredits(5)
		setState("offer_accepted", "main")
		
		sendSlaveryActivityEvent("main", "slutPaid", {credits=5})
	if(_id == "leave"):
		setState("client_leaving_grumbly", "client")
	if(_id == "demand_creds_back"):
		setState("client_demands_credits", "main")


func cancelled_service_text():
	saynn("{main.You} {main.youVerb('decide')} to change {main.yourHis} mind at the last second.")
	saynn("[say=main]Sorry, I changed my mind.[/say]")
	saynn("[say=client]Alright, whatever.[/say]")

	addAction("continue", "Continue", "See what happens next..", "default", 1.0, 60, {})

func cancelled_service_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "continue"):
		getRolePawn("client").afterFailedSocialInteraction()
		doRemoveRole("client")
		setState("", "main")


func getInterruptActions(_pawn:CharacterPawn) -> Array:
	var result:Array = []
	if(getPawnCount() == 1):
		result.append({
			id = "approach",
			name = "Approach",
			desc = "See what they are offering..",
			score = 0.5,
			scoreType = "sexUse",
			scoreRole = "main",
			args = {},
		})
	return result

func doInterruptAction(_pawn:CharacterPawn, _id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "approach"):
		doInvolvePawn("client", _pawn.charID)
		clientApproached = true
		setState("found_client", "main")


func getAnimData() -> Array:
	if(getPawnCount() > 1):
		return [StageScene.Duo, "stand", {pc="main", npc="client"}]
	return [StageScene.Solo, "stand", {pc="main"}]

func isSlutDom():
	return slutDom

func processTime(_howMuch:int):
	jobTime += _howMuch
	
func getActivityIconForRole(_role:String):
	if(getPawnCount() == 1):
		return RoomStuff.PawnActivity.Prostitution
	else:
		return .getActivityIconForRole(_role)

func getPreviewLineForRole(_role:String) -> String:
	if(_role == "main"):
		return "{main.name} is whoring {main.himself} out.."
	if(_role == "client"):
		return "{client.name} is being {main.name}'s client."
	return .getPreviewLineForRole(_role)

func saveData():
	var data = .saveData()

	data["jobTime"] = jobTime
	data["minTime"] = minTime
	data["askCreds"] = askCreds
	data["askType"] = askType
	data["slutDom"] = slutDom
	data["clientSatisfaction"] = clientSatisfaction
	data["lastClientID"] = lastClientID
	data["clientApproached"] = clientApproached
	return data

func loadData(_data):
	.loadData(_data)

	jobTime = SAVE.loadVar(_data, "jobTime", 0)
	minTime = SAVE.loadVar(_data, "minTime", 0)
	askCreds = SAVE.loadVar(_data, "askCreds", 0)
	askType = SAVE.loadVar(_data, "askType", "")
	slutDom = SAVE.loadVar(_data, "slutDom", false)
	clientSatisfaction = SAVE.loadVar(_data, "clientSatisfaction", 0.0)
	lastClientID = SAVE.loadVar(_data, "lastClientID", "")
	clientApproached = SAVE.loadVar(_data, "clientApproached", false)

