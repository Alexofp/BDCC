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

const TagsThatPreventBegging = [
	SexActivityTag.AnusPenetrated,
	SexActivityTag.VaginaPenetrated,
	SexActivityTag.PenisInside,
	SexActivityTag.MouthUsed,
	SexActivityTag.OrderedToDoSomething,
	SexActivityTag.OrderedToUndress,
]

func getStartActions(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	var isSubPC:bool = _subInfo.getChar().isPlayer()
	if(!isSubPC && (_sexEngine.hasTag(_subInfo.charID, SexActivityTag.PreventsSubTeasing) || _sexEngine.hasTag(_subInfo.charID, SexActivityTag.HavingSex))):
		return
	if(!isSubPC && _subInfo.isResistingSlightly()):
		return
	
	for theTag in TagsThatPreventBegging:
		if(_sexEngine.hasTag(_subInfo.charID, theTag)):
			return
	var _subFetishHolder:FetishHolder = _subInfo.getChar().getFetishHolder()
	
	var amountOfGoalsMod:float = 0.02
	if(_sexEngine.allPossibleGoalsToBeg.size() > 0):
		amountOfGoalsMod = 1.0 / float(_sexEngine.allPossibleGoalsToBeg.size())
	
	for goalID in _sexEngine.allPossibleGoalsToBeg:
		var theGoalRef:SexGoalBase = GlobalRegistry.getSexGoal(goalID)
		if(!theGoalRef):
			continue
		if(!theGoalRef.isPossible(_sexEngine, _domInfo, _subInfo, [])):
			continue
		var theFetishes:Dictionary = theGoalRef.getBegDomFetishes()
		var fetishMod:float = -1.0
		if(!theFetishes.empty()):
			for fetishID in theFetishes:
				var subFetishID:String = Fetish.getOppositeFetish(fetishID)
				fetishMod = max(fetishMod, _subFetishHolder.getFetish(subFetishID))
		else:
			fetishMod = 1.0
			
		var theBegName:String = theGoalRef.getBegName()
		var theBegDesc:String = theGoalRef.getBegDesc()
		var theScore:float = 0.3 * clamp(fetishMod+0.5, 0.0, 1.0) * amountOfGoalsMod
		var theChance:float = getDomAgreeGoalChance(_sexEngine, _domInfo, _subInfo, theGoalRef) if isSubPC else 0.0
		addStartAction([goalID], theBegName, theBegDesc, theScore, {A_CATEGORY: ["Beg"], A_CHANCE: theChance})

func startActivity(_args):
	var theGoalID:String = _args[0]
	
	endActivity()
	var theGoalRef:SexGoalBase = GlobalRegistry.getSexGoal(theGoalID)
	if(!theGoalRef):
		return
	var theEngine := getSexEngine()
	var theDomInfo := getDomInfo()
	var theSubInfo := getSubInfo()
	addText(theGoalRef.getBegMessage(theEngine, theDomInfo, theSubInfo))
	talkText(SUB_0, theGoalRef.getBegDialogue(theEngine, theDomInfo, theSubInfo))
	
	if(getDom().isPlayer()):
		return
	var theChance:float = getDomAgreeGoalChance(theEngine, theDomInfo, theSubInfo, theGoalRef)
	if(RNG.chance(theChance) && replaceRandomGoalSmart(DOM_0, SUB_0, theGoalID)):
		addText("{dom.You} {dom.youVerb('agree')}.")
		talkText(DOM_0, theGoalRef.getBegAgreeDialogue())
		
		getDomInfo().increaseMemory("GOT_BEGGED", 3)
	else:
		addText("{dom.You} {dom.youVerb('deny', 'denies')} {sub.your} request.")
		talkText(DOM_0, theGoalRef.getBegDenyDialogue())
		getDomInfo().addAnger(0.3)
		
		getDomInfo().increaseMemory("GOT_BEGGED")
	
	

func getDomAgreeGoalChance(_sexEngine:SexEngine, _domInfo:SexDomInfo, _subInfo:SexSubInfo, _sexGoal:SexGoalBase) -> float:
	var theFetishes:Dictionary = _sexGoal.getBegDomFetishes()
	var _domFetishHolder:FetishHolder = _domInfo.getChar().getFetishHolder()
	
	var maxFetishScore:float = -1.0
	if(theFetishes.empty()):
		maxFetishScore = 1.0
	else:
		for fetishID in theFetishes:
			var theVal:float = _domFetishHolder.getFetish(fetishID)
			if(theVal > maxFetishScore):
				maxFetishScore = theVal
	
	var theAffection:float = GM.main.RS.getAffection(_domInfo.getCharID(), _subInfo.getCharID())
	var theAnger:float = _domInfo.getAngerScore()
	
	var theChance:float = (maxFetishScore+1.0) * 50.0 * (1.0+theAffection) * (1.0 - theAnger*0.5)
	
	if(_subInfo.getChar().isGagged()):
		theChance *= 0.8
	
	var beggedAm:float = float(_domInfo.getMemory("GOT_BEGGED", 0))
	theChance *= 1.0/log(beggedAm+2.7)
	
	return clamp(theChance, 5.0, 100.0)
