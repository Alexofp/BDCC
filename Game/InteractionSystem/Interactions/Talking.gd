extends PawnInteractionBase

var chat = {}
var lust = {}
var chatAnswer = ""
var surrendered = false
var notFirst = false

func _init():
	id = "Talking"

func start(_pawns:Dictionary, _args:Dictionary):
	doInvolvePawn("starter", _pawns["starter"])
	doInvolvePawn("reacter", _pawns["reacter"])
	setState("", "starter")

func init_text():
	if(!notFirst):
		saynn("{starter.name} approaches {reacter.you}.")
		notFirst=true
	else:
		saynn("{starter.name} is standing near {reacter.you}.")
	saynn("{reacter.Your} affection with {starter.you} is "+getAffectionString("starter", "reacter")+".\nLust is "+getLustString("starter", "reacter")+".")

	if(!getRoleChar("starter").isGagged() && getRolePawn("reacter").canSocial()):
		addAction("chat", "Chat", "Chat about stuff", "talk", 1.0, 30, {})
	else:
		addDisabledAction("Chat", ""+("Can't chat if you can't talk.." if getRolePawn("reacter").canSocial() else "They don't seem to be in a chatty mood..")+"")
	if(getRolePawn("reacter").canSocial()):
		addAction("flirt", "Flirt", "Try to flirt with them", "flirt", 1.0, 30, {})
	else:
		addDisabledAction("Flirt", "They don't seem to be in a flirty mood..")
	if(getRolePawn("reacter").canGrabAndFuck() && roleCanStartSex("starter")):
		addAction("grab_and_fuck", "Grab&Fuck", "They have so many restraints that you can just fuck them..", "sexUse", 5.0, 60, {})
	addAction("attack", "Attack", "Make them regret it!", "attack", 1.0, 30, {})
	if(roleCanStartSex("starter")):
		addAction("offersex", "Offer sex", "Offer to fuck them", "sexDom", 0.2, 60, {})
	else:
		addDisabledAction("Offer sex", "You can't start sex like this..")
	addAction("offerself", "Offer self", "Offer them to fuck you", "sexSub", 0.2, 60, {})
	addAction("leave", "Leave", "Enough chatting around.", "justleave", 1.0, 30, {})
	if(getRolePawn("starter").canEnslaveForFree(getRolePawn("reacter"))):
		addAction("enslave_free", "Enslave!", "They are subby enough.. and you are Alpha enough too..", "default", 0.0, 60, {})

	triggerTalkRunEvents("reacter")

func init_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "chat"):
		setState("chat_started", "starter")
	if(_id == "flirt"):
		setState("about_to_flirt", "starter")
	if(_id == "grab_and_fuck"):
		setState("grabbed_about_to_fuck", "reacter")
	if(_id == "attack"):
		setState("about_to_fight", "reacter")
		if(!getRolePawn("reacter").isPlayer()):
			affectAffection("reacter", "starter", -0.25)
	if(_id == "offersex"):
		setState("offered_sex", "reacter")
	if(_id == "offerself"):
		setState("offered_self", "reacter")
	if(_id == "leave"):
		setState("about_to_leave", "starter")
	if(_id == "enslave_free"):
		setState("about_to_kidnap", "starter")


func about_to_leave_text():
	saynn("{starter.name} is leaving..")

	addAction("leave", "Continue", "See what happens next..", "default", 1.0, 30, {})

func about_to_leave_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "leave"):
		stopMe()


func chat_started_text():
	saynn("Talkie talk talk.")
	saynn("[say=reacter]SURE WHAT DO YOU WANT TO CHAT ABOUT?[/say]")
	addChatTopics("starter", "reacter", "ask")
	if(getRoleChar("starter").isPlayer()):
		showKnownLikesDislikesFor("reacter")

	addAction("cancel", "Cancel", "Never mind", "default", 1.0, 60, {})
	if(false):
		addAction("ask", "Ask", "", "default", 1.0, 60, {})

func chat_started_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "cancel"):
		setState("chat_cancelled", "reacter")
		affectAffection("reacter", "starter", -0.02)
	if(_id == "ask"):
		chat = _args["chat"]
		setState("chat_asked", "reacter")


func chat_cancelled_text():
	saynn("[say=starter]NEVER MIND I DON'T WANNA CHAT[/say]")

	addAction("continue", "Continue", "See what happens next..", "default", 1.0, 60, {})
	addAction("leave", "Leave", "Why chat then?!", "fight", 0.5, 30, {})

func chat_cancelled_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "continue"):
		setState("", "starter")
	if(_id == "leave"):
		setState("chat_leaving", "starter")
		affectAffection("starter", "reacter", -0.02)


