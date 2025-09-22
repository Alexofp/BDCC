extends NpcOwnerEventBase

func _init():
	id = "FuckInStocks"

func onStart(_args:Array):
	setState("start")

func start():
	playAnimation(StageScene.Duo, "stand", {npc=getRoleID(C_OWNER)})
	saynn("FUCK IN STOCKS!")
	talk(C_OWNER, "I'M GONNA FUCK YOU IN STOCKS!")
	
	addButton("Obey", "Allow them to do it", "obey")
	addButton("Resist!", "You're not gonna let them do it", "resist")

func getSubEventScore(_event, _tag:String, _args:Array) -> float:
	return 0.0

func trySubEventStart(_event, _tag:String, _args:Array) -> bool:
	return true

func checkSubEvent(_tag:String, _pretext:String, _args:Array) -> bool:
#	var possible:Array = []
#	var totalScore:float = 0.0
#	for eventID in GlobalRegistry.getNpcOwnerEvents():
#		var 
	return false

func shouldEndAfterSubEvent(_args:Array) -> bool:
	return true

func start_do(_id:String, _args:Array):
	if(_id == "obey"):
		if(checkSubEvent("lockedInStocks", "You were about to be locked into stocks by {npc.name}..", [])):
			return
		setState("inStocks")
	if(_id == "resist"):
		runEvent("resist", "ResistGeneric")

func start_eventResult(_id:String, _args:Array):
	if(_id == "resist"):
		setState("inStocks")
	if(_id == "subEvent"):
		if(shouldEndAfterSubEvent(_args)):
			endEvent()
		else:
			setState("inStocks")
	
func inStocks():
	setLocation(LOC_STOCKS)
	playAnimation(StageScene.StocksSexOral, "tease", {npc=getRoleID(C_OWNER)})
	
	saynn("YOU OBEY!")
	addInfluenceObey()
	saynn("YOU GET LOCKED IN STOCKS BY {npc.you}!")
	addButton("Continue", "See what happens next", "startSex", [getRoleID(C_OWNER), "pc", SexType.StocksSex])
	
func inStocks_sexResult(_sexResult:SexEngineResult):
	setState("afterSex")

func afterSex():
	playAnimation(StageScene.Duo, "stand", {npc=getRoleID(C_OWNER)})
	saynn("AFTER SEX, YOU GET UNLOCKED FROM STOCKS!")
	addContinue("endEvent")
