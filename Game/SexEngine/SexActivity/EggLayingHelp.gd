extends SexActivityBase

var shouldDoFlopAnim:bool = false
var shouldDoEggAnim:bool = false
var eggTypeOrColor
var shouldDeleteEggs:bool = false

var eggsOut:Array = [] #Array of EggLaid

func _init():
	id = "EggLayingHelp"
	
	activityName = "Egg laying"
	activityDesc = "Help them to lay eggs since they clearly need it!"
	activityCategory = []

func getGoals():
	return {
	}

func getSupportedSexTypes():
	return {
		SexType.DefaultSex: true,
	}

func isActivityImpossibleShouldStop() -> bool:
	#if(getSubInfo().isUnconscious()):
	#	return true
	if(!getSub().menstrualCycle):
		return true
	return false

func canStartActivity(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	if(!_domInfo.getChar().isPlayer()):
		return false
	
	if(!_subInfo.getChar().isReadyToLayEggs()):
		return false
	
	return .canStartActivity(_sexEngine, _domInfo, _subInfo)

func getTags(_indx:int) -> Array:
	if(_indx == DOM_0):
		return [SexActivityTag.HandsUsed, SexActivityTag.HavingSex]
	if(_indx == SUB_0):
		return [SexActivityTag.PreventsSubTeasing, SexActivityTag.VaginaUsed, SexActivityTag.AnusUsed, SexActivityTag.HavingSex]
	return []

func startActivity(_args):
	addText("{dom.You} {dom.youVerb('prepare')} to help {sub.you} lay eggs!")
	#react(SexReaction.AboutToBeatUp)

func onActivityEnd():
	for theEgg in eggsOut:
		theEgg.handleDisposalByNPC()

func processTurn():
	var eggsLeftAm:int = getSub().menstrualCycle.getEggsToBeLaid().size()
	var eggsOutAm:int = eggsOut.size()
	
	if(eggsOutAm > 0):
		if(eggsLeftAm > 0):
			addText("{sub.You} {sub.youHave} laid "+str(eggsOutAm)+" egg"+("s" if eggsOutAm != 1 else "")+". {sub.YouHe} can still lay "+str(eggsLeftAm)+" more egg"+("s" if eggsLeftAm != 1 else "")+".")
		else:
			addText("{sub.You} {sub.youHave} laid "+str(eggsOutAm)+" egg"+("s" if eggsOutAm != 1 else "")+".")
	if(eggsLeftAm <= 0):
		if(getSub().isEggStuffed()):
			addText("There are no eggs left that {sub.you} can lay currently..")
		else:
			addText("There are no eggs left that {sub.you} can lay..")
	

	
func getActions(_indx:int):
	if(_indx == DOM_0):
		addAction("stop", 1.0 if !getSub().isReadyToLayEggs() else 0.0, "Stop helping", "Enough egg laying..")
		
		#if(true || getSub().isReadyToLayEggs()):
		if(hasBodypartUncovered(SUB_0, BodypartSlot.Anus)):
			addAction("egg", 1.0 if getSub().menstrualCycle.isReadyToLayEggsCanContinue() else 0.0, "Help lay", "Help them to lay an egg!", {A_PRIORITY: 5})
		addAction("addegg", 1.0, "ADD EGG", "ADD TEST EGG PLEASE REMOVE ME!", {A_PRIORITY: 3})
		if(!eggsOut.empty()):
			addAction("stealeggs", 0.0, "Steal eggs!", "Steal all of the eggs that they have currently laid", {A_PRIORITY: 4})
		
	if(_indx == SUB_0):
		#var escapeScore:float = 0.0 + getSubInfo().getResistScoreSmooth() * 0.2 - getSubInfo().fetishScore({Fetish.BeingBred: 0.5})
		addAction("escape", getResistScore(SUB_0), "Resist", "Try to resist this", {A_CHANCE: getResistChance(SUB_0, DOM_0, RESIST_LEGS_FOCUS, 20.0, 0.0)})

		if(isReadyToCumHandled(SUB_0)):
			addAction("cum", 1.0, "Cum!", "You're gonna cum.", {A_PRIORITY: 1001})

func doAction(_indx:int, _actionID:String, _action:Dictionary):
	if(_actionID == "addegg"):
		var theMenstrualCycle:MenstrualCycle = getSub().getMenstrualCycle()
		var theTentacleType:int = RNG.pick([BigEggType.Plant, BigEggType.Latex, BigEggType.Fertilized])
		var theEggTime:int = 0
		var theOrifice:int = OrificeType.Vagina
		theMenstrualCycle.addTentacleEgg(getDomID(), theTentacleType, theEggTime, theOrifice)
		addText("EGG ADDED!")
	
	if(_actionID == "stealeggs"):
		shouldDeleteEggs = true
		
		var theAmToSteal:int = eggsOut.size()
		var theListStr:String = EggLaid.generateOneLineList(eggsOut)
		addText("{dom.You} picked up "+theListStr+"!")
		
		if(getDom().isPlayer()):
			for theEgg in eggsOut:
				var theEggItem:ItemBase = theEgg.createItem()
				if(!theEggItem):
					continue
				GM.pc.getInventory().addItem(theEggItem)
		eggsOut.clear()
		# Hey, those are mine!
		getSubInfo().addResistance(1.0)
		react(SexReaction.EggsStolen, [100.0], [SUB_0])
		GM.main.RS.addAffection(getSubID(), getDomID(), -0.02*theAmToSteal)
	
	if(_actionID == "egg"):
		eggTypeOrColor = BigEggType.Plant
		
		if(!getSub().menstrualCycle.isReadyToLayEggsCanContinue()):
			shouldDoFlopAnim = true
			
		var anEgg:EggLaid = getSub().menstrualCycle.laySingleEgg()
		if(!anEgg):
			addText("{sub.You} {sub.youVerb('try', 'tries')} to lay an egg but nothing comes out..")
			moan(SUB_0)
			return
		
		shouldDoEggAnim = true
		
		eggTypeOrColor = anEgg.getEggColorOrType()
		addTextPick([
			"{dom.You} {dom.youVerb('support')} {sub.you} as a "+anEgg.getName()+" slides out of {sub.yourHis} "+getNameHole(SUB_0, anEgg.getBodypart())+", landing softly onto the floor below.",
			"{dom.You} {dom.youVerb('help')} {sub.you}. The "+anEgg.getName()+" emerges slowly, {sub.yourHis} "+getNameHole(SUB_0, anEgg.getBodypart())+" stretching around it before releasing it with a wet pop.",
			"{dom.You} {dom.youVerb('hold')} {sub.you} as {sub.youHe} {sub.youVerb('strain')} {sub.yourHis} "+getNameHole(SUB_0, anEgg.getBodypart())+" muscles. A soft grunt escapes {sub.youHim} as the "+anEgg.getName()+" finally comes out, dropping with a quiet plop.",
		])
		moan(SUB_0)
		
		if(getSub().isReadyToLayEggs()):
			GM.main.RS.addAffection(getSubID(), getDomID(), 0.01)
		else:
			GM.main.RS.addAffection(getSubID(), getDomID(), 0.05)
		
		eggsOut.append(anEgg)
		getSubInfo().addLust(20)
		getSubInfo().addArousal(0.1) # Just a little help
		stimulate(DOM_0, S_HANDS, SUB_0, anEgg.getBodypart(), I_HIGH, Fetish.Breeding, SPEED_MEDIUM)
		
	if(_actionID == "stop"):
		endActivity()
		addText("{dom.You} {dom.youVerb('have', 'has')} stopped helping {sub.you}.")
	
	if(_actionID == "escape"):
		var canEscapeAtAll:bool = true
		if(!eggsOut.empty()):
			canEscapeAtAll = false
		elif(getSub().isReadyToLayEggs()):
			canEscapeAtAll = false
		
		if(canEscapeAtAll && RNG.chance(getResistChance(SUB_0, DOM_0, RESIST_LEGS_FOCUS, 20.0, 0.0))):
			addText("{sub.You} {sub.youVerb('pull')} away from {dom.you}.")
			getDomInfo().addAnger(0.3)
			if(state != ""):
				state = ""
			else:
				endActivity()
		else:
			addTextPick([
				"{sub.You} desperately {sub.youVerb('try', 'tries')} to pull away from {dom.you}.",
			])
			getDomInfo().addAnger(0.03)
		reactSub(SexReaction.Resisting, [50])
		return
	if(_actionID == "cum"):
		getSub().cumOnFloor(getDomID())
		getSubInfo().cum()
		
		#satisfyGoals()
		sendSexEvent(SexEvent.UniqueOrgasm, DOM_0, SUB_0, {orgasmType=UniqueOrgasm.EggLaying})
		addGenericOrgasmText(SUB_0, " during egg-laying")

func getOrgasmHandlePriority(_indx:int) -> int:
	if(_indx == SUB_0):
		return 5
	return -1

func getAnimationPriority():
	return 10

func getAnimation():
	var remShouldDeleteEggs:bool = shouldDeleteEggs
	shouldDeleteEggs = false
	if(shouldDoEggAnim):
		shouldDoEggAnim = false
		return [StageScene.EggLaying, "egg", {pc=SUB_0, npc=DOM_0, eggQueue=[eggTypeOrColor], shouldAutoFlop=shouldDoFlopAnim, deleteEggs=remShouldDeleteEggs}]
	return [StageScene.EggLaying, "idle" if !shouldDoFlopAnim else "after", {pc=SUB_0, npc=DOM_0, shouldAutoFlop=shouldDoFlopAnim, deleteEggs=remShouldDeleteEggs}]

func hasAnimsToPlay() -> bool:
	return true

func saveData():
	var data = .saveData()
	
	var eggData:Array = []
	for theEgg in eggsOut:
		eggData.append(theEgg.saveData())
	
	data["eggsOut"] = eggData

	return data
	
func loadData(data):
	.loadData(data)
	
	eggsOut.clear()
	var eggData:Array = SAVE.loadVar(data, "eggsOut", [])
	for theEggEntry in eggData:
		var theEgg:EggLaid = EggLaid.new()
		theEgg.loadData(theEggEntry)
	
