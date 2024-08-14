extends PawnInteractionBase

var foundIllegalItems = false
var throwOutLoc = ""
var guardSurrender = false

func _init():
	id = "CaughtOffLimits"

func start(_pawns:Dictionary, _args:Dictionary):
	doInvolvePawn("guard", _pawns["guard"])
	doInvolvePawn("inmate", _pawns["inmate"])
	setState("", "inmate")

func shouldRunOnMeet(_pawn1, _pawn2, _pawn2Moved:bool):
	if(!_pawn1.canBeInterrupted() || !_pawn2.canBeInterrupted()):
		return [false]
		
	if(_pawn2.isGuard() && _pawn1.isInmate()):
		var pawnTemp = _pawn1
		_pawn1 = _pawn2
		_pawn2 = pawnTemp
	
	if(_pawn1.isGuard() && _pawn2.isInmate()):
		var pawnLoc = _pawn2.getLocation()
		var pawnRoom = GM.world.getRoomByID(pawnLoc)
		
		var isBadLoc = (pawnRoom.loctag_Greenhouses || pawnRoom.loctag_GuardsEncounter)
		
		if(isBadLoc):
			return [true, {guard=_pawn1.charID, inmate=_pawn2.charID}, {}]

	return [false]

func init_text():
	saynn("{guard.name} notices {inmate.name} in an off-limits area!")
	saynn("[say=guard]Hey, what are you doing in there?[/say]")

	addAction("fight", "Fight!", "Protect yourself!", "fight", [1.0,-1.0,0.5,0.0], 60, {})
	addAction("surrender", "Surrender", "Maybe they won't be mean", "surrender", [0.1,0.5,0.0,0.0], 60, {})

func init_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "fight"):
		setState("about_to_fight", "guard")
	if(_id == "surrender"):
		setState("surrendered", "guard")


func about_to_fight_text():
	saynn("{inmate.name} prepares for a fight.")
	saynn("[say=guard]Alright, you asked for this.[/say]")

	addAction("fight", "Fight", "Begin the fight", "fight", 1.0, 600, {start_fight=["inmate", "guard"],})
	addAction("surrender", "Surrender", "You changed your mind", "surrender", 1.0, 30, {})

func about_to_fight_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "fight"):
		var fightResult = getFightResult(_args)
		
		if(fightResult["won"]):
			setState("inmate_won", "inmate")
		else:
			setState("guard_won", "guard")
	if(_id == "surrender"):
		setState("inmate_won", "inmate")
		guardSurrender = true


func surrendered_text():
	saynn("{inmate.name} raises {inmate.his} hands and gives up.")
	saynn("[say=guard]Smart choice.[/say]")
	saynn("{guard.name} approaches {inmate.you}.")

	addAction("punish", "Punish", "They gotta serve a punishment!", "punishMean", 1.0, 60, {})
	addAction("frisk", "Frisk", "Go easy on them and just frisk them", "punish", 1.0, 30, {})

func surrendered_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "punish"):
		startInteraction("PunishInteraction", {punisher=getRoleID("guard"), target=getRoleID("inmate")})
	if(_id == "frisk"):
		setState("about_to_frisk", "guard")


func inmate_won_text():
	if(!guardSurrender):
		saynn("{guard.name} hits the floor. {inmate.name} won!")
	else:
		saynn("{guard.name} changes {guard.his} mind at the last second and decides to surrender!")

	addAction("leave", "Leave", "Just leave while you can", "default", 0.2, 30, {})
	addAction("sex", "Sex!", "Fuck them first", "sexDom", 1.0, 600, {start_sex=["inmate", "guard"],})
	addAction("sexSub", "Submit to", "Let them fuck you", "sexSub", 0.3, 600, {start_sex=["guard", "inmate"],})
	if(getRolePawn("inmate").isPlayer()):
		addAction("inv", "Inventory", "Open the inventory", "default", 0.0, 0, {})
	if(getRolePawn("inmate").isPlayer() && GM.pc.getInventory().hasRemovableRestraints()):
		addAction("struggle", "Struggle", "Try to remove some of your restraints", "default", 0.0, 0, {})

func inmate_won_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "leave"):
		setState("about_to_leave", "inmate")
	if(_id == "sex"):
		var _sexResult = getSexResult(_args)
		makeRoleExhausted("guard")
		stopMe()
	if(_id == "sexSub"):
		var _sexResult = getSexResult(_args)
		setState("after_sub_sex", "inmate")
	if(_id == "inv"):
		runScene("InventoryScene")
	if(_id == "struggle"):
		runScene("StrugglingScene")


