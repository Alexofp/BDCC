extends NpcOwnerEventBase

func _init():
	id = "Punish3TestSubject"
	reactsToTags = [E_PUNISH]

func getSubEventScore(_event, _tag:String, _args:Array) -> float:
	return 1.0

func trySubEventStart(_event, _tag:String, _args:Array, _context:Dictionary) -> bool:
	var npcOwner := getNpcOwner()
	if(!npcOwner):
		return false
	if(!npcOwner.shouldPunishGetRidOf()):
		return false
	return true
	
func start():
	playAnimation(StageScene.Duo, "stand", {npc=getRoleID(C_OWNER), bodyState={leashedBy=getOwnerID()}})
	sayPretext()
	saynn("GONNA GIVE TO ELIZA!")
	talk(C_OWNER, "ELIZAA!")
	
	addContinue("goToEliza")

func start_do(_id:String, _args:Array):
	if(_id == "goToEliza"):
		involveCharID(C_EXTRA1, "eliza")
		setLocation(LOC_MED_COUNTER)
		setState("nearEliza")
	
func nearEliza():
	playAnimation(StageScene.Duo, "stand", {pc=getRoleID(C_OWNER), npc="eliza"})
	
	saynn("IN MEDICAL.")
	talk(C_OWNER, "ELIZAA!")
	talk(C_EXTRA1, "HAI! GIVE.")
	
	addContinue("getSold")

func nearEliza_do(_id:String, _args:Array):
	var npcOwner := getNpcOwner()
	if(npcOwner):
		npcOwner.endSlavery()
	endEvent()
	stopRunner()
	
	GlobalRegistry.getModule("MedicalModule").preparePCForMentalWard()
	GM.main.startNewDay()
	GM.main.runScene("MentalWardScene")
