extends SexActivityBase

func _init():
	id = "ThreeDDDS_Gangbang"
	
	activityName = "Gangbang"
	activityDesc = "Fuck the sub's pussy, ass and mouth with the other 2 doms."
	activityCategory = ["Fuck", "Threesome"]

# DOM_0 = fucks vagina
# DOM_1 = fucks anus
# DOM_2 = fucks mouth
# SUB_0 = gets fucked

func getGoals():
	return {
		SexGoal.FuckVaginal: 1.0,
		SexGoal.StraponVaginal: 1.0,
		SexGoal.FuckAnal: 1.0,
		SexGoal.StraponAnal: 1.0,
	}

func getGoalsFor(_indx:int, _args:Array) -> Dictionary:
	if(_indx == DOM_0):
		return {
			SexGoal.FuckVaginal: 1.0,
			SexGoal.StraponVaginal: 1.0,
		}
	if(_indx == DOM_1):
		return {
			SexGoal.FuckAnal: 1.0,
			SexGoal.StraponAnal: 1.0,
		}
	if(_indx == DOM_2):
		return {
			SexGoal.FuckOral: 1.0,
		}
	return {}

func getSupportedSexTypes():
	return {
		SexType.DefaultSex: true,
		#SexType.StocksSex: true,
		#SexType.SlutwallSex: true,
	}

func isActivityImpossibleShouldStop() -> bool:
	if(!getSub().hasReachableVagina() || !getSub().hasReachableAnus() || getSub().isOralBlocked()):
		return true
	if(!getDom(0).hasReachablePenis() && !getDom(0).isWearingStrapon()):
		return true
	if(!getDom(1).hasReachablePenis() && !getDom(1).isWearingStrapon()):
		return true
	if(!getDom(2).hasReachablePenis() && !getDom(2).isWearingStrapon()):
		return true
	return false

