extends PawnInteractionBase

# if we don't have extra1 or extra2, we go to random spots on the map and ask other pawns to join
# after we have extra1 and extra2, we start spying on the player
# after some time, we start the ambush

const ROLE_MAIN = "main"
const ROLE_EXTRA1 = "extra1"
const ROLE_EXTRA2 = "extra2"
const ROLE_OFFER = "offer"

var hasExtra1:bool = false
var hasExtra2:bool = false
var targetLoc:String = ""
var preparation:float = 0.0
var goingAfter:bool = false

func shouldLookForExtras() -> bool:
	if(hasExtra1 && hasExtra2):
		return false
	return true

func findExtraPawn() -> CharacterPawn:
	var pawn = getRolePawn(ROLE_MAIN)
	var allPawnIDs = GM.main.IS.getPawnIDsNear(getLocation(), 1, 1)
	allPawnIDs.shuffle()
	for otherPawnID in allPawnIDs:
		var otherPawn = getPawn(otherPawnID)
		if(otherPawn == pawn):
			continue
		if(otherPawn.isPlayer()):
			continue

		if(!otherPawn.canInterrupt()):
			continue
		
		return otherPawn
		#if(otherPawn.tryInterruptPawns([pawn], keepScoreMult)):
		#	return true
	return null

func inviteExtra(_otherPawn:CharacterPawn) -> bool:
	if(!_otherPawn):
		return false
	if(!hasExtra1):
		hasExtra1 = true
		doInvolvePawn(ROLE_EXTRA1, _otherPawn)
		return true
	if(!hasExtra2):
		hasExtra2 = true
		doInvolvePawn(ROLE_EXTRA2, _otherPawn)
		return true
	return false

func tryAutoInvitePawn():
	if(shouldLookForExtras()):
		var thePawn := findExtraPawn()
		if(thePawn):
			inviteExtra(thePawn)

func calcWillJoin(_mainPawn:CharacterPawn, _newPawn:CharacterPawn) -> bool:
	var pcPawn := GM.main.IS.getPawn("pc")
	if(!pcPawn):
		return false
	var pcAffection:float = _newPawn.getAffection("pc")
	
	var joinScore:float = getScoreTypeValueGeneric("fight", _newPawn, pcPawn)
	var joinChance:float = joinScore*100.0 * clamp(1.0 - pcAffection*2.0, 0.0, 2.0)
	
	return RNG.chance(joinChance)

func canAmbush() -> bool:
	if(state == "" && hasExtra1 && hasExtra2):# && GM.world.simpleRingDistance(getLocation(), GM.pc.getLocation()) <= 5):
		return true
	return false

func _init():
	id = "NemesisAmbush"

func start(_pawns:Dictionary, _args:Dictionary):
	doInvolvePawn("main", _pawns["main"])
	setState("", "main")

func init_text():
	saynn("{main.You} {main.youAre} heading somewhere..")
	
	addAction("go", "Go!", "Time to go", "default", 1.0, 30, {})

func shouldJustWander() -> bool:
	if(shouldLookForExtras()):
		return true
	var pcPawn := GM.main.IS.getPawn("pc")
	if(!pcPawn || !pcPawn.canBeInterrupted()):
		return true
	return false

func init_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "go"):
		if(GM.main.isVeryLate() || getRolePawn(ROLE_MAIN).tiredness >= 1.0):
			stopMe()
			return
		
		if(shouldJustWander()):
			if(targetLoc == ""):
				targetLoc = RNG.pick(GM.world.getZoneRooms("poi", [
					"cellblock_nearcells",
					"main_punishment_spot",
					"main_laundry",
					"main_bathroom1",
					"main_bathroom2",
					"yard_deadend2",
					"gym_entrance",
					"fight_neararena",
					"fight_slutwall",
					"med_lobby_start",
					"mining_nearentrance",
				]))
			if(goTowards(targetLoc)):
				targetLoc = ""
			#stopMe()
			#tryAutoInvitePawn()
			if(shouldLookForExtras()):
				var thePawn := findExtraPawn()
				if(thePawn):
					doInvolvePawn(ROLE_OFFER, thePawn)
					setState("offer", ROLE_OFFER, ROLE_MAIN)
		else:
			var leaveTarget:String = GM.pc.getLocation()
	#		if(GM.main.IS.hasPawn("pc") && GM.main.IS.getPawn("pc").canBeInterrupted()):
	#			if(getLocation() == leaveTarget):
	#				completeGoal()
	#				GM.main.runScene("SlutProstitutionReceiveCredits", [getPawn().charID])
			var room = GM.world.getRoomByID(leaveTarget)
			if(room != null && !room.isOfflimitsForInmates()):
				var theDist := GM.world.simpleRingDistance(getLocation(), GM.pc.getLocation())
				if(theDist <= 2.0):
					preparation += RNG.randf_range(0.0, 0.1)
					if(preparation >= 1.0 && !goingAfter && RNG.chance(10)):
						goingAfter = true
				if(goingAfter):
					goTowards(leaveTarget)
					if(RNG.chance(30)):
						goTowards(leaveTarget)
					if(getLocation() == GM.pc.getLocation()):
						stopMe()
						runScene("NemesisAmbushScene", ["normal", getRoleID(ROLE_MAIN), getRoleID(ROLE_EXTRA1), getRoleID(ROLE_EXTRA2)])
						return
				elif(theDist > 2.0 || (theDist > 1.0 && RNG.chance(30))):
					goTowards(leaveTarget)
				elif(theDist > 1.0 && RNG.chance(30)):
					doWander()

func offer_text():
	saynn("{main.You} {main.youVerb('offer')} {offer.you} to join..")
	
	addAction("join", "Answer", "Time to answer", "default", 1.0, 120, {})

func offer_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "join"):
		var thePawn := getRolePawn(ROLE_OFFER)
		if(calcWillJoin(getRolePawn(ROLE_MAIN), thePawn)):
			doRemoveRole(ROLE_OFFER)
			inviteExtra(thePawn)
		else:
			doRemoveRole(ROLE_OFFER)
		setState("", ROLE_MAIN)

func canRoleBeInterrupted(_role:String) -> bool:
	return false

func getInterruptActions(_pawn:CharacterPawn) -> Array:
	return []

func getAnimData() -> Array:
	return [StageScene.Solo, "walk", {pc="main"}]

func getPreviewLineForRole(_role:String) -> String:
	#if(_role == "main"):
	return "{"+_role+".name} is heading somewhere.."
	#return .getPreviewLineForRole(_role)

func getActivityIconForRole(_role:String):
	if(getState() == "offer"):
		return RoomStuff.PawnActivity.Chat
	return RoomStuff.PawnActivity.None

func saveData():
	var data = .saveData()

	data["hasExtra1"] = hasExtra1
	data["hasExtra2"] = hasExtra2
	data["targetLoc"] = targetLoc
	data["preparation"] = preparation
	data["goingAfter"] = goingAfter
	return data

func loadData(_data):
	.loadData(_data)

	hasExtra1 = SAVE.loadVar(_data, "hasExtra1", false)
	hasExtra2 = SAVE.loadVar(_data, "hasExtra2", false)
	targetLoc = SAVE.loadVar(_data, "targetLoc", "")
	preparation = SAVE.loadVar(_data, "preparation", 0.0)
	goingAfter = SAVE.loadVar(_data, "goingAfter", false)