func after_sub_sex_text():
	saynn("The sex has ended..")

	addAction("leave", "Leave", "Time to go..", "default", 1.0, 30, {})

func after_sub_sex_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "leave"):
		makeRoleExhausted("guard")
		stopMe()


func about_to_leave_text():
	saynn("{inmate.name} decides to just leave while {inmate.he} still can.")

	addAction("leave", "Continue", "See what happens next.", "default", 1.0, 30, {})

func about_to_leave_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "leave"):
		makeRoleExhausted("guard")
		stopMe()


func guard_won_text():
	saynn("{inmate.name} hits the floor. {guard.name} won!")

	addAction("punish", "Punish", "They gotta serve a punishment!", "punishMean", 1.0, 60, {})
	addAction("frisk", "Frisk", "Search them and let them go", "punish", 1.0, 30, {})

func guard_won_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "punish"):
		startInteraction("PunishInteraction", {punisher=getRoleID("guard"), target=getRoleID("inmate")})
	if(_id == "frisk"):
		setState("about_to_frisk", "guard")


func about_to_frisk_text():
	saynn("{guard.name} is about to frisk {inmate.name}.")
	saynn("[say=guard]Don't move now.[/say]")

	addAction("frisk", "Frisk", "Take away any contraband", "default", 1.0, 120, {})

func about_to_frisk_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "frisk"):
		var theChar = getRolePawn("inmate").getChar()
		foundIllegalItems = false
		
		if(theChar.isPlayer()):
			theChar.addCredits(-5)
			addMessage("5 credits were taken from you")
			if(theChar.hasIllegalItems()):
				foundIllegalItems = true
				theChar.getInventory().removeItemsList(theChar.getInventory().getItemsWithTag(ItemTag.Illegal))
				theChar.getInventory().removeEquippedItemsList(theChar.getInventory().getEquippedItemsWithTag(ItemTag.Illegal))
		else:
			foundIllegalItems = RNG.chance(50)
		setState("frisked", "guard")


func frisked_text():
	if(foundIllegalItems):
		saynn("{guard.name} takes away all contraband from {inmate.name} and also 5 credits on top!")
	else:
		saynn("{guard.name} doesn't find any contraband but takes away 5 credits anyway.")

	addAction("escort_out", "Escort out", "Time to make them go", "default", 1.0, 30, {})

func frisked_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "escort_out"):
		if(GM.world.isLocSafe(getLocation())):
			setState("escorted_out", "guard")
			return
		throwOutLoc = GM.world.getSafeLoc(getLocation())
		goTowards(throwOutLoc)
		setState("escorting_out", "guard")


func escorting_out_text():
	saynn("{guard.name} is escorting {inmate.name} out of the off-limits zone.")

	addAction("escort_out", "Escort out", "Go to the spot", "default", 1.0, 60, {})

func escorting_out_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "escort_out"):
		goTowards(throwOutLoc)
		if(getLocation() == throwOutLoc):
			setState("escorted_out", "guard")


func escorted_out_text():
	saynn("{guard.name} shoves {inmate.name} away.")
	saynn("[say=guard]Now go away.[/say]")

	addAction("leave", "Leave", "Time to go", "default", 1.0, 30, {})

func escorted_out_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "leave"):
		stopMe()


func getAnimData() -> Array:
	if(getCurrentAction() == "fight"):
		return [StageScene.Duo, "shove", {pc="inmate", npc="guard", npcAction="hurt"}]
	if(getState() == "escorted_out"):
		return [StageScene.Duo, "hurt", {pc="inmate", npc="guard", npcAction="shove"}]
	return [StageScene.Duo, "stand", {pc="inmate", npc="guard"}]

func saveData():
	var data = .saveData()

	data["foundIllegalItems"] = foundIllegalItems
	data["throwOutLoc"] = throwOutLoc
	data["guardSurrender"] = guardSurrender
	return data

func loadData(_data):
	.loadData(_data)

	foundIllegalItems = SAVE.loadVar(_data, "foundIllegalItems", false)
	throwOutLoc = SAVE.loadVar(_data, "throwOutLoc", "")
	guardSurrender = SAVE.loadVar(_data, "guardSurrender", false)

