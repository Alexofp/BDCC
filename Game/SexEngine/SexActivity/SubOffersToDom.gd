extends SexActivityBase

func _init():
	id = "SubOffersToDom"
	startedByDom = false
	startedBySub = true
	
	activityName = "Offer"
	activityDesc = "Sub offering something to the dom"
	activityCategory = []

func getGoals():
	return {
	}

func getSupportedSexTypes():
	return {
		SexType.DefaultSex: true,
		SexType.StocksSex: true,
		#SexType.SlutwallSex: true,
		#SexType.BitchsuitSex: true,
	}

func isStocksSex() -> bool:
	return getSexEngine().getSexTypeID() == SexType.StocksSex

func getActivityBaseScore(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	return 0.0

func getStartActions(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	#var sub:BaseCharacter = _subInfo.getChar()
	#var dom:BaseCharacter = _domInfo.getChar()
	
	for goalID in _sexEngine.allPossibleGoalsToBeg:
		var theGoalRef:SexGoalBase = GlobalRegistry.getSexGoal(goalID)
		if(!theGoalRef):
			continue
		if(!theGoalRef.isPossible(_sexEngine, _domInfo, _subInfo, [])):
			continue
		var theBegName:String = theGoalRef.getBegName()
		var theBegDesc:String = theGoalRef.getBegDesc()
		var theScore:float = 0.0
		var theChance:float = getDomAgreeGoalChance(_sexEngine, _domInfo, _subInfo, goalID)
		addStartAction([goalID], theBegName, theBegDesc, theScore, {A_CATEGORY: ["Beg"], A_CHANCE: theChance})

func startActivity(_args):
	var theGoalID:String = _args[0]
	
	endActivity()
	var theGoalRef:SexGoalBase = GlobalRegistry.getSexGoal(theGoalID)
	if(!theGoalRef):
		return
	addText(theGoalRef.getBegMessage())
	talkText(SUB_0, theGoalRef.getBegDialogue())
	
	if(getDom().isPlayer()):
		return
	var theChance:float = getDomAgreeGoalChance(getSexEngine(), getDomInfo(), getSubInfo(), theGoalID)
	if(RNG.chance(theChance) && replaceRandomGoalSmart(DOM_0, SUB_0, theGoalID)):
		addText("{dom.You} {dom.youVerb('agree')}.")
		talkText(DOM_0, theGoalRef.getBegAgreeDialogue())
	else:
		addText("{dom.You} {dom.youVerb('deny', 'denies')} {sub.your} request.")
		talkText(DOM_0, theGoalRef.getBegDenyDialogue())

func getDomAgreeGoalChance(_sexEngine:SexEngine, _domInfo:SexDomInfo, _subInfo:SexSubInfo, _goalID:String) -> float:
	return 50.0
