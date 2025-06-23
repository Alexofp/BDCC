extends SexActivityBase

var usedBodypart:String = S_VAGINA
var usedFetish:String = Fetish.VaginalSexGiving

func _init():
	id = "ThreeDDS_RideGrind"
	
	activityName = "Ride and grind"
	activityDesc = ""
	activityCategory = ["Fuck", "Threesome"]

# DOM_0 = rides sub's penis with vagina
# DOM_1 = grinds sub's face
# SUB_0 = fucks DOM_0

func getGoals():
	return {
		SexGoal.ReceiveVaginal: 1.0,
		SexGoal.ReceiveStraponVaginal: 1.0,
		SexGoal.ReceiveAnal: 1.0,
		SexGoal.ReceiveStraponAnal: 1.0,
		SexGoal.FuckOral: 1.0,
	}

func getGoalsFor(_indx:int, _args:Array) -> Dictionary:
	if(_indx == DOM_0):
		return {
			SexGoal.ReceiveVaginal: 1.0,
			SexGoal.ReceiveStraponVaginal: 1.0,
			SexGoal.ReceiveAnal: 1.0,
			SexGoal.ReceiveStraponAnal: 1.0,
		}
	if(_indx == DOM_1):
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

func canStartActivity(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	return false # Can only be started through the join actions of riding or sex

func getTags(_indx:int) -> Array:
	if(_indx == DOM_0):
		if(state != ""):
			return [SexActivityTag.HavingSex, SexActivityTag.VaginaUsed if usedBodypart == S_VAGINA else SexActivityTag.AnusUsed, SexActivityTag.VaginaPenetrated if usedBodypart == S_VAGINA else SexActivityTag.AnusPenetrated]
		return [SexActivityTag.HavingSex, SexActivityTag.VaginaUsed if usedBodypart == S_VAGINA else SexActivityTag.AnusUsed]
	if(_indx == DOM_1):
		if(state != ""):
			return [SexActivityTag.HavingSex, SexActivityTag.VaginaUsed]
		return [SexActivityTag.HavingSex, SexActivityTag.VaginaUsed]
	if(_indx == SUB_0):
		if(state != ""):
			return [SexActivityTag.HavingSex, SexActivityTag.PenisUsed, SexActivityTag.PenisInside, SexActivityTag.MouthUsed]
		return [SexActivityTag.HavingSex, SexActivityTag.PenisUsed]
	return []

func isActivityImpossibleShouldStop() -> bool:
	if(!getSub().hasReachablePenis() && !getSub().isWearingStrapon()):
		return true
	if(usedBodypart == S_VAGINA && !getDom(0).hasReachableVagina()):
		return true
	if(usedBodypart == S_ANUS && !getDom(0).hasReachableAnus()):
		return true
	if(!getDom(1).hasReachableVagina()):
		return true
	return false

func isAllowedAsRole(_sexEngine, _indx:int, _sexInfo:SexInfoBase, skipTagsCheck:bool, _args:Array) -> bool:
	var _usedBodypart:String = _args[0]
	var theChar:BaseCharacter = _sexInfo.getChar()
	
	if(_indx == DOM_0):
		if(_usedBodypart == S_VAGINA && !theChar.hasReachableVagina()):
			return false
		if(_usedBodypart == S_ANUS && !theChar.hasReachableAnus()):
			return false
		if(!skipTagsCheck && hasAnyTag(_sexEngine, _sexInfo, [SexActivityTag.HavingSex, SexActivityTag.VaginaUsed if _usedBodypart == S_VAGINA else SexActivityTag.AnusUsed, SexActivityTag.VaginaPenetrated if _usedBodypart == S_VAGINA else SexActivityTag.AnusPenetrated])):
			return false
		return true
	
	if(_indx == DOM_1):
		if(!theChar.hasReachableVagina()):
			return false
		if(!skipTagsCheck && hasAnyTag(_sexEngine, _sexInfo, [SexActivityTag.HavingSex, SexActivityTag.VaginaUsed])):
			return false
		return true
	
	if(_indx == SUB_0):
		if(!theChar.hasReachablePenis() && !theChar.isWearingStrapon()):
			return false
		if(!skipTagsCheck && hasAnyTag(_sexEngine, _sexInfo, [SexActivityTag.HavingSex, SexActivityTag.PenisUsed, SexActivityTag.PenisInside, SexActivityTag.MouthUsed])):
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
	#usedBodypart2 = _args[1]
	#usedFetish2 = Fetish.VaginalSexGiving if usedBodypart2 == S_VAGINA else Fetish.AnalSexGiving
	pullInDom(_args[1])
	
	addText("{dom1.You} {dom1.youVerb('join')} in on the fun and {dom1.youVerb('bring')} {dom1.yourHis} "+getNameHole(DOM_1, S_VAGINA)+" to {sub.your} face!")
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
	stimulate(SUB_0, S_PENIS, DOM_0, usedBodypart, I_TEASE, usedFetish)
	stimulate(SUB_0, S_MOUTH, DOM_1, S_VAGINA, I_TEASE, Fetish.OralSexGiving)
	
	addText("{dom.You} {dom.youAre} being a cock-warmer for {sub.your} {sub.penisShort}.")
	addText("{dom1.You} {dom1.youAre} sitting on {sub.your} face.")
	#addText("At the same time, {dom1.You} {dom1.youAre} being a cock-warmer for {sub.your} {sub.penisShort}.")

func sex_processTurn():
	stimulate(SUB_0, S_PENIS, DOM_0, usedBodypart, I_NORMAL, usedFetish)
	stimulate(SUB_0, S_MOUTH, DOM_1, S_VAGINA, I_NORMAL, Fetish.OralSexGiving)
	
	doProcessPussyGrind(DOM_1, SUB_0)
	doProcessRide(DOM_0, SUB_0, usedBodypart)
	
	if(RNG.chance(30) && isCloseToCumming(DOM_0) && isCloseToCumming(DOM_1)):
		addTextPick([
			"Both of the doms are getting close.",
			"Both of "+("you" if isDom("pc") else "them")+" are about to cum!",
		])
	else:
		doProcessRideExtra(SUB_0, DOM_0, usedBodypart)
	react(SexReaction.ThreesomeRideGrind, [10.0, 10.0, 10.0], [DOM_0, SUB_0, DOM_1])

func getActions(_indx:int):
	if(_indx == DOM_0 || _indx == DOM_1):
		var isDom0:bool = (_indx == DOM_0)
		addAction("stop", getStopScore(), "Stop ride&grind", "Stop the threesome")
		
		if(state == "inside" && !checkActiveDomPC(_indx)):
			var fuckMoreScore:float = 0.0
			if(isDom0):
				fuckMoreScore = getContinueSexScore(_indx, SUB_0, S_PENIS, usedBodypart)-getStopScore()
			else:
				fuckMoreScore = getContinueSexScore(_indx, SUB_0, S_MOUTH, S_VAGINA)-getStopScore()
			addAction("fuckMore", fuckMoreScore, "Continue fucking", "Continue the sex train!")
			addAction("pullOut", getStopScore(), "Pull out", "Pull away from the sub's cock." if _indx == DOM_0 else "Pull away from the sub's mouth.")
		
		if(state == ""):
			addAction("rub", 1.0 if !isReadyToPenetrate(_indx) else 0.4, "Rub", "Rub your cock against them" if isDom0 else "Rub yourself against their cock")
			if(isReadyToFuck(SUB_0) && !checkActiveDomPC(_indx) && hasBodypartUncovered(DOM_0, usedBodypart)):
				addAction("penetrate", 1.0, "Envelop cock" if isDom0 else ("Grind"), "Try to start fucking them!" if isDom0 else ("Try to get the action going"))
			if(getDom(0).hasReachableVagina() && ((usedBodypart == S_VAGINA && getDom(1).hasReachableVagina()) || (usedBodypart == S_ANUS && getDom(1).hasReachableAnus()))):
				addAction("switch", 0.0, "Switch positions", "Switch positions with the dom")
		if(state == "sex" && !checkActiveDomPC(_indx)):
			var pauseScore:float = 0.0
			if(isDom0):
				pauseScore = getPauseSexScore(_indx, SUB_0, S_PENIS, usedBodypart)
			else:
				pauseScore = getPauseSexScore(_indx, SUB_0, S_MOUTH, S_VAGINA)
			addAction("pause", pauseScore, "Slow down", "Pause the fucking")
		#if(state == "sex" && (isReadyToCumHandled(DOM_0) || isStrapon(DOM_0)) && (isReadyToCumHandled(SUB_0) || isStrapon(SUB_0))):
		#	if(!isStrapon(_indx if isDom0 else SUB_0) && !checkActiveDomPC(_indx)):
		#		addAction("cum", 1.0, "Cum inside", "Cum inside them!" if isDom0 else "Let the sub cum inside you!", {A_PRIORITY: 1001})
		if(state == "sex" && isReadyToCumHandled(SUB_0) && !checkActiveDomPC(_indx)):
			addAction("subcum", 1.0, "Sub orgasm!", "They are about to cum!", {A_PRIORITY: 1001})
		elif(state == "sex" && isReadyToCumHandled(_indx)):
			addAction("domcum", 1.0, "Cum!", "You're about to cum", {A_PRIORITY: 1001})
		
	if(_indx == SUB_0):
		addAction("pullaway", getResistScore(SUB_0), "Pull away", "Try to pull away", {A_CHANCE: getSubResistChance(30.0, 25.0)})
		#if(state == "sex"):
		#	if(isReadyToCumHandled(SUB_0)):
		#		addAction("subcum", 1.0, "Cum!", "You're about to cum!", {A_PRIORITY: 1001})
func doAction(_indx:int, _id:String, _action:Dictionary):
	if(_id == "switch"):
		addText("{<DOM>.You} {<DOM>.youVerb('decide')} to switch spots.".replace("<DOM>", indxToTextID(_indx)))
		switchDoms(0, 1)
#	if(_id == "cum"):
#		stimulate(DOM_0, S_PENIS, SUB_0, usedBodypart, I_HIGH, usedFetish)
#		stimulate(SUB_0, S_PENIS, DOM_1, usedBodypart2, I_HIGH, usedFetish2)
#		var orgAmount:int = 0
#		if(isReadyToCumHandled(DOM_0) && !isStrapon(DOM_0)):
#			orgAmount += 1
#		if(isReadyToCumHandled(DOM_1)):
#			orgAmount += 1
#		if(isReadyToCumHandled(SUB_0) && !isStrapon(SUB_0)):
#			orgAmount += 1
#
#		if(orgAmount == 2):
#			addText("[b]Double orgasm![/b]")
#		elif(orgAmount == 3):
#			addText("[b]Triple orgasm![/b]")
#		if(isReadyToCumHandled(DOM_1)):
#			cumGeneric(DOM_1, DOM_1)
#		if(isReadyToCumHandled(DOM_0) && !isStrapon(DOM_0)):
#			cumInside(DOM_0, SUB_0, usedBodypart)
#			#doProcessCumInside(DOM_0, SUB_0, usedBodypart, false)
#		if(isReadyToCumHandled(SUB_0) && !isStrapon(SUB_0)):
#			cumInside(SUB_0, DOM_1, usedBodypart2)
#			#getDomInfo(1).cum()
#		satisfyGoals()
#		state = "inside"
#		return
	if(_id == "fuckMore"):
		addText("The doms start riding and grinding {sub.your} face again!")
		state = "sex"
		return
	if(_id == "pause"):
		addTextTopBottom("{<TOP>.You} {<TOP>.youVerb('pause')} the sex.", _indx, SUB_0)
		state = "inside"
		return
	if(_id == "pullOut"):
		addText("The doms pull up from {sub.your} {sub.penisShort} and away from {sub.yourHis} face.")
		state = ""
		return
	if(_id == "rub"):
		#addText("{dom.You} {dom.youVerb('rub')} {dom.yourHis} {dom.penisShort} against {sub.your} "+getNameHole(SUB_0, usedBodypart)+".")
		addText("{dom.You} {dom.youVerb('rub')} {dom.yourHis} "+getNameHole(DOM_0, usedBodypart)+" against {sub.your} {sub.penisShort}.")
		addText("{dom1.You} gently {dom1.youVerb('grind')} {dom1.yourHis} "+getNameHole(DOM_1, S_VAGINA)+" against {sub.your} face.")
		stimulate(SUB_0, S_PENIS, DOM_0, usedBodypart, I_TEASE, usedFetish)
		stimulate(SUB_0, S_MOUTH, DOM_1, S_VAGINA, I_TEASE, Fetish.OralSexGiving)
		return
	if(_id == "penetrate"):
		if(tryPenetrate(SUB_0, DOM_0, usedBodypart)):
			stimulate(SUB_0, S_MOUTH, DOM_1, S_VAGINA, I_TEASE, Fetish.OralSexGiving)
			#penetration(true, SUB_0, DOM_1, usedBodypart2)
			addText("At the same time, {dom1.you} {dom1.youVerb('lower')} {dom1.yourHis} "+getNameHole(DOM_1, S_VAGINA)+" onto {sub.yourHis} face.")
			state = "sex"
		else:
			stimulate(SUB_0, S_MOUTH, DOM_1, S_VAGINA, I_TEASE, Fetish.OralSexGiving)
			#penetration(false, SUB_0, DOM_1, usedBodypart2)
			#addText("{dom.You} {dom.youVerb('try', 'tries')} to envelop {sub.yourHis} {sub.penisShort} with {dom.yourHis} "+getNameHole(DOM_0, usedBodypart)+".")
			pass
		return
	if(_id == "stop"):
		endActivity()
		addText("{dom.You} and {dom1.you} pull away from {sub.you}.")
		return 
	if(_id == "domcum"):
		cumGeneric(_indx, _indx)
		if(_indx == DOM_0 && isStrapon(SUB_0)):
			cumInside(SUB_0, DOM_0, usedBodypart, {isRiding=true})
		if(isStrapon(SUB_0)):
			satisfyGoals()
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
		stimulate(SUB_0, S_PENIS, DOM_0, usedBodypart, I_HIGH, usedFetish)
		stimulate(SUB_0, S_MOUTH, DOM_1, S_VAGINA, I_HIGH, Fetish.OralSexGiving)
		var orgAmount:int = 1
		if(isReadyToCumHandled(DOM_0)):
			orgAmount += 1
		if(isReadyToCumHandled(DOM_1)):
			orgAmount += 1

		if(orgAmount == 2):
			addText("[b]Double orgasm![/b]")
		elif(orgAmount == 3):
			addText("[b]Triple orgasm![/b]")
		
		if(getSub().hasReachablePenis()):
			cumInside(SUB_0, DOM_0, usedBodypart, {isRiding=true})
			satisfyGoals()
		else:
			cumGeneric(SUB_0, DOM_0)
			if(orgAmount > 1):
				satisfyGoals()
		
		if(isReadyToCumHandled(DOM_1)):
			cumGeneric(DOM_1, DOM_1)
		if(isReadyToCumHandled(DOM_0)):
			cumGeneric(DOM_0, DOM_0)
			if(isStrapon(SUB_0)):
				cumInside(SUB_0, DOM_0, usedBodypart, {isRiding=true})
		
		state = "inside"
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
		return [StageScene.SexDoubleDown, "inside", {pc=SUB_0, npc=DOM_0, npc2=DOM_1, bodyState={hard=true}}]
	if(state == "sex"):
		if(isCloseToCumming(SUB_0) || isCloseToCumming(DOM_0)):
			return [StageScene.SexDoubleDown, "fast", {pc=SUB_0, npc=DOM_0, npc2=DOM_1, bodyState={hard=true}}]
		return [StageScene.SexDoubleDown, "sex", {pc=SUB_0, npc=DOM_0, npc2=DOM_1, bodyState={hard=true}}]
	return [StageScene.SexDoubleDown, "tease", {pc=SUB_0, npc=DOM_0, npc2=DOM_1}]
	#return [StageScene.Duo, "stand", {pc=SUB_0, npc=DOM_0, npcAction="stand"}]

func getAnimationPriority():
	return 10

func getOrgasmHandlePriority(_indx:int) -> int:
	return 10

func saveData():
	var data = .saveData()
	
	data["usedBodypart"] = usedBodypart

	return data
	
func loadData(data):
	.loadData(data)
	
	usedBodypart = SAVE.loadVar(data, "usedBodypart", S_VAGINA)
	usedFetish = Fetish.VaginalSexGiving if (usedBodypart == S_VAGINA) else Fetish.AnalSexGiving
