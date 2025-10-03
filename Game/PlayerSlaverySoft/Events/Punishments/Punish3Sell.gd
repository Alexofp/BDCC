extends NpcOwnerEventBase

func _init():
	id = "Punish3Sell"
	reactsToTags = [E_PUNISH]

func getSubEventScore(_event, _tag:String, _args:Array) -> float:
	return 1.0

func trySubEventStart(_event, _tag:String, _args:Array) -> bool:
	var npcOwner := getNpcOwner()
	if(!npcOwner):
		return false
	if(!npcOwner.shouldPunishGetRidOf()):
		return false
	return true
	
func start():
	playAnimation(StageScene.Duo, "stand", {npc=getRoleID(C_OWNER)})
	sayPretext()
	saynn("GONNA SELL!")
	talk(C_OWNER, "SORRYYY!")
	
	addContinue("getSold")

func start_do(_id:String, _args:Array):
	var npcOwner := getNpcOwner()
	if(npcOwner):
		npcOwner.endSlavery()
	endEvent()
	stopRunner()
	GM.main.runScene(GlobalRegistry.getModule("PlayerSlaveryModule").getSlaveryStartScene())