func chat_leaving_text():
	saynn("[say=reacter]WHATEVER, I'M LEAVING[/say]")

	addAction("continue", "Continue", "See what happens next..", "default", 1.0, 60, {})

func chat_leaving_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "continue"):
		stopMe()


func chat_asked_text():
	saynn("[say=starter]"+chat["topicFull"]+". What do you think?[/say]")
	addReactToChatButtons(chat, "react")

	if(false):
		addAction("react", "React", "", "default", 1.0, 60, {})

func chat_asked_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "react"):
		doReactToChat(_args, isBeingSpied())
		chatAnswer = _args["answer"]
		setState("chat_reacted", "starter")


func chat_reacted_text():
	if(chatAnswer=="agree"):
		saynn("[say=reacter]I AGREE.[/say]")
	elif(chatAnswer=="disagree"):
		saynn("[say=reacter]I DISAGREE. FUCK YOU.[/say]")
	else:
		saynn("[say=reacter]WHATEVER.[/say]")

	addAction("continue", "Continue", "See what happens next..", "default", 1.0, 60, {})

func chat_reacted_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "continue"):
		setState("", "starter")


func about_to_flirt_text():
	saynn("{starter.name} seems to be in a flirty mood..")
	if(getRoleChar("starter").isPlayer()):
		showKnownLikesDislikesFor("reacter")

	if(!getRoleChar("starter").isGagged()):
		addAction("pickup_line", "Pickup line", "Doesn't depend on your looks.. completely random", "default", 1.0, 60, {})
	else:
		addDisabledAction("Pickup line", "Can't talk if you're gagged..")
	if(false):
		addAction("flirt_do", "flirt_do", "", "default", 1.0, 60, {})

	addLustFocusButtons("flirt_do", "starter", "reacter")

func about_to_flirt_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "pickup_line"):
		setState("flirt_pickupline", "reacter")
	if(_id == "flirt_do"):
		lust = _args["lust"]
		setState("flirt_flirted", "reacter")


func flirt_pickupline_text():
	saynn("[say=starter]If you were a triangle you'd be acute one.[/say]")

	addAction("accept", "Accept it", "Wasn't too bad of a line..", "acceptFlirt", 1.0, 60, {})
	addAction("deny", "Deny", "That was so bad..", "default", 1.0, 60, {})

func flirt_pickupline_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "accept"):
		affectLust("reacter", "starter", 0.1)
		setState("flirt_accepted", "starter")
	if(_id == "deny"):
		affectLust("reacter", "starter", -0.07)
		setState("flirt_denied", "starter")


func flirt_accepted_text():
	saynn("{reacter.name} smiles.")

	addAction("continue", "Continue", "See what happens next", "default", 1.0, 60, {})

func flirt_accepted_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "continue"):
		setState("", "starter")
		getRolePawn("reacter").afterSocialInteraction()
		getRolePawn("starter").afterSocialInteraction()


func flirt_denied_text():
	saynn("[say=reacter]THAT WAS SO BAD![/say]")
	saynn("Oh well, was worth a try..")

	addAction("continue", "Continue", "See what happens next", "default", 1.0, 60, {})

func flirt_denied_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "continue"):
		setState("", "starter")
		getRolePawn("reacter").afterSocialInteraction()
		getRolePawn("starter").afterFailedSocialInteraction()


func flirt_flirted_text():
	var focus = lust["focus"]
	if(focus == LustFocus.Body):
		saynn("{starter.You} {starter.youVerb('sway')} {starter.yourHis} {starter.thick} {starter.masc} body sensually..")
	elif(focus == LustFocus.Butt):
		saynn("{starter.You} {starter.youVerb('turn')} around and {starter.youVerb('wiggle')} {starter.yourHis} {starter.thick} {starter.anusStretch} butt sensually..")
	elif(focus == LustFocus.Breasts):
			saynn("{starter.You} {starter.youVerb('jiggle')} and {starter.youVerb('grope')} {starter.yourHis} {starter.breasts}..")
	elif(focus == LustFocus.Crotch):
		var hasPenis = getRoleChar("starter").hasPenis()
		var hasVag = getRoleChar("starter").hasVagina()
		if(hasPenis && hasVag):
			saynn("{starter.You} proudly {starter.youVerb('present')} {starter.yourHis} {starter.penis} and {starter.pussyStretch} {pussy}..")
		elif(hasPenis):
			saynn("{starter.You} proudly {starter.youVerb('present')} {starter.yourHis} {starter.penis}..")
		elif(hasVag):
			saynn("{starter.You} proudly {starter.youVerb('present')} {starter.yourHis} {starter.pussyStretch} {pussy}..")
		else:
			saynn("{starter.You} proudly {starter.youVerb('present')} {starter.yourHis} crotch..")
	addReactToLustFocusButtons("flirt_react", lust)

	if(false):
		addAction("flirt_react", "flirt_react", "", "default", 1.0, 60, {})

