extends NpcOwnerEventBase

func _init():
	id = "ParadeGuard"
	reactsToTags = [E_PARADE_TO]
	eventWeight = 0.1

func trySubEventStart(_event, _tag:String, _args:Array, _context:Dictionary) -> bool:
	if(_args.empty()):
		return false
	var thePawns:Array = _args[0]
	for thePawn in thePawns:
		if(thePawn.isGuard()):
			involveCharID(C_EXTRA1, thePawn.getCharID())
			return true
	return false
	
func start():
	playAnimation(StageScene.Duo, "stand", {pc=getOwnerID(), npc=getRoleID(C_EXTRA1)})
	sayPretext()
	saynn("A guard stops you and your owner.")
	talk(C_EXTRA1, "Hey, what is happening here?")
	
	if(getRolePawn(C_OWNER).isStaff() && RNG.chance(50)):
		setSubResult(SUB_CONTINUE)
		talk(C_OWNER, "I'm punishing this inmate.")
		talk(C_EXTRA1, "Carry on then.")
		addContinue("endEvent")
		return
	
	talk(C_OWNER, "That's not your problem.")
	talk(C_EXTRA1, "Really?")
	saynn("Looks like they're about to fight..")
	
	addContinue("fight")

func start_do(_id:String, _args:Array):
	if(_id == "fight"):
		runNpcFight(getRoleID(C_OWNER), getRoleID(C_EXTRA1))

func start_eventResult(_event, _tag:String, _args:Array):
	if(_event.didWin()):
		setSubResult(SUB_CONTINUE)
		setState("ownerWon")
	else:
		setState("ownerLost")

func ownerWon():
	playAnimation(StageScene.Duo, "stand", {npc=getOwnerID(), bodyState={leashedBy=getOwnerID()}})
	
	saynn("Your owner clicks the leash to your collar again.")
	talkOwner("You're not getting rid of me so easily.")
	addInfluenceObey(0.2)
	addContinue("endEvent")

func ownerLost():
	playAnimation(StageScene.Duo, "stand", {npc=getRoleID(C_EXTRA1)})
	
	saynn("The guard frees you.")
	talk(C_EXTRA1, "Go away now.")
	addInfluenceResist(0.4)
	addContinue("endEvent")
