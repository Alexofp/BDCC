extends NpcOwnerEventBase

func _init():
	id = "Punish3Sell"
	reactsToTags = [E_PUNISH_GET_RID_OF]

func getSubEventScore(_event, _tag:String, _args:Array) -> float:
	return 1.0

func trySubEventStart(_event, _tag:String, _args:Array, _context:Dictionary) -> bool:
	var npcOwner := getNpcOwner()
	if(!npcOwner):
		return false
	return true
	
func start():
	playAnimation(StageScene.Duo, "stand", {npc=getRoleID(C_OWNER)})
	sayPretext()
	saynn("Your owner gives you a very mean look!")
	talkModularOwnerToPC("SoftSlaveryPunishSell")
	saynn("Sounds like you're about to get your freedom back?")
	
	addContinue("setState", ["flashed"])

func flashed():
	playAnimation(StageScene.Sleeping, "sleep")
	saynn("Suddenly, you see a bright flash! So bright it feels like it pierces straight through you!")
	saynn("An agonizing headache makes your head spin.. and then you collapse.")
	saynn("The landing wasn't the softest. You feel your consciousness slipping away..")
	talkModularOwnerToPC("SoftSlaveryPunishSell2")
	
	addContinue("getSold")

func flashed_do(_id:String, _args:Array):
	var npcOwner := getNpcOwner()
	if(npcOwner):
		npcOwner.endSlavery()
	endEvent()
	stopRunner()
	GM.main.runScene(GlobalRegistry.getModule("PlayerSlaveryModule").getSlaveryStartScene())
