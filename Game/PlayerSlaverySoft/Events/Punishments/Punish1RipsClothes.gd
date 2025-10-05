extends NpcOwnerEventBase

func _init():
	id = "Punish1RipsClothes"
	reactsToTags = [E_PUNISH]

func getSubEventScore(_event, _tag:String, _args:Array) -> float:
	return 1.0

func trySubEventStart(_event, _tag:String, _args:Array, _context:Dictionary) -> bool:
	var npcOwner := getNpcOwner()
	if(!npcOwner):
		return false
	if(!npcOwner.shouldPunishWeak()):
		return false
	if(!GM.pc.canDamageClothes()):
		return false
	return true
	
func start():
	#TODO: Use functions that return text of what was damaged
	if(onlyOnce()):
		for _i in range(RNG.randi_range(2, 4)):
			GM.pc.damageClothes()
	playAnimation(StageScene.Duo, "hurt", {npc=getOwnerID(), npcAction="shove"})
	sayPretext()
	saynn("YOUR OWNER RIPS YOUR CLOTHES!")
	talk(C_OWNER, "ENOUGH FOR YOU? OBEY OR I WILL DO SOMETHING WORSE.")
	
	addContinue("endEvent")

