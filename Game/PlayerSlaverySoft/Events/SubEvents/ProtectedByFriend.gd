extends NpcOwnerEventBase

func _init():
	id = "ProtectedByFriend"
	reactsToTags = [E_PROTECT, "fuck"]
	eventWeight = 1.0

func trySubEventStart(_event, _tag:String, _args:Array, _context:Dictionary) -> bool:
	if(didPCCancelHelp()):
		return false
	var allFrens:Array= _event.getFreeFriendsIDsNearby(true, _context)
	if(allFrens.empty()):
		if(RNG.chance(_event.getNearbyCheckAllChance())):
			allFrens = _event.getFreeFriendsIDs(true, _context)
			if(allFrens.empty()):
				return false
		else:
			return false
	
	var randomFrenID:String = RNG.pick(allFrens)
	involveCharID(C_EXTRA1, randomFrenID)

	return true
	
func start():
	playAnimation(StageScene.Duo, "stand", {pc=getOwnerID(), npc=getRoleID(C_EXTRA1)})
	sayPretext()
	saynn("One of your friends suddenly shows up!")
	talkModular(C_EXTRA1, C_OWNER, "SoftSlaveryProtectedByFriendStart") #"HEY! WHAT ARE YOU DOING WITH {pc.name}?"
	talkModular(C_OWNER, C_EXTRA1, "SoftSlaveryProtectedByFriendResponse") #"It's none of your business"
	saynn("Looks like your friend wants to try to protect you..")
	
	addButton("Watch", "Let them fight", "fight")
	addButton("It's okay", "Tell your friend that everything is fine", "itsokay")

func start_do(_id:String, _args:Array):
	if(_id == "fight"):
		runNpcFight(getRoleID(C_OWNER), getRoleID(C_EXTRA1))
	if(_id == "itsokay"):
		setPCCancelledHelp(true)
		setSubResult(SUB_CONTINUE)
		setState("allgood")

func allgood():
	saynn("You tell your friend {npc1.name} that everything is okay.")
	talkModular(C_EXTRA1, C_OWNER, "SoftSlaveryProtectedByFriendAllGoodResp") #Alright. Whatever then
	addContinue("endEvent")

func start_eventResult(_event, _tag:String, _args:Array):
	if(_event.didWin()):
		setSubResult(SUB_CONTINUE)
		setState("ownerWon")
	else:
		setState("ownerLost")

func ownerWon():
	playAnimation(StageScene.Duo, "stand", {pc=getOwnerID(), npcAction="kneel", npc=getRoleID(C_EXTRA1)})
	
	saynn("Your owner won! You friend is unable to continue fighting.")
	talkModular(C_OWNER, C_EXTRA1, "SoftSlaveryProtectedByFriendLost") #Now go away while you still can
	addInfluenceObey(0.3)
	if(onlyOnce()):
		GM.main.RS.addAffection(getRoleID(C_EXTRA1), "pc", -0.2)
	addContinue("endEvent")

func ownerLost():
	playAnimation(StageScene.Duo, "stand", {npc=getRoleID(C_EXTRA1)})
	
	saynn("Your friend manages to save you! And so you thank {npc1.him} for the efforts.")
	talkModular(C_EXTRA1, "pc", "SoftSlaveryProtectedByFriendWonThank") # You are welcome
	addInfluenceResist(0.5)
	addContinue("endEvent")
