extends NpcOwnerEventBase

func _init():
	id = "Fuck"

func onStart(_args:Array):
	setState("start")

func start():
	playAnimation(StageScene.Duo, "stand", {npc=getRoleID(C_OWNER)})
	saynn("FUCK!")
	talk(C_OWNER, "I'M GONNA FUCK YOU!")
	
	addButton("Obey", "Allow them to do it", "obey")
	addButton("Resist!", "You're not gonna let them do it", "resist")

func start_do(_id:String, _args:Array):
	if(_id == "obey"):
		if(checkSubEvent("fuck", "You were about to be fucked by {npc.name}..", [])):
			return
		setState("obey")
	if(_id == "resist"):
		runEvent("resist", "ResistGeneric")

func start_eventResult(_event, _id:String, _args:Array):
	if(_id == "resist"):
		if(_event.shouldEndParent()):
			endEvent()
			return
		setState("obey")
	if(_id == "fuck"):
		if(_event.shouldEndParent()):
			endEvent()
			return
		setState("obey")
	
func obey():
	playAnimation(StageScene.Duo, "kneel", {npc=getRoleID(C_OWNER)})
	
	saynn("YOU OBEY AND SUBMIT!")
	addInfluenceObey()
	addButton("Continue", "See what happens next", "startSex", [getRoleID(C_OWNER), "pc"])
	
func obey_sexResult(_sexResult:SexEngineResult):
	setState("afterSex")

func afterSex():
	playAnimation(StageScene.Duo, "stand", {npc=getRoleID(C_OWNER)})
	saynn("AFTER SEX, YOU GET LET GO!")
	addContinue("endEvent")
