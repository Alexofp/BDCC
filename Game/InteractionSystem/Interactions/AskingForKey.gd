extends PawnInteractionBase

var domSatisfaction = 0.0

func _init():
	id = "AskingForKey"

func start(_pawns:Dictionary, _args:Dictionary):
	doInvolvePawn("starter", _pawns["starter"])
	doInvolvePawn("reacter", _pawns["reacter"])
	setState("", "reacter")

func init_text():
	saynn("{starter.name} sways uncomfortably.")
	sayLine("starter", "AskKeyCanYouUnlock", {main="starter", target="reacter"})

	addAction("give_key", "Give key", "Just give them the key..", "help", 0.5, 60, {})
	addAction("sex_challenge", "Sex challenge", "Give them they key.. but only if they become your sex toy and satisfy you", "sexDom", 3.0, 60, {})
	addAction("deny", "Deny", "Deny their request!", "fight", 1.0, 60, {})

func init_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "give_key"):
		setState("gave_key", "reacter")
		var _howMany = getRoleChar("starter").unlockAllKeyholderLocksFrom(getRoleID("reacter"))
		getRolePawn("reacter").satisfySocial()
		getRolePawn("starter").satisfySocial()
	if(_id == "sex_challenge"):
		setState("sex_challenge_start", "starter")
	if(_id == "deny"):
		setState("denied_request", "starter")
		affectAffection("starter", "reacter", -0.05)
		getRolePawn("reacter").satisfySocial()
		getRolePawn("starter").afterFailedSocialInteraction()


func denied_request_text():
	saynn("{reacter.name} thinks about it for a second.. and then shakes {reacter.his} head.")
	sayLine("reacter", "AskKeyDeny", {main="reacter", target="starter"})
	saynn("Looks like {starter.you} {starter.youAre}n't getting that key from {reacter.him}.. willingly.")

	addAction("leave", "Leave", "Oh well.. whatever..", "surrender", 1.0, 60, {})
	addAction("attack", "Attack", "You are getting that key one way or another!", "fight", 1.0, 60, {})

func denied_request_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "leave"):
		setState("denied_leave", "starter")
	if(_id == "attack"):
		affectAffection("reacter", "starter", -0.1)
		startInteraction("GenericAttack", {starter=getRoleID("starter"), reacter=getRoleID("reacter")})


func denied_leave_text():
	saynn("{starter.name} decides to just leave.. and stay locked..")

	addAction("continue", "Continue", "See what happens next..", "default", 1.0, 60, {})

func denied_leave_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "continue"):
		stopMe()


func gave_key_text():
	saynn("{reacter.name} thinks about it for a second..")
	sayLine("reacter", "AskKeyGive", {main="reacter", target="starter"})
	saynn("{reacter.YouHe} {reacter.youVerb('approach', 'aproaches')} {starter.you} and unlocks the smart-locked gear with {reacter.yourHis} unique key..")
	saynn("Freedom..")

	addAction("leave", "Leave", "Yay.", "default", 1.0, 60, {})

func gave_key_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "leave"):
		stopMe()


func sex_challenge_start_text():
	saynn("{reacter.name} thinks about it for a second..")
	sayLine("reacter", "AskKeyChallenge", {main="reacter", target="starter"})
	saynn("Looks like {starter.you} {starter.youAre}n't getting that key unless {starter.youHe} {starter.youVerb('let')} {reacter.you} fuck {starter.youHim}..")

	addAction("submit", "Submit", "Let it happen..", "sexSub", 1.0, 300, {start_sex=["reacter", "starter", SexType.DefaultSex, {bondageDisabled=true}],})
	addAction("refuse", "Refuse", "You'd rather not..", "default", 0.1, 60, {})

func sex_challenge_start_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "submit"):
		var _result = getSexResult(_args, true)
		domSatisfaction = _result["domSatisfaction"] if _result.has("domSatisfaction") else 0.0
		setState("sex_challenge_after_sex", "reacter")
	if(_id == "refuse"):
		setState("sex_challenge_refused", "starter")


func sex_challenge_after_sex_text():
	saynn("{reacter.name}'s satisfaction was.. "+str(Util.roundF(domSatisfaction*100.0, 1))+"%")

	addAction("unlock_them", "Unlock them", "They served you well.", "default", max(domSatisfaction, 0.01), 60, {})
	addAction("deny", "Deny", "That wasn't good enough.", "punishMean", 0.1 if domSatisfaction >= 0.89 else (1.0 - min(domSatisfaction, 0.6)), 60, {})

func sex_challenge_after_sex_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "unlock_them"):
		var _howMany = getRoleChar("starter").unlockAllKeyholderLocksFrom(getRoleID("reacter"))
		getRolePawn("reacter").satisfySocial()
		getRolePawn("starter").satisfySocial()
		setState("sex_challenge_unlock", "starter")
	if(_id == "deny"):
		affectAffection("starter", "reacter", -0.05)
		getRolePawn("reacter").satisfySocial()
		getRolePawn("starter").afterFailedSocialInteraction()
		setState("sex_challenge_denied", "starter")


func sex_challenge_unlock_text():
	saynn("{reacter.name} decides to unlock {starter.your} smart-locked restraints with {reacter.his} unique key..")
	sayLine("reacter", "AskKeyChallengeUnlock", {main="reacter", target="starter"})
	saynn("Freedom, yay.")

	addAction("continue", "Continue", "See what happens next..", "default", 1.0, 60, {})

func sex_challenge_unlock_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "continue"):
		stopMe()


func sex_challenge_denied_text():
	saynn("{reacter.name} shakes {reacter.his} head.")
	sayLine("reacter", "AskKeyChallengeFail", {main="reacter", target="starter"})
	saynn("Looks like {starter.you} {starter.youAre}n't getting unlocked..")

	addAction("leave", "Leave", "Oh well..", "default", 1.0, 60, {})
	addAction("attack", "Attack", "You are getting that key!", "fight", 1.0, 60, {})

func sex_challenge_denied_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "leave"):
		stopMe()
	if(_id == "attack"):
		affectAffection("reacter", "starter", -0.1)
		startInteraction("GenericAttack", {starter=getRoleID("starter"), reacter=getRoleID("reacter")})


func sex_challenge_refused_text():
	saynn("{starter.You} {starter.youVerb('shake')} {starter.yourHis} head.")
	sayLine("starter", "AskKeyChallengeRefuse", {main="starter", target="reacter"})
	saynn("{reacter.name} shrugs.")
	sayLine("reacter", "AskKeyChallengeRefuseStay", {main="reacter", target="starter"})

	addAction("leave", "Leave", "Oh well..", "default", 1.0, 60, {})
	addAction("attack", "Attack", "You're getting that key!", "fight", 1.0, 60, {})

func sex_challenge_refused_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "leave"):
		stopMe()
	if(_id == "attack"):
		affectAffection("reacter", "starter", -0.1)
		startInteraction("GenericAttack", {starter=getRoleID("starter"), reacter=getRoleID("reacter")})


func getAnimData() -> Array:
	return [StageScene.Duo, "stand", {pc="starter", npc="reacter"}]

func getPreviewLineForRole(_role:String) -> String:
	if(_role == "starter"):
		return "{starter.name} is asking for a key from {reacter.name}."
	if(_role == "reacter"):
		return "{reacter.name} is being asked by {starter.name}."
	return .getPreviewLineForRole(_role)

func saveData():
	var data = .saveData()

	data["domSatisfaction"] = domSatisfaction
	return data

func loadData(_data):
	.loadData(_data)

	domSatisfaction = SAVE.loadVar(_data, "domSatisfaction", 0.0)

