extends NpcOwnerEventBase

var sexSatisfaction:float = 1.0

func _init():
	id = "AskSex"

func onStart(_args:Array):
	#freedomPrice = getFreedomPrice()
	#setSubResult(SUB_CONTINUE)
	pass

func start():
	playAnimation(StageScene.Grope, "tease", {npc=getOwnerID()})
	saynn("You ask {npc.name} if {npc.he} can fuck you!")
	talkModularOwnerToPC("SoftSlaveryAskSex") #Sure. Get on your knees first.
	saynn("Looks like you will need to beg a bit.")
	
	addButton("Obey", "Allow them to do it", "obey")
	if(canSetLimits()):
		addButton("Obey, but..", "Obey but put limits to what your owner can do to you during sex", "yesbut")
	else:
		addDisabledButton("Obey, but..", "Your relationship hasn't progressed far enough for you to be able to set limits")

func start_do(_id:String, _args:Array):
	if(_id == "obey"):
		setState("obey")
	if(_id == "yesbut"):
		runEvent("yesbut", "SetOwnerLimits")
		setState("obey")
	
func obey():
	playAnimation(StageScene.Duo, "kneel", {npc=getRoleID(C_OWNER)})
	saynn("You submit to your owner!")
	addInfluenceObey(RNG.randf_range(0.05, 0.1))
	addButton("Continue", "See what happens next", "startSex", [getRoleID(C_OWNER), "pc", SexType.DefaultSex, {SexMod.DisableDynamicJoiners:true}])
	
func obey_sexResult(_sexResult:SexEngineResult):
	sexSatisfaction = _sexResult.getAverageDomSatisfaction()
	setState("afterSex")

func afterSex():
	playAnimation(StageScene.Duo, "stand", {npc=getRoleID(C_OWNER)})
	saynn("The sex has ended!")
	if(sexSatisfaction < 0.5):
		talkModularOwnerToPC("SoftSlaveryFuckResultBad") #"That was awful. Are you trying to make me mad, {npc.npcSlave}? Whatever, I will be back soon."
	elif(sexSatisfaction < 0.8):
		talkModularOwnerToPC("SoftSlaveryFuckResultOkay") #"That was okay. Can't you moan a little louder, {npc.npcSlave}? I will be back when I'm horny again."
	else:
		talkModularOwnerToPC("SoftSlaveryFuckResultGood") #"Not bad for a {npc.npcSlave}. I will be back when I'm horny again."
	#if(sexSatisfaction > 0.4):
	#	addInfluenceObey(sexSatisfaction)
	#else:
	#	addInfluenceResist(1.0-sexSatisfaction)
	addContinue("endEvent")

func saveData() -> Dictionary:
	var data := .saveData()
	
	data["sexSatisfaction"] = sexSatisfaction
	
	return data

func loadData(_data:Dictionary):
	.loadData(_data)
	
	sexSatisfaction = SAVE.loadVar(_data, "sexSatisfaction", 1.0)
