extends SexActivityBase

func _init():
	id = "ThreeDDS_Spitroast"
	
	activityName = "Spitroast (vag)"
	activityDesc = "Fuck the sub's pussy and mouth with the other dom at the same time"
	activityCategory = ["Fuck", "Threesome"]

# DOM_0 = fucks vagina
# DOM_1 = fucks mouth
# SUB_0 = gets fucked

func getGoals():
	return {
		#SexGoal.SubUndressSub: 1.0,
	}

func getSupportedSexTypes():
	return {
		SexType.DefaultSex: true,
		#SexType.StocksSex: true,
		#SexType.SlutwallSex: true,
	}

func canStartActivity(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	var sub:BaseCharacter = _subInfo.getChar()
	if(!sub.hasReachableVagina()):
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
			return [SexActivityTag.HavingSex, SexActivityTag.MouthUsed, SexActivityTag.VaginaUsed, SexActivityTag.VaginaPenetrated]
		return [SexActivityTag.HavingSex, SexActivityTag.MouthUsed, SexActivityTag.VaginaUsed]
	return []

func startActivity(_args):
	addText("Spitroast start.")
	
	var otherDomID:String = getDomIDsThatSatisfyConditions(getSexEngine(), [COND_HasReachablePenisOrStrapon], 1, [getDomInfo().getCharID()])[0]
	pullInDom(otherDomID)

func processTurn():
	return

func inside_processTurn():
	stimulate(DOM_0, S_PENIS, SUB_0, S_VAGINA, I_TEASE, Fetish.VaginalSexGiving)
	stimulate(DOM_1, S_PENIS, SUB_0, S_MOUTH, I_TEASE, Fetish.OralSexReceiving)
	
	addText("{sub.You} {sub.youAre} being a cock-warmer.")

func sex_processTurn():
	stimulate(DOM_0, S_PENIS, SUB_0, S_VAGINA, I_NORMAL, Fetish.VaginalSexGiving)
	stimulate(DOM_1, S_PENIS, SUB_0, S_MOUTH, I_NORMAL, Fetish.OralSexReceiving)
	
	addText("{sub.You} {sub.youAre} being fucked.")

func getActions(_indx:int):
	if(_indx == DOM_0 || _indx == DOM_1):
		addAction("stop", getStopScore(), "Stop", "Stop the spitroast")
		
		if(state == "inside"):
			addAction("fuckMore", 1.0, "Continue fucking", "Start fucking them again")
			addAction("pullOut", getStopScore(), "Pull out", "Pull your member out")
		
		if(state == ""):
			addAction("rub", 1.0, "Rub", "Rub your cock against them")
			if(getDomInfo().isReadyToPenetrate() && getDomInfo(1).isReadyToPenetrate()):
				addAction("penetrate", 1.0, "Penetrate", "Try to start fucking them!")
			addAction("switch", 0.0, "Switch positions", "Switch positions with the dom")
		if(state == "sex"):
			addAction("pause", 0.0, "Slow down", "Pause the fucking")
		if(state == "sex" && isReadyToCumHandled(DOM_0) && isReadyToCumHandled(DOM_1)):
			addAction("cum", 1.0, "Cum inside", "Cum inside them!", {A_PRIORITY: 1001})
	if(_indx == SUB_0):
		addAction("pullaway", getSubInfo().getResistScore(), "Pull away", "Try to pull away", {A_CHANCE: getSubResistChance(30.0, 25.0)})

func doAction(_indx:int, _id:String, _action:Dictionary):
	if(_id == "switch"):
		switchDoms(0, 1)
	if(_id == "cum"):
		getDomInfo().cum()
		getDomInfo(1).cum()
		addText("You cum inside {sub.you}!")
		state = "inside"
		return
	if(_id == "fuckMore"):
		addText("You start fucking {sub.you} again!")
		state = "sex"
		return
	if(_id == "pause"):
		addText("You pause.")
		state = "inside"
		return
	if(_id == "pullOut"):
		addText("You pull out.")
		state = ""
		return
	if(_id == "rub"):
		addText("You rub cock against {sub.your} holes.")
		stimulate(DOM_0, S_PENIS, SUB_0, S_VAGINA, I_TEASE, Fetish.VaginalSexGiving)
		stimulate(DOM_1, S_PENIS, SUB_0, S_MOUTH, I_TEASE, Fetish.OralSexReceiving)
		return
	if(_id == "penetrate"):
		addText("You start fucking!")
		state = "sex"
		return
	if(_id == "stop"):
		endActivity()
		addText("{dom.You} and {dom1.you} lower {sub.you} and then pull away.")
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
		return [StageScene.SexSpitroast, "inside", {pc=SUB_0, npc=DOM_0, npc2=DOM_1, npcBodyState={hard=true}, npc2BodyState={hard=true}}]
	if(state == "sex"):
		if(isCloseToCumming(DOM_0) && isCloseToCumming(DOM_1)):
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
