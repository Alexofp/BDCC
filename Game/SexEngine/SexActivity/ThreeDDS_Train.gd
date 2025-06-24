extends SexActivityBase

var usedBodypart:String = S_VAGINA
var usedFetish:String = Fetish.VaginalSexGiving
var usedBodypart2:String = S_VAGINA
var usedFetish2:String = Fetish.VaginalSexGiving

func _init():
	id = "ThreeDDS_Train"
	
	activityName = "Train (vag)" #Train (V/V/Bottom)  Train (A/V/Top) Train (A/A/Top)
	activityDesc = "Fuck the sub's pussy while the second dom is getting fucked by the sub's cock. Can switch."
	activityCategory = ["Fuck", "Threesome"]

# DOM_0 = fucks vagina
# DOM_1 = gets fucked
# SUB_0 = gets fucked, fucks DOM_1

func getGoals():
	return {
		SexGoal.FuckVaginal: 1.0,
		SexGoal.StraponVaginal: 1.0,
		SexGoal.ReceiveVaginal: 1.0,
		SexGoal.ReceiveStraponVaginal: 1.0,
		SexGoal.FuckAnal: 1.0,
		SexGoal.StraponAnal: 1.0,
		SexGoal.ReceiveAnal: 1.0,
		SexGoal.ReceiveStraponAnal: 1.0,
	}

func getGoalsFor(_indx:int, _args:Array) -> Dictionary:
	if(_indx == DOM_0):
		return {
			SexGoal.FuckVaginal: 1.0,
			SexGoal.StraponVaginal: 1.0,
			SexGoal.FuckAnal: 1.0,
			SexGoal.StraponAnal: 1.0,
		}
	if(_indx == DOM_1):
		return {
			SexGoal.ReceiveVaginal: 1.0,
			SexGoal.ReceiveStraponVaginal: 1.0,
			SexGoal.ReceiveAnal: 1.0,
			SexGoal.ReceiveStraponAnal: 1.0,
		}
	return {}

func getSupportedSexTypes():
	return {
		SexType.DefaultSex: true,
		#SexType.StocksSex: true,
		#SexType.SlutwallSex: true,
	}

