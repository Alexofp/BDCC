extends NpcOwnerEventBase

var sexSatisfaction:float = 1.0

func _init():
	id = "FuckInSlutwall"
	reactsToTags = ["aMean"]
	eventWeight = 1.0

func trySubEventStart(_event, _tag:String, _args:Array, _context:Dictionary) -> bool:
	if(getOwner().isStaff()):
		return false
	if(!canGetToSlutwall()):
		return false
	return true

func start():
	playAnimation(StageScene.Duo, "stand", {npc=getRoleID(C_OWNER)})
	saynn("FUCK IN SLUTWALL!")
	talk(C_OWNER, "I'M GONNA FUCK YOU IN A SLUTWALL!")
	
	addButton("Obey", "Allow them to do it", "obey")
	addButton("Resist!", "You're not gonna let them do it", "resist")

func start_do(_id:String, _args:Array):
	if(_id == "obey"):
		runParadeTo(LOC_SLUTWALL)
	if(_id == "resist"):
		runResist()

func start_eventResult(_event, _id:String, _args:Array):
	if(_id == "paradeTo"):
		setState("inStocks")
		checkSubEvent("FuckInSlutwall", "You were about to be locked into the slutwall by {npc.name}..", [])
	
func inStocks():
	playAnimation(StageScene.SlutwallSex, "tease", {npc=getRoleID(C_OWNER)})
	
	saynn("YOU OBEY!")
	saynn("YOU GET LOCKED IN THE SLUTWALL BY {npc.you}!")
	addButton("Continue", "See what happens next", "startSex", [getRoleID(C_OWNER), "pc", SexType.SlutwallSex, {SexMod.DisableDynamicJoiners:true}])
	
func inStocks_sexResult(_sexResult:SexEngineResult):
	sexSatisfaction = _sexResult.getAverageDomSatisfaction()
	setState("afterSex")

func afterSex():
	playAnimation(StageScene.Duo, "stand", {npc=getRoleID(C_OWNER)})
	saynn("AFTER SEX, YOU GET UNLOCKED FROM THE SLUTWALL!")
	
	addInfluenceObey(sexSatisfaction)
	
	addContinue("endEvent")

func saveData() -> Dictionary:
	var data := .saveData()
	data["sexSatisfaction"] = sexSatisfaction
	return data

func loadData(_data:Dictionary):
	.loadData(_data)
	
	sexSatisfaction = SAVE.loadVar(_data, "sexSatisfaction", 1.0)
