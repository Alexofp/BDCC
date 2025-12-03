extends NpcOwnerEventBase

var sexSatisfaction:float = 1.0

func _init():
	id = "FuckInSlutwall"
	reactsToTags = [E_APPROACH]
	eventWeight = 0.6
	eventMinLevel = 0
	eventTagWeightOverrides = {NOET.OwnerSex: 1.5, NOET.BDSM: 2.0, NOET.ShowingOff:1.0}

func trySubEventStart(_event, _tag:String, _args:Array, _context:Dictionary) -> bool:
	if(getOwner().isStaff()):
		return false
	if(!canGetToSlutwall()):
		return false
	return true

func start():
	playAnimation(StageScene.Duo, "stand", {npc=getRoleID(C_OWNER)})
	saynn("Your owner approaches you, leash in {npc.his} hand!")
	talkModularOwnerToPC("SoftSlaverySlutwallStart")
	
	addButton("Obey", "Allow them to do it", "obey")
	addButton("Resist!", "You're not gonna let them do it", "resist")
	if(canSetLimits()):
		addButton("Yes, but..", "Obey but put limits to what your owner can do to you during sex", "yesbut")
	else:
		addDisabledButton("Yes, but..", "Your relationship hasn't progressed far enough for you to be able to set limits")

func start_do(_id:String, _args:Array):
	if(_id == "obey"):
		runParadeTo(LOC_SLUTWALL)
	if(_id == "resist"):
		runResist()
	if(_id == "yesbut"):
		runEvent("yesbut", "SetOwnerLimits")

func start_eventResult(_event, _id:String, _args:Array):
	if(_id == "yesbut"):
		runParadeTo(LOC_SLUTWALL)
	if(_id == "paradeTo"):
		setState("inStocks")
		checkSubEvent("FuckInSlutwall", "You were about to be locked into the slutwall by {npc.name}..", [])
	
func inStocks():
	playAnimation(StageScene.SlutwallSex, "tease", {npc=getRoleID(C_OWNER)})
	
	saynn("You obey fully and let {npc.name} lock you into the slutwall!")
	talkModularOwnerToPC("SoftSlaverySlutwallLocked")
	addContinue("startSex", [getRoleID(C_OWNER), "pc", SexType.SlutwallSex, {SexMod.DisableDynamicJoiners:true}])
	
func inStocks_sexResult(_sexResult:SexEngineResult):
	sexSatisfaction = _sexResult.getAverageDomSatisfaction()
	setState("afterSex")

func afterSex():
	playAnimation(StageScene.Duo, "stand", {npc=getRoleID(C_OWNER)})
	saynn("After the sex, your owner is nice enough to unlock you!")
	
	if(sexSatisfaction < 0.5):
		talkModularOwnerToPC("SoftSlaveryFuckResultBad") #"That was awful. Are you trying to make me mad, {npc.npcSlave}? Whatever, I will be back soon."
	elif(sexSatisfaction < 0.8):
		talkModularOwnerToPC("SoftSlaveryFuckResultOkay") #"That was okay. Can't you moan a little louder, {npc.npcSlave}? I will be back when I'm horny again."
	else:
		talkModularOwnerToPC("SoftSlaveryFuckResultGood") #"Not bad for a {npc.npcSlave}. I will be back when I'm horny again."
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