func flirt_flirted_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "flirt_react"):
		reactToLustFocus(_args)
		setState("flirt_reacted", "starter")


func flirt_reacted_text():
	var answer = lust["answer"] if lust.has("answer") else "accept"
	var likeness = lust["likeness"] if lust.has("likeness") else 1.0
	if(answer == "accept"):
		saynn("[say=reacter]CUTE.[/say]")
	else:
		saynn("[say=reacter]FUCK OFF.[/say]")
	if(getRolePawn("starter").isPlayer()):
		saynn("You get a feeling that your flirt was "+str(Util.roundF(likeness*100.0, 1))+"% successful.."+lust["reason"]+"")

	addAction("continue", "Continue", "See what happens next..", "default", 1.0, 60, {})

func flirt_reacted_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "continue"):
		setState("", "starter")


func about_to_fight_text():
	saynn("{starter.You} {starter.youVerb('attack')} {reacter.you}!")
	saynn("[say=starter]I WILL FUCK YOU UP![/say]")

	addAction("fight", "Fight", "Fight back", "fight", 1.0, 300, {start_fight=["starter", "reacter"],})
	addAction("surrender", "Surrender", "It's not worth it!", "surrender", 1.0, 60, {})

func about_to_fight_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "fight"):
		surrendered = false
		var fightResult = getFightResult(_args)
		
		if(fightResult["won"]):
			setState("starter_won", "starter")
		else:
			setState("reacter_won", "reacter")
	if(_id == "surrender"):
		surrendered = true
		setState("starter_won", "starter")


func starter_won_text():
	if(!surrendered):
		saynn("{starter.name} won the fight! {reacter.name} hits the floor, unable to continue fighting..")
	else:
		saynn("{reacter.name} decides to surrender instantly..")

	addAction("punish", "Punish", "Have some fun!", "default", 1.0, 60, {})
	addAction("leave", "Leave", "Just leave", "justleave", 1.0, 60, {})

func starter_won_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "punish"):
		startInteraction("PunishInteraction", {punisher=getRoleID("starter"), target=getRoleID("reacter")})
	if(_id == "leave"):
		setState("starter_won_leave", "starter")


func starter_won_leave_text():
	saynn("{starter.name} decides to leave {reacter.you} alone..")

	addAction("leave", "Leave", "Time to go..", "default", 1.0, 60, {})

func starter_won_leave_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "leave"):
		stopMe()


func reacter_won_text():
	saynn("{reacter.name} won the fight! {starter.name} hits the floor, unable to continue fighting..")

	addAction("punish", "Punish", "Punish them for attacking you!", "punish", 1.0, 60, {})
	addAction("leave", "Leave", "Just leave", "surrender", 1.0, 60, {})

func reacter_won_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "punish"):
		startInteraction("PunishInteraction", {punisher=getRoleID("reacter"), target=getRoleID("starter")})
	if(_id == "leave"):
		setState("reacter_won_leave", "reacter")
		affectAffection("starter", "reacter", 0.15)


func reacter_won_leave_text():
	saynn("{reacter.name} decides to leave {starter.you} alone..")

	addAction("leave", "Leave", "Time to go..", "default", 1.0, 60, {})

func reacter_won_leave_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "leave"):
		stopMe()


func offered_sex_text():
	saynn("{starter.name} offers to fuck {reacter.you}..")
	saynn("[say=starter]HEY, LETS FUCK![/say]")

	addAction("agree", "Agree", "Let them fuck you!", "agreeSexAsSub", 1.0, 60, {})
	addAction("deny", "Deny", "You'd rather not..", "default", 0.2, 60, {})

func offered_sex_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "agree"):
		setState("offered_sex_agreed", "starter")
	if(_id == "deny"):
		setState("offered_sex_deny", "starter")
		affectAffection("starter", "reacter", -0.1)
		getRolePawn("reacter").afterSocialInteraction()
		getRolePawn("starter").afterFailedSocialInteraction()


func offered_sex_agreed_text():
	saynn("[say=reacter]SURE, YOU CAN FUCK ME.[/say]")

	addAction("sex", "Sex", "Time to fuck!", "default", 1.0, 600, {start_sex=["starter", "reacter"],})

func offered_sex_agreed_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "sex"):
		var _result = getSexResult(_args, true)
		setState("after_sex", "starter")