func canStartActivity(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	var sub:BaseCharacter = _subInfo.getChar()
	if(!sub.hasReachableVagina()):
		return false
	if(!sub.hasReachableAnus()):
		return false
	if(sub.isOralBlocked()):
		return false
	
	var dom:BaseCharacter = _domInfo.getChar()
	if(!dom.hasReachablePenis() && !dom.isWearingStrapon()):
		return false
	
	if(!hasDomIDsThatSatisfyConditions(_sexEngine, [COND_HasReachablePenisOrStrapon], 2, [_domInfo.getCharID()])):
		return false
	
	return .canStartActivity(_sexEngine, _domInfo, _subInfo)

func getTags(_indx:int) -> Array:
	if(_indx == DOM_0 || _indx == DOM_1 || _indx == DOM_2):
		if(state != ""):
			return [SexActivityTag.HavingSex, SexActivityTag.PenisUsed, SexActivityTag.PenisInside]
		return [SexActivityTag.HavingSex, SexActivityTag.PenisUsed]
	if(_indx == SUB_0):
		if(state != ""):
			return [SexActivityTag.HavingSex, SexActivityTag.AnusUsed, SexActivityTag.AnusPenetrated, SexActivityTag.VaginaUsed, SexActivityTag.VaginaPenetrated, SexActivityTag.MouthUsed]
		return [SexActivityTag.HavingSex, SexActivityTag.AnusUsed, SexActivityTag.VaginaUsed]
	return []

func isAllowedAsRole(_sexEngine, _indx:int, _sexInfo:SexInfoBase, skipTagsCheck:bool, _args:Array) -> bool:
	var theChar:BaseCharacter = _sexInfo.getChar()
	
	if(_indx == DOM_0 || _indx == DOM_1 || _indx == DOM_2):
		if(!theChar.hasReachablePenis() && !theChar.isWearingStrapon()):
			return false
		if(!skipTagsCheck && hasAnyTag(_sexEngine, _sexInfo, [SexActivityTag.HavingSex, SexActivityTag.PenisUsed])):
			return false
		return true
	
	if(_indx == SUB_0):
		if(!theChar.hasReachableVagina()):
			return false
		if(!theChar.hasReachableAnus()):
			return false
		if(theChar.isOralBlocked()):
			return false
		if(!skipTagsCheck && hasAnyTag(_sexEngine, _sexInfo, [SexActivityTag.HavingSex, SexActivityTag.VaginaUsed, SexActivityTag.AnusUsed])):
			return false
		return true
	
	return false

func startActivity(_args):
	var theDomIDs:Array = getDomIDsThatSatisfyConditions(getSexEngine(), [COND_HasReachablePenisOrStrapon], 2, [getDomInfo().getCharID()])
	pullInDom(theDomIDs[0])
	pullInDom(theDomIDs[1])
	
	addText("{dom.You}, {dom1.you} and {dom2.you} grab {sub.you} and prepare for a gangbang, "+getYour()+" "+getCocksName()+" are pressed against all {sub.yourHis} holes at once!")

func onSwitchFrom(_otherActivity, _args):
	pass
	
func getYour(pcIsInvolvedText:String = "your", noPcText:String = "their") -> String:
	if(isDom("pc")):
		return pcIsInvolvedText
	return noPcText

func getCocksName(justCocks:String = "", mixCocks:String = "", justStrapons:String = "") -> String:
	var cocksName:String = justCocks if justCocks != "" else RNG.pick(["cocks", "dicks"])
	if(isStrapon(DOM_0) && isStrapon(DOM_1) && isStrapon(DOM_2)):
		cocksName = justStrapons if justStrapons != "" else RNG.pick(["rubber cocks", "rubber dicks", "strapons", "rubber shafts", "rubber toys"])
	elif(isStrapon(DOM_0) || isStrapon(DOM_1) || isStrapon(DOM_2)):
		cocksName = mixCocks if mixCocks != "" else RNG.pick(["shafts"])
	return cocksName

func processTurn():
	return

func inside_processTurn():
	cockWarmer(SUB_0, DOM_0, S_VAGINA)
	cockWarmer(SUB_0, DOM_1, S_VAGINA)

func sex_processTurn():
	stimulate(DOM_0, S_PENIS, SUB_0, S_VAGINA, I_NORMAL, Fetish.VaginalSexGiving)
	stimulate(DOM_1, S_PENIS, SUB_0, S_ANUS, I_NORMAL, Fetish.AnalSexGiving)
	stimulate(SUB_0, S_MOUTH, DOM_2, S_PENIS, I_NORMAL, Fetish.OralSexGiving)
	
	doProcessFuck(DOM_0, SUB_0, S_VAGINA, " during a whole-blown gangbang")
	doProcessFuck(DOM_1, SUB_0, S_ANUS)
	doProcessFuck(DOM_2, SUB_0, S_MOUTH)
	
	if(RNG.chance(30) && isCloseToCumming(DOM_0) && isCloseToCumming(DOM_1) && isCloseToCumming(DOM_2)):
		addTextPick([
			"All of the doms are getting close.",
			"All of "+("you" if isDom("pc") else "them")+" are about to cum!",
		])
	else:
		doProcessFuckExtra(DOM_0, SUB_0, S_VAGINA)
		doProcessFuckExtra(DOM_1, SUB_0, S_ANUS)

func getHoleFor(_indx:int) -> String:
	if(_indx == DOM_0):
		return S_VAGINA
	if(_indx == DOM_1):
		return S_ANUS
	if(_indx == DOM_2):
		return S_MOUTH
	assert(false, "Bad _indx")
	return S_VAGINA

func getActions(_indx:int):
	if(_indx == DOM_0 || _indx == DOM_1 || _indx == DOM_2):
		addAction("stop", getStopScore(), "Stop Gangbang", "Stop the gangbang")
		
		if(state == "inside" && !checkActiveDomPC(_indx)):
			addAction("fuckMore", getContinueSexScore(_indx, SUB_0, getHoleFor(_indx))-getStopScore(), "Continue fucking", "Start fucking them again")
			addAction("pullOut", getStopScore(), "Pull out", "Pull your member out")
		
		if(state == ""):
			addAction("rub", 1.0 if !isReadyToPenetrate(_indx) else 0.4, "Rub", "Rub your cock against them")
			if(isReadyToFuck(DOM_0) && isReadyToFuck(DOM_1) && isReadyToFuck(DOM_2) && hasBodypartUncovered(SUB_0, S_VAGINA) && hasBodypartUncovered(SUB_0, S_ANUS) && !getSub().isOralBlocked() && !checkActiveDomPC(_indx)):
				addAction("penetrate", 1.0, "Penetrate", "Try to start fucking them!")
			addAction("switch", 0.0, "Switch positions", "Switch positions with the dom")
		if(state == "sex" && !checkActiveDomPC(_indx)):
			addAction("pause", getPauseSexScore(_indx, SUB_0, getHoleFor(_indx)), "Slow down", "Pause the fucking")
		if(state == "sex" && (isReadyToCumHandled(DOM_0) || isStrapon(DOM_0)) && (isReadyToCumHandled(DOM_1) || isStrapon(DOM_1)) && (isReadyToCumHandled(DOM_2) || isStrapon(DOM_2))):
			if(!isStrapon(_indx) && !checkActiveDomPC(_indx)):
				addAction("cum", 1.0, "Cum inside", "Cum inside them!", {A_PRIORITY: 1001})
		elif(state == "sex" && isReadyToCumHandled(SUB_0) && !canDoActions(SUB_0) && !checkActiveDomPC(_indx)):
			addAction("subcum", 1.0, "Sub orgasm!", "They are about to cum!", {A_PRIORITY: 1001})
		elif(state == "sex" && isStrapon(_indx) && isReadyToCumHandled(_indx)):
			addAction("domcumstrapon", 1.0, "Cum!", "You're about to cum", {A_PRIORITY: 1001})
		
	if(_indx == SUB_0):
		addAction("pullaway", getSubInfo().getResistScore(), "Pull away", "Try to pull away", {A_CHANCE: getSubResistChance(30.0, 25.0)})
		if(state == "sex"):
			if(isReadyToCumHandled(SUB_0)):
				addAction("subcum", 1.0, "Cum!", "You're about to cum!", {A_PRIORITY: 1001})
func doAction(_indx:int, _id:String, _action:Dictionary):
	if(_id == "switch"):
		addText("{<DOM>.You} {<DOM>.youVerb('decide')} to switch spots.".replace("<DOM>", indxToTextID(_indx)))
		switchDoms(_indx, (_indx + 1) if _indx < 2 else 0)
	if(_id == "cum"):
		stimulate(DOM_0, S_PENIS, SUB_0, S_VAGINA, I_NORMAL, Fetish.VaginalSexGiving)
		stimulate(DOM_0, S_PENIS, SUB_0, S_ANUS, I_NORMAL, Fetish.AnalSexGiving)
		var orgAmount:int = 0
		if(isReadyToCumHandled(DOM_0) && !isStrapon(DOM_0)):
			orgAmount += 1
		if(isReadyToCumHandled(DOM_1) && !isStrapon(DOM_1)):
			orgAmount += 1
		if(isReadyToCumHandled(DOM_2) && !isStrapon(DOM_2)):
			orgAmount += 1
		if(isReadyToCumHandled(SUB_0)):
			orgAmount += 1
			
		if(orgAmount == 2):
			addText("[b]Double orgasm![/b]")
		elif(orgAmount == 3):
			addText("[b]Triple orgasm![/b]")
		elif(orgAmount == 4):
			addText("[b]Quadruple orgasm![/b]")
		if(isReadyToCumHandled(SUB_0)):
			cumGeneric(SUB_0, DOM_0)
		if(isReadyToCumHandled(DOM_0) && !isStrapon(DOM_0)):
			cumInside(DOM_0, SUB_0, S_VAGINA)
			#doProcessCumInside(DOM_0, SUB_0, usedBodypart, false)
		if(isReadyToCumHandled(DOM_1) && !isStrapon(DOM_1)):
			cumInside(DOM_1, SUB_0, S_ANUS)
		if(isReadyToCumHandled(DOM_2) && !isStrapon(DOM_2)):
			cumInside(DOM_2, SUB_0, S_MOUTH)
		satisfyGoals()
		state = "inside"
		return
	if(_id == "fuckMore"):
		addText("The doms start fucking {sub.you} again!")
		state = "sex"
		return
	if(_id == "pause"):
		addTextTopBottom("{<TOP>.You} {<TOP>.youVerb('pause')} the gangbang.", _indx, SUB_0)
		state = "inside"
		return
	if(_id == "pullOut"):
		addText(getYour("You pull your ", "The doms pull their ")+getCocksName()+" out.")
		state = ""
		return
	if(_id == "rub"):
		addText(getYour("You rub your ", "The doms rub their ")+getCocksName()+" against {sub.your} holes.")
		stimulate(DOM_0, S_PENIS, SUB_0, S_VAGINA, I_TEASE, Fetish.VaginalSexGiving)
		stimulate(DOM_1, S_PENIS, SUB_0, S_ANUS, I_TEASE, Fetish.AnalSexGiving)
		stimulate(DOM_2, S_PENIS, SUB_0, S_MOUTH, I_TEASE, Fetish.OralSexGiving)
		return
	if(_id == "penetrate"):
		if(tryPenetrate(DOM_0, SUB_0, S_VAGINA)):
			penetration(true, DOM_1, SUB_0, S_ANUS)
			addText("{dom1.You} {dom1.youVerb('force')} {dom1.yourHis} {dom1.penisShort} down {sub.yourHis} ass.")
			addText("{dom2.You} {dom2.youVerb('follow')}, forcing {dom2.yourHis} {dom2.penisShort} down {sub.yourHis} throat.")
			state = "sex"
		else:
			penetration(false, DOM_1, SUB_0, S_ANUS)
			addText("{dom1.You} {dom1.youVerb('try', 'tries')} to stretch {sub.yourHis} ass with {dom1.yourHis} {dom1.penisShort}.")
		return
	if(_id == "stop"):
		endActivity()
		addText("The doms pull away from {sub.you}.")
		return 
	if(_id == "domcumstrapon"):
		cumGeneric(_indx, _indx)
		return

	if(_id == "pullaway"):
		var successChance:float = getSubResistChance(30.0, 25.0)
		if(RNG.chance(successChance)):
			addText("{sub.You} {sub.youVerb('pull')} away from {dom.you}.")
			getDomInfo().addAnger(0.3)
			getDomInfo(1).addAnger(0.3)
			getDomInfo(2).addAnger(0.3)
			if(getState() != ""):
				setState("")
			else:
				endActivity()
			return
		else:
			addText("{sub.You} {sub.youVerb('try', 'tries')} to pull away from {dom.you} but {sub.youVerb('fail')}.")
			getDomInfo().addAnger(0.1)
			getDomInfo(1).addAnger(0.1)
			getDomInfo(2).addAnger(0.1)
			return
	if(_id == "subcum"):
		cumGeneric(SUB_0, DOM_0)
		
		var shouldGoals:bool = false
		if(isStrapon(DOM_0)):
			cumInside(DOM_0, SUB_0, S_VAGINA)
			shouldGoals = true
		if(isStrapon(DOM_1)):
			cumInside(DOM_1, SUB_0, S_ANUS)
			shouldGoals = true
		if(isStrapon(DOM_2)):
			cumInside(DOM_2, SUB_0, S_MOUTH)
			shouldGoals = true
		if(shouldGoals):
			satisfyGoals()
		return
			
func getSubResistChance(baseChance:float, domAngerRemoval:float) -> float:
	var theChance = baseChance - getDomInfo().getAngerScore()*domAngerRemoval
	if(getSub().hasBlockedHands()):
		theChance *= 0.5
	if(getSub().hasBoundArms()):
		theChance *= 0.5
	if(getSub().isBlindfolded()):
		theChance *= 0.8
	
	return max(theChance, 5.0)

func getAnimation():
	if(state == "inside"):
		return [StageScene.SexGangbang, "inside", {pc=SUB_0, npc=DOM_1, npc2=DOM_0, npc3=DOM_2, npcBodyState={hard=true}, npc2BodyState={hard=true}, npc3BodyState={hard=true}}]
	if(state == "sex"):
		if((isCloseToCumming(DOM_0) && isCloseToCumming(DOM_1) && isCloseToCumming(DOM_2)) || (isStrapon(DOM_0) && isStrapon(DOM_1) && isStrapon(DOM_2) && isCloseToCumming(SUB_0))):
			return [StageScene.SexGangbang, "fast", {pc=SUB_0, npc=DOM_1, npc2=DOM_0, npc3=DOM_2, npcBodyState={hard=true}, npc2BodyState={hard=true}, npc3BodyState={hard=true}}]
		return [StageScene.SexGangbang, "sex", {pc=SUB_0, npc=DOM_1, npc2=DOM_0, npc3=DOM_2, npcBodyState={hard=true}, npc2BodyState={hard=true}, npc3BodyState={hard=true}}]
	return [StageScene.SexGangbang, "tease", {pc=SUB_0, npc=DOM_1, npc2=DOM_0, npc3=DOM_2}]
	#return [StageScene.Duo, "stand", {pc=SUB_0, npc=DOM_0, npcAction="stand"}]

func getAnimationPriority():
	return 10

func getOrgasmHandlePriority(_indx:int) -> int:
	return 10

func saveData():
	var data = .saveData()
	
	#data["tick"] = tick

	return data
	
func loadData(data):
	.loadData(data)
	
	#tick = SAVE.loadVar(data, "tick", 0)
