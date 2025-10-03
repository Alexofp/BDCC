extends NpcOwnerEventBase

# Make it so the npc finds someone first? Then leaves you be?

func _init():
	id = "Punish2Slutwall"
	reactsToTags = [E_PUNISH]

func getSubEventScore(_event, _tag:String, _args:Array) -> float:
	return 1.0

func trySubEventStart(_event, _tag:String, _args:Array) -> bool:
	var npcOwner := getNpcOwner()
	if(!npcOwner):
		return false
	if(!npcOwner.shouldPunishStrong()):
		return false
	if(!canGetToSlutwall()):
		return false
	if(!getOwner().isInmate()):
		return false
	return true
	
func start():
	playAnimation(StageScene.Duo, "stand", {npc=getRoleID(C_OWNER), bodyState={leashedBy=getOwnerID()}})
	sayPretext()
	saynn("GONNA SLUTWALL!")
	talk(C_OWNER, "SLUTWALL!")
	
	addContinue("setState", ["inStocks"])
	
func inStocks():
	setLocation(LOC_STOCKS)
	playAnimation(StageScene.SlutwallSex, "tease", {npc=getRoleID(C_OWNER)})
	
	saynn("YOU IN SLUTWALL!")
	addButton("Continue", "See what happens next", "startStocks")

func inStocks_do(_id:String, _args:Array):
	endEvent()
	stopRunner()
	
	GM.main.IS.startInteraction("InSlutwall", {inmate="pc"})
