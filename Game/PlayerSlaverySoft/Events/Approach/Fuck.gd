extends NpcOwnerEventBase

var sexSatisfaction:float = 1.0

func _init():
	id = "Fuck"
	reactsToTags = ["aMean"]

func start():
	playAnimation(StageScene.Duo, "stand", {npc=getRoleID(C_OWNER)})
	saynn("FUCK!")
	talk(C_OWNER, "I'M GONNA FUCK YOU!")
	
	addButton("Obey", "Allow them to do it", "obey")
	addButton("Resist!", "You're not gonna let them do it", "resist")

func start_do(_id:String, _args:Array):
	if(_id == "obey"):
		if(checkSubEvent("fuck", "You were about to be fucked by {npc.name}..", [])):
			return
		setState("obey")
	if(_id == "resist"):
		runResist()

func start_eventResult(_event, _id:String, _args:Array):
	if(_id == "resist"):
		setState("obey")
	if(_id == "fuck"):
		setState("obey")
	
func obey():
	playAnimation(StageScene.Duo, "kneel", {npc=getRoleID(C_OWNER)})
	
	saynn("YOU OBEY AND SUBMIT!")
	addInfluenceObey(RNG.randf_range(0.05, 0.1))
	addButton("Continue", "See what happens next", "startSex", [getRoleID(C_OWNER), "pc", SexType.DefaultSex, {SexMod.DisableDynamicJoiners:true}])
	
func obey_sexResult(_sexResult:SexEngineResult):
	sexSatisfaction = _sexResult.getAverageDomSatisfaction()
	setState("afterSex")

func afterSex():
	playAnimation(StageScene.Duo, "stand", {npc=getRoleID(C_OWNER)})
	saynn("SEX ENDS!")
	if(sexSatisfaction < 0.6):
		talk(C_OWNER, "THAT WAS KINDA BAD.")
	elif(sexSatisfaction < 0.8):
		talk(C_OWNER, "THAT WAS OKAY.")
	elif(sexSatisfaction < 0.9):
		talk(C_OWNER, "THAT WAS GOOD.")
	else:
		talk(C_OWNER, "THAT WAS GREAT.")
	if(sexSatisfaction > 0.4):
		addInfluenceObey(sexSatisfaction)
	else:
		addInfluenceResist(1.0-sexSatisfaction)
	addContinue("endEvent")

func saveData() -> Dictionary:
	var data := .saveData()
	
	data["sexSatisfaction"] = sexSatisfaction
	
	return data

func loadData(_data:Dictionary):
	.loadData(_data)
	
	sexSatisfaction = SAVE.loadVar(_data, "sexSatisfaction", 1.0)
