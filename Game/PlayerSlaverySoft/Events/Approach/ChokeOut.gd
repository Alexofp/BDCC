extends NpcOwnerEventBase

var sexSatisfaction:float = 1.0

func _init():
	id = "ChokeOut"
	reactsToTags = ["aMean"]
	eventWeight = 1.0
	eventMinLevel = 0

func start():
	playAnimation(StageScene.Choking, "idle", {pc=getRoleID(C_OWNER)})
	saynn("Your owner grabs your throat as soon as {npc.he} {npc.verb('approach', 'approaches')} you!")
	talk(C_OWNER, "I HAVE TO BLOW SOME STEAM AND YOU ARE THE PERFECT TOY!")
	saynn("Looks like {npc.he} {npc.isAre} really mad today..")
	
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
	saynn("You've have managed to endure the onslaught!")
	
	saynn("Your owner is not so angry anymore.")
	
	talk(C_OWNER, "MAYBE YOU HAVE SOME USES.")
	
	addInfluenceObey()
	
	addContinue("endEvent")

func afterSexWon():
	playAnimation(StageScene.SexStart, "start", {npc=getOwnerID()})
	saynn("You have managed to fight back against your owner before they choke you out!")
	
	talk(C_OWNER, "STUPID BITCH.")
	
	addInfluenceResist()
	
	saynn("{npc.He} {npc.isAre} still busy recovering, allowing you to leave.")
	
	addContinue("endEvent")

func afterSexUncon():
	playAnimation(StageScene.SexStart, "defeated", {pc=getOwnerID()})
	
	saynn("You lose consciousness, unable to endure the onslaught for so long..")
	talk(C_OWNER, "SUCH A WEAK {npc.npcSlave}. CAN'T EVEN TAKE SOME ABUSE.")
	addInfluenceObey(0.5)
	
	if(RNG.chance(50)): #TODO: FIX CHANCE
		saynn("Your owner was about to get up and leave.. but then..")
		talk(C_OWNER, "ALRIGHT. LET'S HAVE SOME FUN.")
		
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
