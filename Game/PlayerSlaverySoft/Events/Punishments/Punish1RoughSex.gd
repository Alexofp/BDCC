extends NpcOwnerEventBase

func _init():
	id = "Punish1RoughSex"
	reactsToTags = [E_PUNISH]

func getSubEventScore(_event, _tag:String, _args:Array) -> float:
	return 1.0

func trySubEventStart(_event, _tag:String, _args:Array) -> bool:
	var npcOwner := getNpcOwner()
	if(!npcOwner):
		return false
	if(!npcOwner.shouldPunishWeak()):
		return false
	return true
	
func start():
	playAnimation(StageScene.Duo, "stand", {npc=getRoleID(C_OWNER)})
	sayPretext()
	saynn("ROUGH SEX GONNA HAPPEN!")
	talk(C_OWNER, "ROUGH SEX!")
	
	var theChar = GlobalRegistry.getCharacter(getOwnerID())
	if(theChar):
		theChar.addEffect("SexAngry", [100])
	addContinue("startSex", [getOwnerID(), "pc", SexType.DefaultSex, {SexMod.DisableDynamicJoiners:true}])

func start_sexResult(_sex:SexEngineResult):
	setState("afterSex")

func afterSex():
	saynn("SEX HAS ENDED!")
	
	addContinue("endEvent")
