extends SexActivityBase

var usedBodypart:String = S_VAGINA
var usedFetish:String = Fetish.VaginalSexGiving

func _init():
	id = "ThreeDDS_SpitroastVag"
	
	activityName = "Spitroast (vag)"
	activityDesc = "Fuck the sub's pussy and mouth with the other dom at the same time"
	activityCategory = ["Fuck", "Threesome"]

# DOM_0 = fucks vagina
# DOM_1 = fucks mouth
# SUB_0 = gets fucked

func getGoals():
	return {
		SexGoal.FuckVaginal: 1.0,
		SexGoal.StraponVaginal: 1.0,
	}

func getGoalsFor(_indx:int, _args:Array) -> Dictionary:
	if(_indx == DOM_0):
		return {
			SexGoal.FuckVaginal: 1.0,
			SexGoal.StraponVaginal: 1.0,
		}
	if(_indx == DOM_1):
		return {
			SexGoal.FuckOral: 1.0,
		}
	return {}

func getSupportedSexTypes():
	return {
		SexType.DefaultSex: true,
		SexType.StocksSex: true,
		#SexType.SlutwallSex: true,
	}

func isActivityImpossibleShouldStop() -> bool:
	if(getSub().isOralBlocked()):
		return true
	if(usedBodypart == S_VAGINA && !getSub().hasReachableVagina()):
		return true
	if(usedBodypart == S_ANUS && !getSub().hasReachableAnus()):
		return true
	if(!getDom(0).hasReachablePenis() && !getDom(0).isWearingStrapon()):
		return true
	if(!getDom(1).hasReachablePenis() && !getDom(1).isWearingStrapon()):
		return true
	return false

