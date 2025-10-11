extends NpcOwnerEventBase

var sexSatisfaction:float = 1.0

func _init():
	id = "Punish1RoughSex"
	reactsToTags = [E_PUNISH_WEAK]

func getSubEventScore(_event, _tag:String, _args:Array) -> float:
	return 1.0

func trySubEventStart(_event, _tag:String, _args:Array, _context:Dictionary) -> bool:
	var npcOwner := getNpcOwner()
	if(!npcOwner):
		return false
	return true
	
func start():
	playAnimation(StageScene.SexLowDoggy, "tease", {pc=getOwnerID()})
	sayPretext()
	saynn("{npc.name} grabs and pins you into the floor!")
	talkModularOwnerToPC("SoftSlaveryPunishRoughSex")
	
	var theChar = GlobalRegistry.getCharacter(getOwnerID())
	if(theChar):
		theChar.addEffect("SexAngry", [100])
	addContinue("startSex", [getOwnerID(), "pc", SexType.DefaultSex, {SexMod.DisableDynamicJoiners:true,SexMod.DomNoPullingOut:true}])

func start_sexResult(_sex:SexEngineResult):
	sexSatisfaction = _sex.getAverageDomSatisfaction()
	if(_sex.didSubsWin()):
		setState("pcWon")
	else:
		setState("afterSex")

func afterSex():
	playAnimation(StageScene.SexStart, "start", {pc=getOwnerID()})
	saynn("The rough sex has ended!")
	talkModularOwnerToPC("SoftSlaveryPunishRoughSexEnded")
	saynn("Looks like the punishment is over..")
	addContinue("endEvent")

func pcWon():
	playAnimation(StageScene.Duo, "stand", {npc=getOwnerID(), npcAction="defeat"})
	saynn("You managed to fight back against your owner!")
	addInfluenceResist()
	talkModularOwnerToPC("SoftSlaveryPunishRoughSexPCWon") #Ugh.. I'm not done with you
	saynn("Looks like the punishment is over..")
	addContinue("endEvent")