func canStartActivity(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	return false # Can only be started through the join actions of riding or sex

func getTags(_indx:int) -> Array:
	if(_indx == DOM_0):
		if(state != ""):
			return [SexActivityTag.HavingSex, SexActivityTag.PenisUsed, SexActivityTag.PenisInside]
		return [SexActivityTag.HavingSex, SexActivityTag.PenisUsed]
	if(_indx == DOM_1):
		if(state != ""):
			return [SexActivityTag.HavingSex, SexActivityTag.VaginaUsed if usedBodypart2 == S_VAGINA else SexActivityTag.AnusUsed, SexActivityTag.VaginaPenetrated if usedBodypart2 == S_VAGINA else SexActivityTag.AnusPenetrated]
		return [SexActivityTag.HavingSex, SexActivityTag.VaginaUsed if usedBodypart2 == S_VAGINA else SexActivityTag.AnusUsed]
	if(_indx == SUB_0):
		if(state != ""):
			return [SexActivityTag.HavingSex, SexActivityTag.PenisUsed, SexActivityTag.PenisInside, SexActivityTag.VaginaUsed if usedBodypart == S_VAGINA else SexActivityTag.AnusUsed, SexActivityTag.VaginaPenetrated if usedBodypart == S_VAGINA else SexActivityTag.AnusPenetrated]
		return [SexActivityTag.HavingSex, SexActivityTag.PenisUsed, SexActivityTag.VaginaUsed if usedBodypart == S_VAGINA else SexActivityTag.AnusUsed]
	return []

func isActivityImpossibleShouldStop() -> bool:
	if(!getSub().hasReachablePenis() && !getSub().isWearingStrapon()):
		return true
	if(!getDom(0).hasReachablePenis() && !getDom(0).isWearingStrapon()):
		return true
	if(usedBodypart == S_VAGINA && !getSub().hasReachableVagina()):
		return true
	if(usedBodypart == S_ANUS && !getSub().hasReachableAnus()):
		return true
	if(usedBodypart2 == S_VAGINA && !getDom(1).hasReachableVagina()):
		return true
	if(usedBodypart2 == S_ANUS && !getDom(1).hasReachableAnus()):
		return true
	return false

func isAllowedAsRole(_sexEngine, _indx:int, _sexInfo:SexInfoBase, skipTagsCheck:bool, _args:Array) -> bool:
	var _usedBodypart:String = _args[0]
	var _usedBodypart2:String = _args[1]
	var theChar:BaseCharacter = _sexInfo.getChar()
	
	if(_indx == DOM_0):
		if(!theChar.hasReachablePenis() && !theChar.isWearingStrapon()):
			return false
		if(!skipTagsCheck && hasAnyTag(_sexEngine, _sexInfo, [SexActivityTag.HavingSex, SexActivityTag.PenisUsed])):
			return false
		return true
	
	if(_indx == DOM_1):
		if(_usedBodypart2 == S_VAGINA && !theChar.hasReachableVagina()):
			return false
		if(_usedBodypart2 == S_ANUS && !theChar.hasReachableAnus()):
			return false
		if(!skipTagsCheck && hasAnyTag(_sexEngine, _sexInfo, [SexActivityTag.HavingSex, SexActivityTag.VaginaUsed if _usedBodypart2 == S_VAGINA else SexActivityTag.AnusUsed])):
			return false
		return true
	
	if(_indx == SUB_0):
		if(!theChar.hasReachablePenis() && !theChar.isWearingStrapon()):
			return false
		if(_usedBodypart == S_VAGINA && !theChar.hasReachableVagina()):
			return false
		if(_usedBodypart == S_ANUS && !theChar.hasReachableAnus()):
			return false
		if(!skipTagsCheck && hasAnyTag(_sexEngine, _sexInfo, [SexActivityTag.HavingSex, SexActivityTag.PenisUsed, SexActivityTag.VaginaUsed if _usedBodypart == S_VAGINA else SexActivityTag.AnusUsed])):
			return false
		return true
	
	return false

func startActivity(_args):
	assert(false, "This shouldn't be possible")
	#var otherDomID:String = getDomIDsThatSatisfyConditions(getSexEngine(), [COND_HasReachablePenisOrStrapon], 1, [getDomInfo().getCharID()])[0]
	#pullInDom(otherDomID)
	#addText("{dom.You} and {dom1.you} grab {sub.you} and lift {sub.youHim} above the floor, "+getYour()+" "+getCocksName()+" are pressed against {sub.yourHis} "+getNameHole(SUB_0, usedBodypart)+" and mouth.")

func onSwitchFrom(_otherActivity, _args):
	usedBodypart = _args[0]
	usedFetish = Fetish.VaginalSexGiving if usedBodypart == S_VAGINA else Fetish.AnalSexGiving
	usedBodypart2 = _args[1]
	usedFetish2 = Fetish.VaginalSexGiving if usedBodypart2 == S_VAGINA else Fetish.AnalSexGiving
	pullInDom(_args[2])
	
	if(_args.size() > 3 && _args[3]):
		switchDoms(0, 1)
		addText("{dom.You} {dom.youVerb('sandwich', 'sandwiches')} {sub.you} between {dom.youHim} and {dom1.you}, turning this intercourse into a sex train! {dom.You} {dom.youVerb('press', 'presses')} {dom.yourHis} {dom.penisShort} against {sub.your} "+getNameHole(SUB_0, usedBodypart)+"!")
		react(SexReaction.ThreesomeJoin, [100.0, 100.0, 100.0], [DOM_0, SUB_0, DOM_1])
	else:
		addText("{dom1.You} {dom1.youVerb('sandwich', 'sandwiches')} {sub.you} between {dom1.youHim} and {dom.you}, turning this intercourse into a sex train! {dom1.You} {dom1.youVerb('press', 'presses')} {dom1.yourHis} "+getNameHole(DOM_1, usedBodypart2)+" against {sub.your} {sub.penisShort}!")
		react(SexReaction.ThreesomeJoin, [100.0, 100.0, 100.0], [DOM_1, SUB_0, DOM_0])

func getYour(pcIsInvolvedText:String = "your", noPcText:String = "their") -> String:
	if(isDom("pc")):
		return pcIsInvolvedText
	return noPcText
#
#func getCocksName(justCocks:String = "", mixCocks:String = "", justStrapons:String = "") -> String:
#	var cocksName:String = justCocks if justCocks != "" else RNG.pick(["cocks", "dicks"])
#	if(isStrapon(DOM_0) && isStrapon(DOM_1)):
#		cocksName = justStrapons if justStrapons != "" else RNG.pick(["rubber cocks", "rubber dicks", "strapons", "rubber shafts", "rubber toys"])
#	elif(isStrapon(DOM_0) || isStrapon(DOM_1)):
#		cocksName = mixCocks if mixCocks != "" else RNG.pick(["shafts"])
#	return cocksName

func processTurn():
	return

func inside_processTurn():
	stimulateSex(DOM_0, SUB_0, usedBodypart, I_TEASE)
	stimulateSex(SUB_0, DOM_1, usedBodypart2, I_TEASE)
	
	addText("{sub.You} {sub.youAre} being a cock-warmer for {dom.your} {dom.penisShort}.")
	addText("At the same time, {dom1.You} {dom1.youAre} being a cock-warmer for {sub.your} {sub.penisShort}.")

func sex_processTurn():
	stimulateSex(DOM_0, SUB_0, usedBodypart, I_NORMAL)
	stimulateSex(SUB_0, DOM_1, usedBodypart2, I_NORMAL)
	
	doProcessFuck(DOM_0, SUB_0, usedBodypart, " in a train position")
	doProcessFuck(SUB_0, DOM_1, usedBodypart2, " in a train position")
	
#	if(RNG.chance(30) && isCloseToCumming(DOM_0) && isCloseToCumming(DOM_1)):
#		addTextPick([
#			"Both of the doms are getting close.",
#			"Both of "+("you" if isDom("pc") else "them")+" are about to cum!",
#		])
#	else:
	doProcessFuckExtra(DOM_0, SUB_0, usedBodypart)
	doProcessFuckExtra(SUB_0, DOM_1, usedBodypart2)

func getActions(_indx:int):
	if(_indx == DOM_0 || _indx == DOM_1):
		var isDom0:bool = (_indx == DOM_0)
		addAction("stop", getStopScore(), "Stop train", "Stop the sex train")
		
		if(state == "inside" && !checkActiveDomPC(_indx)):
			var fuckMoreScore:float = 0.0
			if(isDom0):
				fuckMoreScore = getContinueSexScore(_indx, SUB_0, usedBodypart)-getStopScore()
			else:
				fuckMoreScore = getContinueSexScore(_indx, SUB_0, S_PENIS, usedBodypart2)-getStopScore()
			addAction("fuckMore", fuckMoreScore, "Continue fucking", "Continue the sex train!")
			addAction("pullOut", getStopScore(), "Pull out", "Pull your member out." if _indx == DOM_0 else "Pull away from the sub's cock.")
		
		if(state == ""):
			addAction("rub", 1.0 if !isReadyToPenetrate(_indx) else 0.4, "Rub", "Rub your cock against them" if isDom0 else "Rub yourself against their cock")
			if(isReadyToFuck(DOM_0) && isReadyToFuck(SUB_0) && !checkActiveDomPC(_indx) && hasBodypartUncovered(DOM_1, usedBodypart2)):
				addAction("penetrate", 1.0, "Penetrate" if isDom0 else ("Envelop cock"), "Try to start fucking them!" if isDom0 else ("Get the sub's cock inside you"))
			#addAction("switch", 0.0, "Switch positions", "Switch positions with the dom")
		if(state == "sex" && !checkActiveDomPC(_indx)):
			var pauseScore:float = 0.0
			if(isDom0):
				pauseScore = getPauseSexScore(_indx, SUB_0, usedBodypart)
			else:
				pauseScore = getPauseSexScore(_indx, SUB_0, S_PENIS, usedBodypart2)
			addAction("pause", pauseScore, "Slow down", "Pause the fucking")
		if(state == "sex" && (isReadyToCumHandled(DOM_0) || isStrapon(DOM_0)) && (isReadyToCumHandled(SUB_0) || isStrapon(SUB_0))):
			if(!isStrapon(_indx if isDom0 else SUB_0) && !checkActiveDomPC(_indx)):
				addAction("cum", 1.0, "Cum inside", "Cum inside them!" if isDom0 else "Let the sub cum inside you!", {A_PRIORITY: 1001})
		#elif(state == "sex" && isReadyToCumHandled(SUB_0) && !canDoActions(SUB_0) && !checkActiveDomPC(_indx)):
		#	addAction("subcum", 1.0, "Sub orgasm!", "They are about to cum!", {A_PRIORITY: 1001})
		elif(state == "sex" && (isStrapon(_indx) || _indx == DOM_1) && isReadyToCumHandled(_indx)):
			addAction("domcumstrapon", 1.0, "Cum!", "You're about to cum", {A_PRIORITY: 1001})
		
	if(_indx == SUB_0):
		addAction("pullaway", getResistScore(SUB_0), "Pull away", "Try to pull away", {A_CHANCE: getSubResistChance(30.0, 25.0)})
		#if(state == "sex"):
		#	if(isReadyToCumHandled(SUB_0)):
		#		addAction("subcum", 1.0, "Cum!", "You're about to cum!", {A_PRIORITY: 1001})
func doAction(_indx:int, _id:String, _action:Dictionary):
	if(_id == "switch"):
		addText("{<DOM>.You} {<DOM>.youVerb('decide')} to switch spots.".replace("<DOM>", indxToTextID(_indx)))
		switchDoms(0, 1)
	if(_id == "cum"):
		stimulate(DOM_0, S_PENIS, SUB_0, usedBodypart, I_HIGH, usedFetish)
		stimulate(SUB_0, S_PENIS, DOM_1, usedBodypart2, I_HIGH, usedFetish2)
		var orgAmount:int = 0
		if(isReadyToCumHandled(DOM_0) && !isStrapon(DOM_0)):
			orgAmount += 1
		if(isReadyToCumHandled(DOM_1)):
			orgAmount += 1
		if(isReadyToCumHandled(SUB_0) && !isStrapon(SUB_0)):
			orgAmount += 1
			
		if(orgAmount == 2):
			addText("[b]Double orgasm![/b]")
		elif(orgAmount == 3):
			addText("[b]Triple orgasm![/b]")
		if(isReadyToCumHandled(DOM_1)):
			cumGeneric(DOM_1, DOM_1)
		if(isReadyToCumHandled(DOM_0) && !isStrapon(DOM_0)):
			cumInside(DOM_0, SUB_0, usedBodypart)
			#doProcessCumInside(DOM_0, SUB_0, usedBodypart, false)
		if(isReadyToCumHandled(SUB_0) && !isStrapon(SUB_0)):
			cumInside(SUB_0, DOM_1, usedBodypart2)
			#getDomInfo(1).cum()
		satisfyGoals()
		state = "inside"
		return
	if(_id == "fuckMore"):
		addText("The doms start fucking {sub.you} again!")
		state = "sex"
		return
	if(_id == "pause"):
		addTextTopBottom("{<TOP>.You} {<TOP>.youVerb('pause')} the sex train.", _indx, SUB_0)
		state = "inside"
		return
	if(_id == "pullOut"):
		addText("The doms pull out from {sub.your} "+getNameHole(SUB_0, usedBodypart)+" and away from {sub.yourHis} {sub.penisShort}.")
		state = ""
		return
	if(_id == "rub"):
		addText("{dom.You} {dom.youVerb('rub')} {dom.yourHis} {dom.penisShort} against {sub.your} "+getNameHole(SUB_0, usedBodypart)+".")
		addText("{dom1.You} {dom1.youVerb('rub')} {dom1.yourHis} "+getNameHole(DOM_1, usedBodypart2)+" against {sub.your} {sub.penisShort}.")
		stimulateSex(DOM_0, SUB_0, usedBodypart, I_TEASE)
		stimulateSex(SUB_0, DOM_1, usedBodypart2, I_TEASE)
		return
	if(_id == "penetrate"):
		if(tryPenetrate(DOM_0, SUB_0, usedBodypart)):
			penetration(true, SUB_0, DOM_1, usedBodypart2)
			addText("At the same time, {dom1.you} {dom1.youVerb('manage')} to envelop {sub.yourHis} {sub.penisShort} with {dom1.yourHis} "+getNameHole(DOM_1, usedBodypart2)+".")
			state = "sex"
		else:
			penetration(false, SUB_0, DOM_1, usedBodypart2)
			addText("{dom1.You} {dom1.youVerb('try', 'tries')} to envelop {sub.yourHis} {sub.penisShort} with {dom1.yourHis} "+getNameHole(DOM_1, usedBodypart2)+".")
		return
	if(_id == "stop"):
		endActivity()
		addText("{dom.You} and {dom1.you} pull away from {sub.you}.")
		return 
	if(_id == "domcumstrapon"):
		cumGeneric(_indx, _indx)
		if(_indx == DOM_1 && isStrapon(SUB_0)):
			cumInside(SUB_0, DOM_1, usedBodypart2)
		return

	if(_id == "pullaway"):
		var successChance:float = getSubResistChance(30.0, 25.0)
		if(RNG.chance(successChance)):
			addText("{sub.You} {sub.youVerb('pull')} away from the doms!")
			getDomInfo().addAnger(0.3)
			getDomInfo(1).addAnger(0.3)
			if(getState() != ""):
				setState("")
			else:
				endActivity()
			return
		else:
			addText("{sub.You} {sub.youVerb('try', 'tries')} to pull away from the doms but {sub.youVerb('fail')}.")
			getDomInfo().addAnger(0.1)
			getDomInfo(1).addAnger(0.1)
			return
	if(_id == "subcum"):
		cumGeneric(SUB_0, DOM_0)
		
		var shouldGoals:bool = false
		if(isStrapon(DOM_0)):
			cumInside(DOM_0, SUB_0, usedBodypart)
			shouldGoals = true
		#if(isStrapon(DOM_1)):
		#	cumInside(DOM_1, SUB_0, S_MOUTH)
		#	shouldGoals = true
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
		return [StageScene.SexTrain, "inside", {pc=SUB_0, npc=DOM_1, npc2=DOM_0, npcBodyState={hard=true}, npc2BodyState={hard=true}}]
	if(state == "sex"):
		if((isCloseToCumming(DOM_0) && isCloseToCumming(SUB_0)) || (isStrapon(DOM_0) && isStrapon(SUB_0) && isCloseToCumming(DOM_1))):
			return [StageScene.SexTrain, "fast", {pc=SUB_0, npc=DOM_1, npc2=DOM_0, npcBodyState={hard=true}, npc2BodyState={hard=true}}]
		return [StageScene.SexTrain, "sex", {pc=SUB_0, npc=DOM_1, npc2=DOM_0, npcBodyState={hard=true}, npc2BodyState={hard=true}}]
	return [StageScene.SexTrain, "tease", {pc=SUB_0, npc=DOM_1, npc2=DOM_0}]
	#return [StageScene.Duo, "stand", {pc=SUB_0, npc=DOM_0, npcAction="stand"}]

func getAnimationPriority():
	return 10

func getOrgasmHandlePriority(_indx:int) -> int:
	return 10

func saveData():
	var data = .saveData()
	
	data["usedBodypart"] = usedBodypart
	data["usedBodypart2"] = usedBodypart2

	return data
	
func loadData(data):
	.loadData(data)
	
	usedBodypart = SAVE.loadVar(data, "usedBodypart", S_VAGINA)
	usedFetish = Fetish.VaginalSexGiving if (usedBodypart == S_VAGINA) else Fetish.AnalSexGiving
	usedBodypart2 = SAVE.loadVar(data, "usedBodypart2", S_VAGINA)
	usedFetish2 = Fetish.VaginalSexGiving if (usedBodypart2 == S_VAGINA) else Fetish.AnalSexGiving
