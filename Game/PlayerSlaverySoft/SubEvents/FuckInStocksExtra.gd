extends NpcOwnerEventBase

func _init():
	id = "FuckInStocksExtra"
	reactsToTags = ["lockedInStocks"]

func getSubEventScore(_event, _tag:String, _args:Array) -> float:
	return 1.0

func trySubEventStart(_event, _tag:String, _args:Array) -> bool:
	if(RNG.chance(50)):
		setState("sfight")
	involveCharID(C_EXTRA1, "risha")
	return true
	
func start():
	playAnimation(StageScene.Duo, "stand", {pc=getRoleID(C_EXTRA1), npc=getRoleID(C_OWNER)})
	sayPretext()
	saynn("SUB EVENT!")
	talk(C_EXTRA1, "I WANNA FUCK THEM TOO!")
	talk(C_OWNER, "SOUNDS GOOD!")
	
	addContinue("setState", ["inStocks"])

func inStocks():
	setLocation(LOC_STOCKS)
	playAnimation(StageScene.StocksSpitroast, "tease", {npc=getRoleID(C_OWNER), npc2=getRoleID(C_EXTRA1)})
	
	saynn("YOU OBEY!")
	addInfluenceObey()
	saynn("YOU ARE ABOUT TO GET FUCKED BY 2 PEOPLE!")
	addButton("Continue", "See what happens next", "startSex", [[getRoleID(C_OWNER), getRoleID(C_EXTRA1)], "pc", SexType.StocksSex])
	
func inStocks_sexResult(_sexResult:SexEngineResult):
	setState("afterSex")

func afterSex():
	playAnimation(StageScene.Duo, "stand", {npc=getRoleID(C_OWNER)})
	saynn("AFTER SEX, YOU GET UNLOCKED FROM STOCKS!")
	addContinue("endEvent")

func sfight():
	playAnimation(StageScene.Duo, "stand", {pc=getRoleID(C_EXTRA1), npc=getRoleID(C_OWNER)})
	saynn("SUB EVENT!")
	talk(C_EXTRA1, "I WANNA FUCK THEM TOO!")
	talk(C_OWNER, "FUCK YOU! NO!")
	talk(C_EXTRA1, "I AIN'T GONNA BACK AWAY!")
	
	addContinue("doNpcFight")

func sfight_do(_id:String, _args:Array):
	if(_id == "doNpcFight"):
		runEvent("npcFight", "NpcFight", [getRoleID(C_EXTRA1), getRoleID(C_OWNER)])

func sfight_eventResult(_event, _tag:String, _args:Array):
	if(_event.didNpc1Win()):
		setState("extraWon")
	else:
		setState("extraLost")

func extraLost():
	playAnimation(StageScene.Solo, "stand", {pc=getRoleID(C_OWNER)})
	saynn("{npc1.name} fucks off!")
	addContinue("endEvent")

func extraWon():
	playAnimation(StageScene.StocksSexOral, "tease", {npc=getRoleID(C_EXTRA1)})
	saynn("{npc1.name} won! Looks like they're gonna fuck you alone!")
	
	addButton("Continue", "See what happens next", "startSex", [getRoleID(C_EXTRA1), "pc", SexType.StocksSex])

func extraWon_sexResult(_sex:SexEngineResult):
	setSubResult(SUB_END)
	endEvent()
