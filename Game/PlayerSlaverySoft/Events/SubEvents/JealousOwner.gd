extends NpcOwnerEventBase

var sexSatisfaction:float = 1.0

func _init():
	id = "JealousOwner"
	reactsToTags = ["fuck"]
	eventWeight = 1.0

func trySubEventStart(_event, _tag:String, _args:Array, _context:Dictionary) -> bool:
	var allFrens:Array= _event.getFreeOwnerIDsNearby(true, _context)
	if(allFrens.empty()):
		if(RNG.chance(_event.getNearbyCheckAllChance())):
			allFrens = _event.getFreeOwnerIDs(true, _context)
			if(allFrens.empty()):
				return false
		else:
			return false
	
	var randomFrenID:String = RNG.pick(allFrens)
	involveCharID(C_EXTRA1, randomFrenID)
	return true
	
func start():
	playAnimation(StageScene.Duo, "stand", {pc=getRoleID(C_EXTRA1), npc=getOwnerID()})
	sayPretext()
	saynn("Someone approaches you two.. someone who you know.. and who knows you.")
	talk(C_EXTRA1, "THAT'S MY SLAVE! JEALOUS. FIGHT FIGHT FIGHT!")
	#talkModular(C_EXTRA1, C_OWNER, "SoftSlaveryFuckNemesisApproach")
	#talkModular(C_OWNER, C_EXTRA1, "SoftSlaveryFuckNemesisAsk") #What's your problem?
	#talkModular(C_EXTRA1, C_OWNER, "SoftSlaveryFuckNemesisAnswer") #Your slave crossed me. Wanna punish him together?
	
	saynn("Looks like your two owners are about to fight..")
	
	addContinue("fight")

func start_do(_id:String, _args:Array):
	if(_id == "fight"):
		runNpcFight(getOwnerID(), getRoleID(C_EXTRA1))

func start_eventResult(_event, _tag:String, _args:Array):
	if(_event.didWin()):
		setSubResult(SUB_CONTINUE)
		setState("ownerWon")
	else:
		setState("ownerLost")
	endEvent() #TODO:NOT DONE YET

func afterSex():
	playAnimation(StageScene.Duo, "stand", {npc=getRoleID(C_OWNER)})
	saynn("The sex has ended!")
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
	saynn("Your nemesis finally leaves you alone.")
	addContinue("endEvent")

func saveData() -> Dictionary:
	var data := .saveData()
	
	data["sexSatisfaction"] = sexSatisfaction
	
	return data

func loadData(_data:Dictionary):
	.loadData(_data)
	
	sexSatisfaction = SAVE.loadVar(_data, "sexSatisfaction", 1.0)
