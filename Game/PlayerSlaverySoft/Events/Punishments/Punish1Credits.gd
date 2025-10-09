extends NpcOwnerEventBase

func _init():
	id = "Punish1Credits"
	reactsToTags = [E_PUNISH]

func getSubEventScore(_event, _tag:String, _args:Array) -> float:
	return 1.0

func trySubEventStart(_event, _tag:String, _args:Array, _context:Dictionary) -> bool:
	var npcOwner := getNpcOwner()
	if(!npcOwner):
		return false
	if(!npcOwner.shouldPunishWeak()):
		return false
	return true
	
func start():
	playAnimation(StageScene.Duo, "hurt", {npc=getOwnerID(), npcAction="shove"})
	sayPretext()
	if(isOwnerStaff()):
		saynn("{npc.name} shoves you and then presses some kind of device against your collar!")
	else:
		saynn("{npc.name} shoves you and then presses some kind of hacked chip against your collar!")
	talkModularOwnerToPC("SoftSlaveryPunishCredits")
	saynn("Your collar beeps as some of your credits get forcefully withdrawn from your inmate accounts..")
	talkModularOwnerToPC("SoftSlaveryPunishCredits2")
	
	if(onlyOnce()):
		var credAmount:int = RNG.randi_range(5, 10)
		GM.pc.addCredits(-credAmount)
		GM.main.addMessage("You lost "+str(credAmount)+" credits!")
	
	addContinue("endEvent")
	