func canStartActivity(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	var sub:BaseCharacter = _subInfo.getChar()
	if(usedBodypart == S_VAGINA && !sub.hasReachableVagina()):
		return false
	if(usedBodypart == S_ANUS && !sub.hasReachableAnus()):
		return false
	if(sub.isOralBlocked()):
		return false
	
	var dom:BaseCharacter = _domInfo.getChar()
	if(!dom.hasReachablePenis() && !dom.isWearingStrapon()):
		return false
	
	if(!hasDomIDsThatSatisfyConditions(_sexEngine, [COND_HasReachablePenisOrStrapon], 1, [_domInfo.getCharID()])):
		return false
	
	return .canStartActivity(_sexEngine, _domInfo, _subInfo)

func getTags(_indx:int) -> Array:
	if(_indx == DOM_0 || _indx == DOM_1):
		if(state != ""):
			return [SexActivityTag.HavingSex, SexActivityTag.PenisUsed, SexActivityTag.PenisInside]
		return [SexActivityTag.HavingSex, SexActivityTag.PenisUsed]
	if(_indx == SUB_0):
		if(state != ""):
			return [SexActivityTag.HavingSex, SexActivityTag.MouthUsed, SexActivityTag.VaginaUsed if usedBodypart == S_VAGINA else SexActivityTag.AnusUsed, SexActivityTag.VaginaPenetrated if usedBodypart == S_VAGINA else SexActivityTag.AnusPenetrated]
		return [SexActivityTag.HavingSex, SexActivityTag.MouthUsed, SexActivityTag.VaginaUsed if usedBodypart == S_VAGINA else SexActivityTag.AnusUsed]
	return []

func isAllowedAsRole(_sexEngine, _indx:int, _sexInfo:SexInfoBase, skipTagsCheck:bool, _args:Array) -> bool:
	var theChar:BaseCharacter = _sexInfo.getChar()
	
	if(_indx == DOM_0 || _indx == DOM_1):
		if(!theChar.hasReachablePenis() && !theChar.isWearingStrapon()):
			return false
		if(!skipTagsCheck && hasAnyTag(_sexEngine, _sexInfo, [SexActivityTag.HavingSex, SexActivityTag.PenisUsed])):
			return false
		return true
	
	if(_indx == SUB_0):
		if(usedBodypart == S_VAGINA && !theChar.hasReachableVagina()):
			return false
		if(usedBodypart == S_ANUS && !theChar.hasReachableAnus()):
			return false
		if(theChar.isOralBlocked()):
			return false
		if(!skipTagsCheck && hasAnyTag(_sexEngine, _sexInfo, [SexActivityTag.HavingSex, SexActivityTag.MouthUsed, SexActivityTag.VaginaUsed if usedBodypart == S_VAGINA else SexActivityTag.AnusUsed])):
			return false
		return true
	
	return false

func startActivity(_args):
	var otherDomID:String = getDomIDsThatSatisfyConditions(getSexEngine(), [COND_HasReachablePenisOrStrapon], 1, [getDomInfo().getCharID()])[0]
	pullInDom(otherDomID)
	
	if(getSexType() == SexType.StocksSex):
		addText("{dom.You} and {dom1.you} approach {sub.you} from different sides of the stocks, "+getYour()+" "+getCocksName()+" are pressed against {sub.yourHis} "+getNameHole(SUB_0, usedBodypart)+" and mouth.")
	else:
		addText("{dom.You} and {dom1.you} grab {sub.you} and lift {sub.youHim} above the floor, "+getYour()+" "+getCocksName()+" are pressed against {sub.yourHis} "+getNameHole(SUB_0, usedBodypart)+" and mouth.")
	react(SexReaction.ThreesomeStart, [100.0, 100.0, 100.0], [DOM_0, SUB_0, DOM_1])
	
func onSwitchFrom(_otherActivity, _args):
	pullInDom(_args[0])
	
	addText("{dom1.You} {dom1.youVerb('join')} and {dom1.youVerb('turn')} this sex into a spitroast!")
	react(SexReaction.ThreesomeJoin, [100.0, 100.0, 100.0], [DOM_1, SUB_0, DOM_0])
	
func getYour(pcIsInvolvedText:String = "your", noPcText:String = "their") -> String:
	if(isDom("pc")):
		return pcIsInvolvedText
	return noPcText

func getCocksName(justCocks:String = "", mixCocks:String = "", justStrapons:String = "") -> String:
	var cocksName:String = justCocks if justCocks != "" else RNG.pick(["cocks", "dicks"])
	if(isStrapon(DOM_0) && isStrapon(DOM_1)):
		cocksName = justStrapons if justStrapons != "" else RNG.pick(["rubber cocks", "rubber dicks", "strapons", "rubber shafts", "rubber toys"])
	elif(isStrapon(DOM_0) || isStrapon(DOM_1)):
		cocksName = mixCocks if mixCocks != "" else RNG.pick(["shafts"])
	return cocksName

func processTurn():
	return

func inside_processTurn():
	stimulateSex(DOM_0, SUB_0, usedBodypart, I_TEASE)
	stimulateSex(DOM_1, SUB_0, S_MOUTH, I_TEASE)
	
	addText("{sub.You} {sub.youAre} being a cock-warmer for "+getYour()+" "+getCocksName()+".")

func sex_processTurn():
	stimulateSex(DOM_0, SUB_0, usedBodypart, I_NORMAL)
	stimulateSex(DOM_1, SUB_0, S_MOUTH, I_NORMAL)
	
	doProcessFuck(DOM_0, SUB_0, usedBodypart, " in a spitroast position")
	doProcessFuck(DOM_1, SUB_0, S_MOUTH)
	
	if(RNG.chance(30) && isCloseToCumming(DOM_0) && isCloseToCumming(DOM_1)):
		addTextPick([
			"Both of the doms are getting close.",
			"Both of "+("you" if isDom("pc") else "them")+" are about to cum!",
		])
	else:
		doProcessFuckExtra(DOM_0, SUB_0, usedBodypart)
		doProcessFuckExtra(DOM_1, SUB_0, S_MOUTH)
	react(SexReaction.ThreesomeSpitroast, [20.0, 10.0], [RNG.pick([DOM_0, DOM_1]), SUB_0])

func getActions(_indx:int):
	if(_indx == DOM_0 || _indx == DOM_1):
		addAction("stop", getStopScore(), "Stop spitroast", "Stop the spitroast")
		
		if(state == "inside" && !checkActiveDomPC(_indx)):
			addAction("fuckMore", getContinueSexScore(_indx, SUB_0, usedBodypart if _indx == DOM_0 else S_MOUTH)-getStopScore(), "Continue fucking", "Start fucking them again")
			addAction("pullOut", getStopScore(), "Pull out", "Pull your member out")
		
		if(state == ""):
			addAction("rub", 1.0 if !isReadyToPenetrate(_indx) else 0.4, "Rub", "Rub your cock against them")
			if(isReadyToFuck(DOM_0) && isReadyToFuck(DOM_1) && !checkActiveDomPC(_indx) && hasBodypartUncovered(SUB_0, usedBodypart)):
				addAction("penetrate", 1.0, "Penetrate", "Try to start fucking them!")
			addAction("switch", 0.0, "Switch positions", "Switch positions with the dom")
		if(state == "sex" && !checkActiveDomPC(_indx)):
			addAction("pause", getPauseSexScore(_indx, SUB_0, usedBodypart if _indx == DOM_0 else S_MOUTH), "Slow down", "Pause the fucking")
		if(state == "sex" && (isReadyToCumHandled(DOM_0) || isStrapon(DOM_0)) && (isReadyToCumHandled(DOM_1) || isStrapon(DOM_1))):
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
		switchDoms(0, 1)
	if(_id == "cum"):
		stimulate(DOM_0, S_PENIS, SUB_0, usedBodypart, I_HIGH, usedFetish)
		var orgAmount:int = 0
		if(isReadyToCumHandled(DOM_0) && !isStrapon(DOM_0)):
			orgAmount += 1
		if(isReadyToCumHandled(DOM_1) && !isStrapon(DOM_1)):
			orgAmount += 1
		if(isReadyToCumHandled(SUB_0)):
			orgAmount += 1
			
		if(orgAmount == 2):
			addText("[b]Double orgasm![/b]")
		elif(orgAmount == 3):
			addText("[b]Triple orgasm![/b]")
		if(isReadyToCumHandled(SUB_0)):
			cumGeneric(SUB_0, DOM_0)
		if(isReadyToCumHandled(DOM_0) && !isStrapon(DOM_0)):
			cumInside(DOM_0, SUB_0, usedBodypart)
			#doProcessCumInside(DOM_0, SUB_0, usedBodypart, false)
		if(isReadyToCumHandled(DOM_1) && !isStrapon(DOM_1)):
			cumInside(DOM_1, SUB_0, S_MOUTH)
			#getDomInfo(1).cum()
		satisfyGoals()
		state = "inside"
		return
	if(_id == "fuckMore"):
		addText("The doms start fucking {sub.you} again!")
		state = "sex"
		return
	if(_id == "pause"):
		addTextTopBottom("{<TOP>.You} {<TOP>.youVerb('pause')} the spitroasting.", _indx, SUB_0)
		state = "inside"
		return
	if(_id == "pullOut"):
		addText(getYour("You pull your ", "The doms pull their ")+getCocksName()+" out.")
		state = ""
		return
	if(_id == "rub"):
		addText(getYour("You rub your ", "The doms rub their ")+getCocksName()+" against {sub.your} holes.")
		stimulateSex(DOM_0, SUB_0, usedBodypart, I_TEASE)
		stimulateSex(DOM_1, SUB_0, S_MOUTH, I_TEASE)
		return
	if(_id == "penetrate"):
		if(tryPenetrate(DOM_0, SUB_0, usedBodypart)):
			addText("{dom1.You} {dom1.youVerb('follow')}, forcing {dom1.yourHis} {dom1.penisShort} down {sub.yourHis} throat.")
			state = "sex"
		else:
			addText("{dom1.You} {dom1.youVerb('try', 'tries')} to stretch {sub.yourHis} throat with {dom1.yourHis} {dom1.penisShort}.")
		return
	if(_id == "stop"):
		endActivity()
		if(getSexType() == SexType.StocksSex):
			addText("{dom.You} and {dom1.you} pull away from the stocks.")
		else:
			addText("{dom.You} and {dom1.you} lower {sub.you} and then pull away.")
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
			if(getState() != ""):
				setState("")
			else:
				endActivity()
			return
		else:
			addText("{sub.You} {sub.youVerb('try', 'tries')} to pull away from {dom.you} but {sub.youVerb('fail')}.")
			getDomInfo().addAnger(0.1)
			getDomInfo(1).addAnger(0.1)
			return
	if(_id == "subcum"):
		cumGeneric(SUB_0, DOM_0)
		
		var shouldGoals:bool = false
		if(isStrapon(DOM_0)):
			cumInside(DOM_0, SUB_0, usedBodypart)
			shouldGoals = true
		if(isStrapon(DOM_1)):
			cumInside(DOM_1, SUB_0, S_MOUTH)
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
	if(getSexType() == SexType.StocksSex):
		if(state == "inside"):
			return [StageScene.StocksSpitroast, "tease", {pc=SUB_0, npc=DOM_0, npc2=DOM_1, npcBodyState={hard=true}, npc2BodyState={hard=true}}]
		if(state == "sex"):
			if((isCloseToCumming(DOM_0) && isCloseToCumming(DOM_1)) || (isStrapon(DOM_0) && isStrapon(DOM_1) && isCloseToCumming(SUB_0))):
				return [StageScene.StocksSpitroast, "fast", {pc=SUB_0, npc=DOM_0, npc2=DOM_1, npcBodyState={hard=true}, npc2BodyState={hard=true}}]
			return [StageScene.StocksSpitroast, "sex", {pc=SUB_0, npc=DOM_0, npc2=DOM_1, npcBodyState={hard=true}, npc2BodyState={hard=true}}]
		return [StageScene.StocksSpitroast, "tease", {pc=SUB_0, npc=DOM_0, npc2=DOM_1}]
	
	if(state == "inside"):
		return [StageScene.SexSpitroast, "inside", {pc=SUB_0, npc=DOM_0, npc2=DOM_1, npcBodyState={hard=true}, npc2BodyState={hard=true}}]
	if(state == "sex"):
		if((isCloseToCumming(DOM_0) && isCloseToCumming(DOM_1)) || (isStrapon(DOM_0) && isStrapon(DOM_1) && isCloseToCumming(SUB_0))):
			return [StageScene.SexSpitroast, "fast", {pc=SUB_0, npc=DOM_0, npc2=DOM_1, npcBodyState={hard=true}, npc2BodyState={hard=true}}]
		return [StageScene.SexSpitroast, "sex", {pc=SUB_0, npc=DOM_0, npc2=DOM_1, npcBodyState={hard=true}, npc2BodyState={hard=true}}]
	return [StageScene.SexSpitroast, "tease", {pc=SUB_0, npc=DOM_0, npc2=DOM_1}]
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
