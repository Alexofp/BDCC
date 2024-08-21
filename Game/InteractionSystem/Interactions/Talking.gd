extends PawnInteractionBase

var chat = {}
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

	if(!getRoleChar("starter").isGagged()):
		addAction("chat", "Chat", "Chat about stuff", "default", 1.0, 30, {})
	else:
		addDisabledAction("Chat", "Can't chat if you can't talk..")
	addAction("leave", "Leave", "Enough chatting around.", "justleave", 1.0, 30, {})

func init_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "chat"):
		setState("chat_started", "starter")
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


func shouldShowBigButtons() -> bool:
	if(getState() in ["chat_started"]):
		return true
	return false

func getAnimData() -> Array:
	return [StageScene.Duo, "stand", {pc="starter", npc="reacter"}]

func saveData():
	var data = .saveData()

	data["chat"] = chat
	data["chatAnswer"] = chatAnswer
	return data

func loadData(_data):
	.loadData(_data)

	chat = SAVE.loadVar(_data, "chat", {})
	chatAnswer = SAVE.loadVar(_data, "chatAnswer", "")

