extends PawnInteractionBase

var foundIllegalItems = false
var throwOutLoc:String = ""

func _init():
	id = "CaughtOffLimits"

func processTime(_howMuch:int):
	pass

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

func init_actions():
	return [
		{
			id = "fight",
			name = "Fight!",
			desc = "Protect yourself",
			score = 1.0,
			args = {},
			time = 600,
			start_fight = ["inmate", "guard"],
			#actionText = "Fight has started!",
		},
		{
			id = "giveup",
			name = "Surrender",
			desc = "Just surrender",
			score = 0.2,
			args = {},
			time = 30,
		},
		{
			id = "offerself",
			name = "Offer self",
			desc = "Try to offer your body",
			score = 0.2,
			args = {},
			time = 30,
		},
	]

func init_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "fight"):
		var fightResult = getFightResult(_args)
		
		if(fightResult["won"]):
			setState("inmate_won", "inmate")
		else:
			setState("guard_won", "guard")
	if(_id == "giveup"):
		setState("guard_won", "guard")
	if(_id == "offerself"):
		if(RNG.chance(150)): #50
			affectAffection("guard", "inmate", 0.05)
			setState("offerself_failed", "inmate")
		else:
			affectAffection("guard", "inmate", 0.07)
			setState("offerself_success", "inmate")

func offerself_failed_text():
	saynn("{inmate.name} tries to open {inmate.his} body!")
	
	saynn("[say=guard]No thanks.[/say]")

func offerself_failed_actions():
	return [
		{
			id = "fight",
			name = "Fight!",
			desc = "Protect yourself",
			score = 1.0,
			args = {},
			time = 600,
			start_fight = ["inmate", "guard"],
			#actionText = "Fight has started!",
		},
		{
			id = "giveup",
			name = "Surrender",
			desc = "Just surrender",
			score = 0.2,
			args = {},
			time = 30,
		},
	]

func offerself_failed_do(_id:String, _args:Dictionary, _context:Dictionary):
	init_do(_id, _args, _context)

func inmate_won_text():
	saynn("{inmate.name} won!")

func inmate_won_actions():
	return [
		{
			id = "leave",
			name = "Leave",
			desc = "Just leave",
			score = 1.0,
			args = {},
			time = 30,
		},
		{
			id = "sex",
			name = "Sex!",
			desc = "Do something",
			score = 1.0,
			args = {},
			time = 30,
			start_sex = ["inmate", "guard"],
		},
	]

func inmate_won_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "leave"):
		makeRoleExhausted("guard")
		stopMe()
	if(_id == "sex"):
		makeRoleExhausted("guard")
		stopMe()




func guard_won_text():
	saynn("{guard.name} won!")

func guard_won_actions():
	return [
		{
			id = "frisk",
			name = "Frisk and throw",
			desc = "Frisk them and throw them out",
			score = 1.0,
			args = {},
			time = 30,
		},
		{
			id = "punish",
			name = "Punish!",
			desc = "Punish the inmate",
			score = 1.0,
			args = {},
			time = 30,
		},
	]

func guard_won_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "punish"):
		startInteraction("PunishInteraction", {punisher=getRoleID("guard"), target=getRoleID("inmate")})
	if(_id == "frisk"):
		setState("about_to_frisk", "guard")

func about_to_frisk_text():
	saynn("{guard.name} is about to frisk {inmate.name}. Don't move!")

func about_to_frisk_actions():
	return [
		{
			id = "frisk",
			name = "Frisk",
			desc = "Remove any contraband",
			score = 1.0,
			args = {},
			time = 30,
		},
	]

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

func frisked_actions():
	return [
		{
			id = "throwout",
			name = "Throw out",
			desc = "Time to make them go",
			score = 1.0,
			args = {},
			time = 30,
		},
	]

func frisked_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "throwout"):
		if(GM.world.isLocSafe(getLocation())):
			setState("escorted_out", "guard")
			return
		throwOutLoc = GM.world.getSafeLoc(getLocation())
		goTowards(throwOutLoc)
		setState("escorting_out", "guard")

func escorting_out_text():
	saynn("{guard.name} is escorting {inmate.name} out of the off-limits zone.")

func escorting_out_actions():
	return [
		{
			id = "escort",
			name = "Move",
			desc = "Go to the spot",
			score = 1.0,
			args = {},
			time = 30,
		},
	]

func escorting_out_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "escort"):
		goTowards(throwOutLoc)
		if(getLocation() == throwOutLoc):
			setState("escorted_out", "guard")

func escorted_out_text():
	saynn("[say=guard]NO GO AWAY![/say]")

func escorted_out_actions():
	return [
		{
			id = "leave",
			name = "Leave",
			desc = "Time to go",
			score = 1.0,
			args = {},
			time = 30,
		},
	]

func escorted_out_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "leave"):
		stopMe()


func getAnimData() -> Array:
	if(getCurrentAction() == "fight"):
		return [StageScene.Duo, "shove", {pc="inmate", npc="guard", npcAction="hurt"}]
	return [StageScene.Duo, "stand", {pc="inmate", npc="guard"}]
