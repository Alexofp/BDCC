extends PawnInteractionBase

var surrendered = false
var askCredits = 0

func _init():
	id = "GenericAttack"

func start(_pawns:Dictionary, _args:Dictionary):
	doInvolvePawn("starter", _pawns["starter"])
	doInvolvePawn("reacter", _pawns["reacter"])
	if(_args.has("askCredits")):
		askCredits = _args["askCredits"]
	setState("", "reacter")

func init_text():
	saynn("{starter.You} {starter.youVerb('attack')} {reacter.you}!")
	sayLine("starter", "AttackStart", {main="starter", target="reacter"})
	sayLine("reacter", "AttackReact", {main="reacter", target="starter"})

	addAction("fight", "Fight", "Fight back", "fight", 1.0, 300, {start_fight=["starter", "reacter"],})
	addAction("surrender", "Surrender", "It's not worth it!", "surrender", 1.0, 60, {})

func init_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "fight"):
		surrendered = false
		var fightResult = getFightResult(_args)
		
		if(fightResult["won"]):
			setState("starter_won", "starter")
			onStarterWin()
		else:
			setState("reacter_won", "reacter")
	if(_id == "surrender"):
		surrendered = true
		setState("starter_won", "starter")
		onStarterWin(true)


func starter_won_text():
	if(!surrendered):
		saynn("{starter.name} won the fight! {reacter.name} hits the floor, unable to continue fighting..")
		if(RNG.chance(50)):
			sayLine("reacter", "FightLostGeneric", {loser="reacter", winner="starter"})
		else:
			sayLine("starter", "FightWonGeneric", {winner="starter", loser="reacter"})
	else:
		saynn("{reacter.name} decides to surrender instantly..")
		sayLine("reacter", "FightSurrender", {loser="reacter", winner="starter"})
	if(askCredits > 0):
		saynn("{starter.You} {starter.youVerb('fetch', 'fetches')} "+str(askCredits)+" credits from {reacter.you}..")

	addAction("punish", "Punish", "Have some fun!", "punish", 1.0, 60, {})
	addAction("leave", "Leave", "Just leave", "default", 0.1, 60, {})
	
	addDefeatButtonsOnlyEvent("starter", "reacter")

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
	if(!surrendered):
		saynn("{reacter.name} won the fight! {starter.name} hits the floor, unable to continue fighting..")
		if(RNG.chance(50)):
			sayLine("starter", "FightLostGeneric", {loser="starter", winner="reacter"})
		else:
			sayLine("reacter", "FightWonGeneric", {winner="reacter", loser="starter"})
	else:
		saynn("{starter.name} decides to surrender instantly..")
		sayLine("starter", "FightSurrender", {loser="starter", winner="reacter"})

	addAction("punish", "Punish", "Punish them for attacking you!", "punish", 1.0, 60, {})
	addAction("leave", "Leave", "Just leave", "surrender", 1.0, 60, {})
	
	addDefeatButtonsOnlyEvent("reacter", "starter")

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


func getAnimData() -> Array:
	if(getState() == "starter_won"):
		if(surrendered):
			return [StageScene.Duo, "stand", {pc="starter", npc="reacter", npcAction="kneel"}]
		else:
			return [StageScene.Duo, "stand", {pc="starter", npc="reacter", npcAction="defeat"}]
	if(getState() == "reacter_won"):
		if(surrendered):
			return [StageScene.Duo, "kneel", {pc="starter", npc="reacter"}]
		else:
			return [StageScene.Duo, "defeat", {pc="starter", npc="reacter"}]
	return [StageScene.Duo, "stand", {pc="starter", npc="reacter"}]

func onStarterWin(_isSurrender=false):
	if(askCredits > 0):
		if(getRolePawn("reacter").isPlayer()):
			GM.pc.addCredits(-askCredits)
			addMessage("You lost "+str(askCredits)+" credits!")
		if(getRolePawn("starter").isPlayer()):
			GM.pc.addCredits(askCredits)
			addMessage("You gained "+str(askCredits)+" credits!")

func getPreviewLineForRole(_role:String) -> String:
	if(_role == "starter"):
		return "{starter.name} is attacking {reacter.name}!"
	if(_role == "reacter"):
		return "{reacter.name} is being attacked by {starter.name}!"
	return .getPreviewLineForRole(_role)

func saveData():
	var data = .saveData()

	data["surrendered"] = surrendered
	data["askCredits"] = askCredits
	return data

func loadData(_data):
	.loadData(_data)

	surrendered = SAVE.loadVar(_data, "surrendered", false)
	askCredits = SAVE.loadVar(_data, "askCredits", 0)