func offered_sex_deny_text():
	saynn("[say=reacter]I'D RATHER NOT.[/say]")

	addAction("continue", "Continue", "Oh well..", "default", 1.0, 60, {})

func offered_sex_deny_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "continue"):
		setState("", "starter")


func offered_self_text():
	saynn("{starter.name} offers {reacter.you} to fuck {starter.him}.")
	saynn("[say=starter]WANNA FUCK ME MAYBE?[/say]")

	addAction("agree", "Agree", "Agree to fuck them", "agreeSexAsDom", 1.0, 60, {})
	addAction("deny", "Deny", "You'd rather not..", "default", 0.2, 60, {})

func offered_self_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "agree"):
		setState("offered_self_agreed", "starter")
	if(_id == "deny"):
		setState("offered_self_deny", "starter")
		affectAffection("starter", "reacter", -0.1)
		getRolePawn("reacter").afterSocialInteraction()
		getRolePawn("starter").afterFailedSocialInteraction()


func offered_self_agreed_text():
	saynn("[say=reacter]SURE, I CAN FUCK YOU.[/say]")

	addAction("sex", "Sex", "Time to fuck!", "default", 1.0, 600, {start_sex=["reacter", "starter"],})

func offered_self_agreed_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "sex"):
		var _result = getSexResult(_args, true)
		setState("after_sex", "starter")


func offered_self_deny_text():
	saynn("[say=reacter]I'D RATHER NOT.[/say]")

	addAction("continue", "Continue", "Oh well..", "default", 1.0, 60, {})

func offered_self_deny_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "continue"):
		setState("", "starter")


func after_sex_text():
	saynn("After that sex, it was time to go your separate ways..")

	addAction("continue", "Continue", "", "default", 1.0, 60, {})

func after_sex_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "continue"):
		stopMe()


func grabbed_about_to_fuck_text():
	saynn("{starter.You} {starter.youVerb('grab')} {reacter.you}..")
	saynn("{reacter.You} quickly {reacter.youVerb('realize')} that {reacter.yourHis} restraints prevent {reacter.youHim} from escaping..")

	addAction("sex", "Sex", "You're so fucked..", "default", 1.0, 600, {start_sex=["starter", "reacter"],})

func grabbed_about_to_fuck_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "sex"):
		var _result = getSexResult(_args, true)
		setState("after_grab_and_fuck", "reacter")


func after_grab_and_fuck_text():
	saynn("{starter.name} leaves after messing with {reacter.you}..")

	addAction("continue", "Continue", "See what happens next..", "default", 1.0, 60, {})

func after_grab_and_fuck_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "continue"):
		stopMe()


func about_to_kidnap_text():
	saynn("{starter.You} {starter.youVerb('grab')} {reacter.yourHis} throat and {starter.youVerb('look')} {reacter.youHim} deep into the eyes..")
	saynn("{starter.YourHis} dominant aura alone is making {reacter.youHim} shiver..")
	saynn("[say=starter]YOU ARE MINE NOW. UNDERSTAND?[/say]")
	saynn("[say=reacter]O.. O-OKAY..[/say]")

	addAction("continue", "Continue", "See what happens next..", "default", 1.0, 60, {})

func about_to_kidnap_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "continue"):
		stopMe()
		runScene("KidnapDynamicNpcScene", [getRoleID("reacter")])


func shouldShowBigButtons() -> bool:
	if((getState() in ["chat_started"]) && isPlayersTurn()):
		return true
	return false

func getAnimData() -> Array:
	if(getState() in ["about_to_kidnap"]):
		return [StageScene.Choking, "idle", {pc="starter", npc="reacter"}]
	return [StageScene.Duo, "stand", {pc="starter", npc="reacter"}]

func getActivityIconForRole(_role:String):
	return RoomStuff.PawnActivity.Chat

func getPreviewLineForRole(_role:String) -> String:
	if(_role == "starter"):
		return "{starter.name} is chatting with {reacter.name}."
	if(_role == "reacter"):
		return "{reacter.name} is chatting with {starter.name}."
	return .getPreviewLineForRole(_role)

func saveData():
	var data = .saveData()

	data["chat"] = chat
	data["lust"] = lust
	data["chatAnswer"] = chatAnswer
	data["surrendered"] = surrendered
	data["notFirst"] = notFirst
	return data

func loadData(_data):
	.loadData(_data)

	chat = SAVE.loadVar(_data, "chat", {})
	lust = SAVE.loadVar(_data, "lust", {})
	chatAnswer = SAVE.loadVar(_data, "chatAnswer", "")
	surrendered = SAVE.loadVar(_data, "surrendered", false)
	notFirst = SAVE.loadVar(_data, "notFirst", false)

