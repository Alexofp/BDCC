extends NpcOwnerEventBase

func _init():
	id = "Punish1Credits"
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
	playAnimation(StageScene.Duo, "hurt", {npc=getOwnerID(), npcAction="shove"})
	sayPretext()
	saynn("YOUR OWNER SHOVES YOU AND THEN PRESS SOME KIND OF HACKED CHIP AGAINST YOUR COLLAR!")
	talk(C_OWNER, "I WILL TAKE SOME OF YOUR CREDITS.")
	
	saynn("YOUR COLLAR BEEPS.. LEAVING YOUR INMATE ACCOUNT WITH LESS CREDITS THAT IT HAD BEFORE.")
	
	talk(C_OWNER, "IF I DON'T GET YOUR OBEDIENCE, I WILL AT LEAST HAVE YOUR CREDITS.")
	
	addContinue("endEvent")
	
