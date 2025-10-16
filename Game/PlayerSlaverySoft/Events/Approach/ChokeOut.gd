extends NpcOwnerEventBase

var sexSatisfaction:float = 1.0

func _init():
	id = "ChokeOut"
	reactsToTags = ["aMean"]
	eventWeight = 1.0
	eventMinLevel = 1

func start():
	playAnimation(StageScene.Choking, "idle", {pc=getRoleID(C_OWNER)})
	saynn("Your owner {npc.name} grabs your throat as soon as {npc.he} {npc.verb('approach', 'approaches')} you!")
	talkModularOwnerToPC("SoftSlaveryChokeOutStart") #I'm so fucking mad. I need a toy to abuse and you seem good enough, {npc.npcSlave}.
	saynn("Looks like {npc.he} {npc.isAre} not in the best mood today..")
	
	var theChar = GlobalRegistry.getCharacter(getOwnerID())
	if(theChar):
		theChar.addEffect("SexAngry", [100])
	addContinue("startSex", [getOwnerID(), "pc", SexType.DefaultSex, {SexMod.DisableDynamicJoiners:true, SexMod.BondageDisabled:true, SexMod.SubMustGoUnconscious:true}])

func start_sexResult(_sex:SexEngineResult):
	sexSatisfaction = _sex.getAverageDomSatisfaction()
	if(!_sex.didSubsWin()):
		setState("afterSex")
	else:
		setState("afterSexWon")

func start_sexResultUncon(_sex:SexEngineResult):
	sexSatisfaction = _sex.getAverageDomSatisfaction()
	setState("afterSexUncon")

func afterSex():
	playAnimation(StageScene.SexStart, "start", {pc=getOwnerID()})
	saynn("You've have managed to endure the onslaught!")
	saynn("Your owner is not so mad anymore.")
	talkModularOwnerToPC("SoftSlaveryChokeOutEndured") #"I feel so much better. Thanks, {npc.npcSlave}."
	addInfluenceObey()
	addContinue("endEvent")

func afterSexWon():
	playAnimation(StageScene.GivingBirth, "idle", {pc=getOwnerID()})
	saynn("You have managed to fight back against your owner before they choke you out!")
	talkModularOwnerToPC("SoftSlaveryChokeOutPCWon") #Ugh. Why are you such a bitch
	addInfluenceResist()
	saynn("{npc.He} {npc.isAre} still busy recovering, allowing you to leave.")
	addContinue("endEvent")

func afterSexUncon():
	playAnimation(StageScene.SexStart, "defeated", {pc=getOwnerID()})
	
	saynn("You lose consciousness, unable to endure the onslaught for so long..")
	talkModularOwnerToPC("SoftSlaveryChokeOutPCLost") #"Such a weak {npc.npcSlave}. Can't even take some fucking abuse."
	addInfluenceObey(0.5)
	
	var theSexChance:float = 30.0 + 50.0 * ownerFetish(Fetish.UnconsciousSex)
	if(RNG.chance(theSexChance)):
		saynn("Your owner was about to get up and leave.. but then..")
		talkModularOwnerToPC("SoftSlaveryChokeOutPCLostSex")
		addContinue("startSex", [getOwnerID(), "pc", SexType.DefaultSex, {SexMod.DisableDynamicJoiners:true, SexMod.BondageDisabled:true, SexMod.SubsStartUnconscious:true}])
	else:
		saynn("Your owner gets up and just walks away.")
	
		addContinue("endEventUncon")

func afterSexUncon_do(_id:String, _args:Array):
	if(_id == "endEventUncon"):
		endEvent()
		stopRunner()
		GM.main.IS.startInteraction("Unconscious", {main="pc"})

func afterSexUncon_sexResult(_sex:SexEngineResult):
	endEvent()
	stopRunner()

func saveData() -> Dictionary:
	var data := .saveData()
	
	data["sexSatisfaction"] = sexSatisfaction
	
	return data

func loadData(_data:Dictionary):
	.loadData(_data)
	
	sexSatisfaction = SAVE.loadVar(_data, "sexSatisfaction", 1.0)
