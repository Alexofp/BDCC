extends PawnInteractionBase

var chat = {}
var lust = {}
var chatAnswer = ""

func _init():
	id = "Talking"

func start(_pawns:Dictionary, _args:Dictionary):
	doInvolvePawn("starter", _pawns["starter"])
	doInvolvePawn("reacter", _pawns["reacter"])
	setState("", "starter")

func init_text():
	saynn("{starter.name} approaches {reacter.you}.")
	saynn("{reacter.Your} affection with {starter.you} is "+getAffectionString("starter", "reacter")+".\nLust is "+getLustString("starter", "reacter")+".")

	if(!getRoleChar("starter").isGagged() && getRolePawn("reacter").canSocial()):
		addAction("chat", "Chat", "Chat about stuff", "talk", 1.0, 30, {})
	else:
		addDisabledAction("Chat", ""+("Can't chat if you can't talk.." if getRolePawn("reacter").canSocial() else "They don't seem to be in a chatty mood..")+"")
	if(getRolePawn("reacter").canSocial()):
		addAction("flirt", "Flirt", "Try to flirt with them", "flirt", 1.0, 30, {})
	else:
		addDisabledAction("Flirt", "They don't seem to be in a flirty mood..")
	addAction("leave", "Leave", "Enough chatting around.", "justleave", 1.0, 30, {})

func init_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "chat"):
		setState("chat_started", "starter")
	if(_id == "flirt"):
		setState("about_to_flirt", "starter")
	if(_id == "leave"):
		setState("about_to_leave", "starter")


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


func flirt_denied_text():
	saynn("[say=reacter]THAT WAS SO BAD![/say]")
	saynn("Oh well, was worth a try..")

	addAction("continue", "Continue", "See what happens next", "default", 1.0, 60, {})

func flirt_denied_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "continue"):
		setState("", "starter")


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
	var answer = lust["answer"]
	var likeness = lust["likeness"]
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


func shouldShowBigButtons() -> bool:
	if((getState() in ["chat_started"]) && isPlayersTurn()):
		return true
	return false

func getAnimData() -> Array:
	return [StageScene.Duo, "stand", {pc="starter", npc="reacter"}]

func getActivityIconForRole(_role:String):
	return RoomStuff.PawnActivity.Chat

func saveData():
	var data = .saveData()

	data["chat"] = chat
	data["lust"] = lust
	data["chatAnswer"] = chatAnswer
	return data

func loadData(_data):
	.loadData(_data)

	chat = SAVE.loadVar(_data, "chat", {})
	lust = SAVE.loadVar(_data, "lust", {})
	chatAnswer = SAVE.loadVar(_data, "chatAnswer", "")

