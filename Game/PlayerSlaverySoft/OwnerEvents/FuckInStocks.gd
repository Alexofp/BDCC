extends NpcOwnerEventBase

var sexSatisfaction:float = 1.0

func _init():
	id = "FuckInStocks"
	reactsToTags = ["aMean"]

func start():
	playAnimation(StageScene.Duo, "stand", {npc=getRoleID(C_OWNER)})
	saynn("FUCK IN STOCKS!")
	talk(C_OWNER, "I'M GONNA FUCK YOU IN STOCKS!")
	
	addButton("Obey", "Allow them to do it", "obey")
	addButton("Resist!", "You're not gonna let them do it", "resist")



#func shouldEndAfterSubEvent(_args:Array) -> bool:
#	return true

func start_do(_id:String, _args:Array):
	if(_id == "obey"):
		setLocation(LOC_STOCKS)
		if(checkSubEvent("FuckInStocks", "You were about to be locked into stocks by {npc.name}..", [])):
			return
		setState("inStocks")
	if(_id == "resist"):
		runResist()

func start_eventResult(_event, _id:String, _args:Array):
	if(_id == "resist"):
		setState("inStocks")
	if(_id == "lockedInStocks"):
		setState("inStocks")
	
func inStocks():
	playAnimation(StageScene.StocksSexOral, "tease", {npc=getRoleID(C_OWNER)})
	
	saynn("YOU OBEY!")
	saynn("YOU GET LOCKED IN STOCKS BY {npc.you}!")
	addButton("Continue", "See what happens next", "startSex", [getRoleID(C_OWNER), "pc", SexType.StocksSex, {SexMod.DisableDynamicJoiners:true}])
	
func inStocks_sexResult(_sexResult:SexEngineResult):
	sexSatisfaction = _sexResult.getAverageDomSatisfaction()
	setState("afterSex")

func afterSex():
	playAnimation(StageScene.Duo, "stand", {npc=getRoleID(C_OWNER)})
	saynn("AFTER SEX, YOU GET UNLOCKED FROM STOCKS!")
	
	addInfluenceObey(sexSatisfaction)
	
	addContinue("endEvent")

func saveData() -> Dictionary:
	var data := .saveData()
	data["sexSatisfaction"] = sexSatisfaction
	return data

func loadData(_data:Dictionary):
	.loadData(_data)
	
	sexSatisfaction = SAVE.loadVar(_data, "sexSatisfaction", 1.0)
