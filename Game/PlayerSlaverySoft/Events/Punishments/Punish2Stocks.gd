extends NpcOwnerEventBase

# Make it so the npc finds someone first? Then leaves you be?

func _init():
	id = "Punish2Stocks"
	reactsToTags = [E_PUNISH]

func getSubEventScore(_event, _tag:String, _args:Array) -> float:
	return 1.0

func trySubEventStart(_event, _tag:String, _args:Array, _context:Dictionary) -> bool:
	var npcOwner := getNpcOwner()
	if(!npcOwner):
		return false
	if(!npcOwner.shouldPunishStrong()):
		return false
	return true
	
func start():
	playAnimation(StageScene.Duo, "stand", {npc=getRoleID(C_OWNER), bodyState={leashedBy=getOwnerID()}})
	sayPretext()
	saynn("{npc.name} shoves you and then clips a leash to your collar!")
	talkModularOwnerToPC("SoftSlaveryPunishStocks")
	saynn("Your owner is really not in a good mood..")
	
	addContinue("setState", ["inStocks"])
	
func inStocks():
	setLocation(LOC_STOCKS)
	playAnimation(StageScene.StocksSexOral, "tease", {npc=getRoleID(C_OWNER)})
	
	saynn("You get brought to the punishment platform and get locked into the stocks!")
	talkModularOwnerToPC("SoftSlaveryPunishStocksLock")
	#TODO: The owner gets somebody
	addContinue("startStocks")

func inStocks_do(_id:String, _args:Array):
	endEvent()
	stopRunner()
	
	GM.main.IS.startInteraction("InStocks", {inmate="pc"})
