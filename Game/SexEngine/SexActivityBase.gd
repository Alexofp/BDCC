extends Reference
class_name SexActivityBase

var id:String = "error"
var uniqueID:int = 0
var sexEngineRef: WeakRef
var hasEnded:bool = false

var subs:Array = []
var doms:Array = []

var startedByDom:bool = true # Can be started by dom?
var startedBySub:bool = false # Can be started by sub?

var state:String = ""

# Here is hope this won't bite me
const DOM_0 = 0
const DOM_1 = 1
const DOM_2 = 2

const SUB_0 = -1
const SUB_1 = -2
const SUB_2 = -3

const S_VAGINA = BodypartSlot.Vagina
const S_ANUS = BodypartSlot.Anus
const S_PENIS = BodypartSlot.Penis
const S_MOUTH = BodypartSlot.Head
const S_HANDS = BodypartSlot.Arms
const S_LEGS = BodypartSlot.Legs
const S_BREASTS = BodypartSlot.Breasts

const I_TEASE = SexActIntensity.Tease
const I_LOW = SexActIntensity.Low
const I_NORMAL = SexActIntensity.Normal
const I_HIGH = SexActIntensity.High

const SPEED_VERYSLOW = 0
const SPEED_SLOW = 1
const SPEED_MEDIUM = 2
const SPEED_FAST = 3

const A_PRIORITY = "priority"
const A_CHANCE = "chance"
const A_ARGS = "args"
const A_CATEGORY = "category"
const A_SCORE = "score"

# Don't save these
var activityName:String = "NEW ACTIVITY"
var activityDesc:String = "Start new activity."
var activityCategory:Array = []

func getDomOrSubInfo(_indx:int) -> SexInfoBase:
	if(_indx >= 0):
		return getDomInfo(_indx)
	return getSubInfo(-_indx-1)
func getDomOrSub(_indx:int) -> BaseCharacter:
	if(_indx >= 0):
		return getDom(_indx)
	return getSub(-_indx-1)
func getDomOrSubID(_indx:int) -> String:
	if(_indx >= 0):
		return getDomID(_indx)
	return getSubID(-_indx-1)

# avoids near-zero values basically
# unClampValue(0.2, 0.1) = 0.2
# unClampValue(0.02, 0.1) = 0.1
# unClampValue(-0.02, 0.1) = -0.1
# 0.0 treated as positive
func unClampValue(_theVal:float, _theBorder:float) -> float:
	if(_theVal >= 0.0 && _theVal <= _theBorder):
		_theVal = _theBorder
	if(_theVal < 0.0 && _theVal > -_theBorder):
		_theVal = -_theBorder
	return _theVal

func exposeToFetish(_indxTarget:int, _fetishID:String, _intensity:int, _indxExposer:int):
	var info1:SexInfoBase = getDomOrSubInfo(_indxTarget)
	
	var fetishScore:float = info1.fetishScore({_fetishID:1.0}) if _fetishID != "" else 1.0
	fetishScore = unClampValue(fetishScore, 0.2)
	
	if(info1 is SexSubInfo):
		info1.addLust(10.0*fetishScore)
		info1.addResistance(-0.1*fetishScore)
		info1.addFear(-0.01*fetishScore)
	
	elif(info1 is SexDomInfo):
		info1.addLust(10.0*fetishScore)
		info1.addAnger(-0.05*fetishScore)

func stimulate(_indxActor:int, _slotActor:String, _indxTarget:int, _slotTarget:String, _intensity:int, _fetishID:String, speedSex:int = SPEED_MEDIUM):
	var infoActor:SexInfoBase = getDomOrSubInfo(_indxActor)
	var infoTarget:SexInfoBase = getDomOrSubInfo(_indxTarget)
	
	exposeToFetish(_indxTarget, _fetishID, _intensity, _indxActor)
	exposeToFetish(_indxActor, _fetishID, _intensity, _indxActor) # Target is same as Exposer?
	
	var fetishScoreActor:float = infoActor.fetishScore({_fetishID:1.0}) if _fetishID != "" else 1.0
	fetishScoreActor = unClampValue(fetishScoreActor, 0.2)
	var targetFetishID:String = Fetish.getOppositeFetish(_fetishID)
	var fetishScoreTarget:float = infoTarget.fetishScore({targetFetishID:1.0}) if targetFetishID != "" else 1.0
	fetishScoreTarget = unClampValue(fetishScoreTarget, 0.2)
	
	var arousalAdd:float = 0.1
	if(speedSex == SPEED_VERYSLOW):
		arousalAdd = 0.05
	elif(speedSex == SPEED_SLOW):
		arousalAdd = 0.1
	elif(speedSex == SPEED_MEDIUM):
		arousalAdd = 0.2
	elif(speedSex == SPEED_FAST):
		arousalAdd = 0.3
	
	if(_intensity == I_TEASE):
		infoActor.addArousalForeplay(arousalAdd*0.25 + fetishScoreActor*0.05)
		infoTarget.addArousalForeplay(arousalAdd*0.25 + fetishScoreTarget*0.05)
	elif(_intensity == I_LOW):
		infoActor.stimulateArousalZone(arousalAdd*0.5, _slotActor, 0.5)
		infoTarget.stimulateArousalZone(arousalAdd*0.5, _slotTarget, 0.5)
	elif(_intensity == I_NORMAL):
		infoActor.stimulateArousalZone(arousalAdd, _slotActor, 1.0)
		infoTarget.stimulateArousalZone(arousalAdd, _slotTarget, 1.0)
	elif(_intensity == I_HIGH):
		infoActor.stimulateArousalZone(arousalAdd, _slotActor, 1.5)
		infoTarget.stimulateArousalZone(arousalAdd, _slotTarget, 1.5)

const CHOKE_GENTLE = 0
const CHOKE_NORMAL = 1
const CHOKE_HARD = 2


func choke(_indxActor:int, _indxTarget:int, _chokeStrength:int = CHOKE_NORMAL):
	if(_indxActor < 0):
		assert(false, "Subs can't choke")
		return
	if(_indxTarget >= 0):
		assert(false, "Doms can't be choked")
		return
	var actorInfo:SexDomInfo = getDomOrSubInfo(_indxActor)
	var targetInfo:SexSubInfo = getDomOrSubInfo(_indxTarget)
	
	if(_chokeStrength == CHOKE_HARD):
		targetInfo.addFear(0.1)
		actorInfo.addAnger(-0.05)
	else:
		targetInfo.addFear(0.05)
		actorInfo.addAnger(-0.05)
	
	var targetMasochism:float = fetish(_indxTarget, Fetish.Masochism, -0.5)
	targetInfo.addLust(0.1 * targetMasochism)
	targetInfo.addResistance(-0.2 * targetMasochism)
	
	var actorSadism:float = fetish(_indxActor, Fetish.Sadism, 0.5)
	actorInfo.addLust(0.1 * actorSadism)
	
	if(_chokeStrength == CHOKE_GENTLE):
		targetInfo.addConsciousness(-0.01)
	elif(_chokeStrength == CHOKE_NORMAL):
		targetInfo.addConsciousness(-RNG.randf_range(0.01, 0.05))
	elif(_chokeStrength == CHOKE_HARD):
		targetInfo.addConsciousness(-RNG.randf_range(0.05, 0.2))
	
	sendSexEvent(SexEvent.Choking, _indxActor, _indxTarget, {strongChoke=(_chokeStrength == CHOKE_HARD)})

const STRIKE_NORMAL = 0
const STRIKE_FULLFORCE = 1

func strike(_indxActor:int, _indxTarget:int, _strikeStrength:int = STRIKE_NORMAL, _isDefense:bool = false, _isIntentional:bool = true):
	if(_indxActor >= 0 && _indxTarget >= 0):
		assert(false, "Doms can't hit doms")
		return
	if(_indxActor < 0 && _indxTarget < 0):
		assert(false, "Subs can't hit subs")
		return
	
	# Dom hits a sub
	if(_indxActor >= 0 && _indxTarget < 0):
		var actorInfo:SexDomInfo = getDomOrSubInfo(_indxActor)
		var targetInfo:SexSubInfo = getDomOrSubInfo(_indxTarget)
		
		var targetMasochism:float = fetish(_indxTarget, Fetish.Masochism, -0.5)
		if(_strikeStrength == STRIKE_FULLFORCE):
			targetInfo.addFear(0.3)
			targetInfo.addLust(0.2 * targetMasochism)
			targetInfo.addResistance(-0.05 * targetMasochism)
		else:
			targetInfo.addFear(0.05)
			targetInfo.addLust(0.1 * targetMasochism)
			targetInfo.addResistance(-0.2 * targetMasochism)
		
		var actorSadism:float = fetish(_indxActor, Fetish.Sadism, 0.5)
		var howMuchAddPain:int = 0
		if(_strikeStrength == STRIKE_FULLFORCE):
			howMuchAddPain = RNG.randi_range(15, 25)
			actorInfo.addLust(0.2 * actorSadism)
			actorInfo.addAnger(-0.2)
		else:
			howMuchAddPain = RNG.randi_range(4, 8)
			actorInfo.addLust(0.1 * actorSadism)
			actorInfo.addAnger(-0.1)
		
		targetInfo.addPain(howMuchAddPain)
		sendSexEvent(SexEvent.PainInflicted, _indxActor, _indxTarget, {pain=howMuchAddPain,isDefense=_isDefense,intentional=_isIntentional})
	# Sub hits a dom
	if(_indxActor < 0 && _indxTarget >= 0):
		assert(false, "IMPLEMENT ME")

func moan(_indx:int):
	var theInfo:SexInfoBase = getDomOrSubInfo(_indx)
	if(theInfo.isUnconscious()):
		return
	theInfo.addArousalForeplay(0.02)
	for theSubInfo in subs:
		theSubInfo.addLust(5)
		theSubInfo.addFear(-0.02)
	for theDomInfo in doms:
		theDomInfo.addLust(5)
		theDomInfo.addAnger(-0.02)
	
func fetish(_indx:int, _fetishID:String, _add:float = 0.0, _unclampVal:float = 0.1) -> float:
	var theInfo:SexInfoBase = getDomOrSubInfo(_indx)
	if(!theInfo):
		return 0.0
	var theVal:float = clamp(theInfo.fetishScore({_fetishID:1.0})+_add, -1.0, 1.0)
	return unClampValue(theVal, _unclampVal)

func personality(_indx:int, _persStatID:String, _add:float = 0.0, _unclampVal:float = 0.1) -> float:
	var theInfo:SexInfoBase = getDomOrSubInfo(_indx)
	if(!theInfo):
		return 0.0
	var theVal:float = clamp(theInfo.personalityScore({_persStatID:1.0})+_add, -1.0, 1.0)
	return unClampValue(theVal, _unclampVal)

const RESIST_BREASTS_FOCUS = 0
const RESIST_NECK_FOCUS = 1
const RESIST_LEGS_FOCUS = 2
const RESIST_HANDS_FOCUS = 3
const RESIST_ORAL_FOCUS = 4
func getResistChance(_indxSub:int, _indxDom:int, resistType:int, baseChance:float, domAngerRemoval:float) -> float:
	#var theSubInfo:SexSubInfo = getDomOrSubInfo(_indxSub)
	var theSub:BaseCharacter = getDomOrSub(_indxSub)
	var theDomInfo:SexDomInfo = getDomOrSubInfo(_indxDom)
	
	var theChance:float = baseChance - theDomInfo.getAngerScore()*domAngerRemoval
	if(resistType == RESIST_BREASTS_FOCUS):
		if(theSub.hasBlockedHands()):
			theChance *= 0.5
		if(theSub.hasBoundArms()):
			theChance *= 0.5
		if(theSub.isBlindfolded()):
			theChance *= 0.8
		if(theSub.hasBoundLegs()):
			theChance *= 0.5
	if(resistType == RESIST_NECK_FOCUS):
		if(theSub.hasBoundArms()):
			theChance *= 0.5
		if(theSub.hasBlockedHands()):
			theChance *= 0.5
		if(theSub.isBlindfolded()):
			theChance *= 0.8
		if(theSub.hasBoundLegs()):
			theChance *= 0.8
		#if(getState() == ""):
		#	theChance *= 0.5
		if(getSexType() in [SexType.SlutwallSex, SexType.StocksSex]):
			theChance *= 0.5
	if(resistType == RESIST_LEGS_FOCUS):
		if(theSub.hasBlockedHands()):
			theChance *= 0.8
		if(theSub.hasBoundArms()):
			theChance *= 0.8
		if(theSub.isBlindfolded()):
			theChance *= 0.8
		if(theSub.hasBoundLegs()):
			theChance *= 0.5
	if(resistType == RESIST_HANDS_FOCUS):
		if(theSub.hasBlockedHands()):
			theChance *= 0.5
		if(theSub.hasBoundArms()):
			theChance *= 0.5
		if(theSub.isBlindfolded()):
			theChance *= 0.8
	if(resistType == RESIST_ORAL_FOCUS):
		if(theSub.hasBlockedHands()):
			theChance *= 0.5
		if(theSub.hasBoundArms()):
			theChance *= 0.5
		if(theSub.isBlindfolded()):
			theChance *= 0.8
		if(getSexType() == SexType.SlutwallSex):
			theChance *= 0.5
	
	return max(theChance, 5.0)

func addOutputRaw(_rawEntry:Array):
	getSexEngine().addOutputRaw(_rawEntry)

func talkText(_indx1:int, _text:String):
	if(_text.empty()):
		return
	var theInfo := getDomOrSubInfo(_indx1)
	if(theInfo.isUnconscious()):
		return
	addOutputRaw([SexEngine.OUTPUT_SAY, theInfo.getCharID(), processText(_text)])

func getTalkText(_indx1:int, _indx2:int, reactionID:int) -> String:
	var theInfo := getDomOrSubInfo(_indx1)
	if(!theInfo || theInfo.isUnconscious()):
		return ""
	var theInfo2 := getDomOrSubInfo(_indx2)
	
	var theText:String = ""
	if(theInfo is SexDomInfo && theInfo2 is SexSubInfo):
		theText = theInfo.getChar().getVoice().getDomReaction(reactionID, getSexEngine(), theInfo, theInfo2)
		
		if(theText != ""):
			return GM.ui.processString(theText, {
				dom = theInfo.getCharID(),
				sub = theInfo2.getCharID(),
			})
		
	elif(theInfo is SexSubInfo && theInfo2 is SexDomInfo):
		theText = theInfo.getChar().getVoice().getSubReaction(reactionID, getSexEngine(), theInfo2, theInfo)
	
		if(theText != ""):
			return GM.ui.processString(theText, {
				dom = theInfo2.getCharID(),
				sub = theInfo.getCharID(),
			})
	return ""
		

func talk(_indx1:int, _indx2:int, reactionID:int):
	var theText:String = getTalkText(_indx1, _indx2, reactionID)
	if(theText == ""):
		return
	var theInfo := getDomOrSubInfo(_indx1)
	if(!theInfo):
		return
	addOutputRaw([SexEngine.OUTPUT_SAY, theInfo.getCharID(), theText])


func addText(_text:String):
	if(_text.empty()):
		return
	addOutputRaw([SexEngine.OUTPUT_TEXT, processText(_text)])

func addTextPick(_texts:Array):
	if(_texts.empty()):
		return
	addText(RNG.pick(_texts))

func addTextRaw(_text:String):
	if(_text.empty()):
		return
	addOutputRaw([SexEngine.OUTPUT_TEXT, (_text)])

func addTextRawPick(_texts:Array):
	if(_texts.empty()):
		return
	addTextRaw(RNG.pick(_texts))

func indxToTextID(_indx:int) -> String:
	if(_indx == 0):
		return "dom"
	if(_indx == -1):
		return "sub"
	if(_indx > 0):
		return "dom"+str(_indx)
	return "sub"+str(-_indx+1)

func processText(_text:String) -> String:
	var theOverrides:Dictionary = {}
	var _i:int = 0
	for theSubInfo in subs:
		if(_i == 0):
			theOverrides["sub"] = theSubInfo.getCharID()
		else:
			theOverrides["sub"+str(_i)] = theSubInfo.getCharID()
		_i += 1
	_i = 0
	for theDomInfo in doms:
		if(_i == 0):
			theOverrides["dom"] = theDomInfo.getCharID()
		else:
			theOverrides["dom"+str(_i)] = theDomInfo.getCharID()
		_i += 1
	return GM.ui.processString(_text, theOverrides)

func hasBodypartUncovered(_indx:int, bodypartSlot:String) -> bool:
	var theChar:BaseCharacter = getDomOrSub(_indx)
	if(!theChar):
		return false
	return (theChar.getFirstItemThatCoversBodypart(bodypartSlot) == null)

const INDX_NOT_FOUND = -9999

func convertCharIDToIndx(_charID:String) -> int:
	for _i in range(doms.size()):
		if(doms[_i].getCharID() == _charID):
			return _i
	for _i in range(subs.size()):
		if(subs[_i].getCharID() == _charID):
			return -_i-1
	return INDX_NOT_FOUND

func doActionForCharID(_charID:String, _action:Dictionary):
	var _indx:int = convertCharIDToIndx(_charID)
	if(_indx <= INDX_NOT_FOUND):
		return
	
	if(has_method(getStatePrefix()+"_doAction")):
		call(getStatePrefix()+"_doAction", _indx, _action["id"], _action)
	doAction(_indx, _action["id"], _action)

func getJoinActions(_sexInfo:SexInfoBase):
	pass

func getJoinActionsFinal(_sexInfo:SexInfoBase) -> Array:
	actionsResult = []
	getJoinActions(_sexInfo)
	return actionsResult

func doJoinAction(_sexInfo:SexInfoBase, _args):
	pass

func addJoinAction(_aArgs:Array, _aName:String, _aDesc:String, _aScore:float, _aExtra:Dictionary = {}):
	var theCategory:Array = getCategory() if !_aExtra.has(A_CATEGORY) else []
	var theEntry:Dictionary = {
		score = _aScore,
		name = _aName,
		desc = _aDesc,
		category = theCategory,
		args = _aArgs,
	}
	for field in _aExtra:
		theEntry[field] = _aExtra[field]
	
	actionsResult.append(theEntry)

var actionsResult:Array
func getActionsForCharID(_charID:String) -> Array:
	actionsResult = []
	
	var _indx:int = convertCharIDToIndx(_charID)
	if(_indx <= -9999):
		return []
	
	if(has_method(getStatePrefix()+"_getActions")):
		call(getStatePrefix()+"_getActions", _indx)
	getActions(_indx)
	
	return actionsResult

func getActions(_indx:int):
	pass
	
func doAction(_indx:int, _id:String, _action:Dictionary):
	pass

func addAction(_aID:String, _aScore:float, _aName:String, _aDesc:String, _aExtra:Dictionary = {}):
	var theEntry:Dictionary = {
		id = _aID,
		score = _aScore,
		name = _aName,
		desc = _aDesc,
	}
	for field in _aExtra:
		theEntry[field] = _aExtra[field]
	
	actionsResult.append(theEntry)

func addStartAction(_aArgs:Array, _aName:String, _aDesc:String, _aScore:float, _aExtra:Dictionary = {}):
	var theCategory:Array = getCategory() if !_aExtra.has(A_CATEGORY) else []
	var theEntry:Dictionary = {
		score = _aScore,
		name = _aName,
		desc = _aDesc,
		category = theCategory,
		args = _aArgs,
	}
	for field in _aExtra:
		theEntry[field] = _aExtra[field]
	
	actionsResult.append(theEntry)

func getSubInfo(_indx:int = 0) -> SexSubInfo:
	if(_indx < 0 || _indx >= subs.size()):
		Log.printerr("Sex activity with ID "+str(id)+" tries to access non-existant sub info with index "+str(_indx))
		return null
	return subs[_indx]
	
func getDomInfo(_indx:int = 0) -> SexDomInfo:
	if(_indx < 0 || _indx >= doms.size()):
		Log.printerr("Sex activity with ID "+str(id)+" tries to access non-existant dom info with index "+str(_indx))
		return null
	return doms[_indx]

func getSubID(_indx:int = 0) -> String:
	if(_indx < 0 || _indx >= subs.size()):
		Log.printerr("Sex activity with ID "+str(id)+" tries to access non-existant sub with index "+str(_indx))
		return ""
	return subs[_indx].charID

func getDomID(_indx:int = 0) -> String:
	if(_indx < 0 || _indx >= doms.size()):
		Log.printerr("Sex activity with ID "+str(id)+" tries to access non-existant dom with index "+str(_indx))
		return ""
	return doms[_indx].charID

func getSub(_indx:int = 0) -> BaseCharacter:
	var theSubInfo := getSubInfo(_indx)
	if(!theSubInfo):
		return null
	return theSubInfo.getChar()

func getDom(_indx:int = 0) -> BaseCharacter:
	var theDomInfo := getDomInfo(_indx)
	if(!theDomInfo):
		return null
	return theDomInfo.getChar()

func switchSubs(_indx1:int=0, _indx2:int=1):
	var subInfo1:SexSubInfo = subs[_indx1]
	subs[_indx1] = subs[_indx2]
	subs[_indx2] = subInfo1

func switchDoms(_indx1:int=0, _indx2:int=1):
	var domInfo1:SexDomInfo = doms[_indx1]
	doms[_indx1] = doms[_indx2]
	doms[_indx2] = domInfo1

func indxToOverrideName(_indx:int) -> String:
	if(_indx == SUB_0):
		return "sub"
	if(_indx == DOM_0):
		return "dom"
	if(_indx == SUB_1):
		return "sub2"
	if(_indx == DOM_1):
		return "dom2"
	if(_indx > 0):
		return "dom"+str(_indx+1)
	if(_indx < 0):
		return "sub"+str(-_indx)
	
	return "ERROR"

func getThroughClothingText(_indx:int, _slot:String) -> String:
	var theChar := getDomOrSub(_indx)
	var clothingItem = theChar.getFirstItemThatCoversBodypart(_slot)
	var throughTheClothing:String = ""
	if(clothingItem != null):
		throughTheClothing = " through {"+indxToOverrideName(_indx)+".yourHis} "+clothingItem.getCasualName()
	return throughTheClothing

func getThroughClothingTextCustom(_indx:int, _slot:String, _customText:String) -> String:
	var theChar := getDomOrSub(_indx)
	var clothingItem = theChar.getFirstItemThatCoversBodypart(_slot)
	var throughTheClothing:String = ""
	if(clothingItem != null):
		throughTheClothing = _customText
	return throughTheClothing

func isCloseToCumming(_indx:int) -> bool:
	return getDomOrSubInfo(_indx).isCloseToCumming()
	
func isReadyToCum(_indx:int) -> bool:
	return getDomOrSubInfo(_indx).isReadyToCum()

func isReadyToCumHandled(_indx:int) -> bool:
	return isReadyToCum(_indx) && isHandlingOrgasms(_indx)

func canDoActions(_indx:int) -> bool:
	return getDomOrSubInfo(_indx).canDoActions()

func getVisibleName() -> String:
	return activityName

func getVisibleDesc() -> String:
	return activityDesc

func getCategory() -> Array:
	return activityCategory

func getSexEngine() -> SexEngine:
	if(sexEngineRef == null):
		return null
	return sexEngineRef.get_ref()

func initParticipants(theDoms, theSubs):
	if(theDoms is String):
		theDoms = [theDoms]
	if(theSubs is String):
		theSubs = [theSubs]
	
	doms.clear()
	subs.clear()
	
	for theDomID in theDoms:
		doms.append(getSexEngine().getDomInfo(theDomID))
	for theSubID in theSubs:
		subs.append(getSexEngine().getSubInfo(theSubID))

# Will automatically end the activity if this returns true
func isActivityImpossibleShouldStop() -> bool:
	return false

func endActivity():
	if(!hasEnded):
		hasEnded = true
		onActivityEnd()
	
	hasEnded = true

func onActivityEnd():
	pass

func getGoals():
	return {}

func getSupportedSexTypes():
	return {
		SexType.DefaultSex: true,
	}

func getSexType():
	return getSexEngine().getSexTypeID()

func satisfyGoals():
	var goalData = getGoals()
	var sexEngine = getSexEngine()
	
	for theDomInfo in doms:
		for theSubInfo in subs:
			for goalID in goalData:
				sexEngine.satisfyGoal(theDomInfo, goalID, theSubInfo)

func satisfyGoal(goalID):
	var sexEngine = getSexEngine()
	for theDomInfo in doms:
		for theSubInfo in subs:
			sexEngine.satisfyGoal(theDomInfo, goalID, theSubInfo)

func failGoals():
	var goalData = getGoals()
	var sexEngine = getSexEngine()
	
	for theDomInfo in doms:
		for theSubInfo in subs:
			for goalID in goalData:
				sexEngine.failGoal(theDomInfo, goalID, theSubInfo)

func failGoal(goalID):
	var sexEngine = getSexEngine()
	for theDomInfo in doms:
		for theSubInfo in subs:
			sexEngine.failGoal(theDomInfo, goalID, theSubInfo)

func replaceGoalsTo(newgoalID, replaceAll = true):
	var goalData = getGoals()
	var sexEngine = getSexEngine()
	
	for theDomInfo in doms:
		for theSubInfo in subs:
			for goalID in goalData:
				sexEngine.replaceGoal(theDomInfo, goalID, theSubInfo, newgoalID, replaceAll)

func progressGoal(goalid, args = []):
	for theDomInfo in doms:
		for theSubInfo in subs:
			getSexEngine().progressGoal(theDomInfo, goalid, theSubInfo, args)

func progressGoalFailed(goalid, args = []):
	for theDomInfo in doms:
		for theSubInfo in subs:
			getSexEngine().progressGoalFailed(theDomInfo, goalid, theSubInfo, args)

func canStartActivity(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	return tagsNotBusy(_sexEngine, _domInfo, _subInfo) && !hasActivity(_sexEngine, id, _domInfo, _subInfo)

func getStartActions(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	addStartAction([], getVisibleName(), getVisibleDesc(), getActivityScore(_sexEngine, _domInfo, _subInfo))

func getStartActionsFinal(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo) -> Array:
	actionsResult = []
	getStartActions(_sexEngine, _domInfo, _subInfo)
	return actionsResult

func canBeStartedByDom() -> bool:
	return startedByDom
	
func canBeStartedBySub() -> bool:
	return startedBySub

func getActivityBaseScore(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	return 0.0

func getActivityScore(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	#print(id," ",getActivityScoreCustomGoals(getGoals(), _sexEngine, _domInfo, _subInfo))
	return getActivityScoreCustomGoals(getGoals(), _sexEngine, _domInfo, _subInfo)

func getActivityScoreCustomGoals(goalData, _sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	var resultScore = getActivityBaseScore(_sexEngine, _domInfo, _subInfo)
	var addToScore = 0.0
	
	for goalID in goalData:
		#if(_sexEngine.hasGoal(_domInfo, goalID, _subInfo)):
		addToScore = max(addToScore, goalData[goalID] * _sexEngine.hasGoalScore(_domInfo, goalID, _subInfo))

	return (resultScore + addToScore) * getActivityScoreMult(_sexEngine, _domInfo, _subInfo)

func getActivityScoreMult(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	return 1.0

func getStopScore() -> float:
	var sexEngine := getSexEngine()
	
	var activityScore:float = 0.0
	for theDomInfo in doms:
		# If one of the doms in this activity is player, never automatically stop
		if(theDomInfo.getCharID() == "pc"):
			return 0.0
		for theSubInfo in subs:
			activityScore += max(getActivityScore(sexEngine, theDomInfo, theSubInfo), 0.0)
		
	if(activityScore > 0.0):
		return 0.0
	return 2.0

func getPauseSexScore(_indxTop:int, _indxBottom:int, _slotBottom:String, _slotTop:String = BodypartSlot.Penis) -> float:
	var topChar:BaseCharacter = getDomOrSub(_indxTop)
	var bottomChar:BaseCharacter = getDomOrSub(_indxBottom)
	
	var topOverStim:float = topChar.getZoneOverstimulation(_slotTop)
	if(topOverStim < 0.8):
		topOverStim = 0.0
	if(topChar.isZoneOverstimulated(_slotTop)):
		topOverStim = 1.0
	
	var bottomOverStim:float = bottomChar.getZoneOverstimulation(_slotBottom)
	if(bottomOverStim < 0.8):
		bottomOverStim = 0.0
	if(bottomChar.isZoneOverstimulated(_slotBottom)):
		bottomOverStim = 1.0
	
	var slowdownScore:float = topOverStim * (1.0 - (personality(_indxTop, PersonalityStat.Impatient)+1.0)/2.0)
	
	slowdownScore = max(slowdownScore, bottomOverStim * (1.0 - (personality(_indxTop, PersonalityStat.Mean)+1.0)/2.0))
	
	return slowdownScore

func getContinueSexScore(_indxTop:int, _indxBottom:int, _hole:String, _slotTop:String = BodypartSlot.Penis) -> float:
	var thePauseScore:float = getPauseSexScore(_indxTop, _indxBottom, _hole, _slotTop)
	if(thePauseScore > 0.1):
		return 0.0
	return 1.0


func hasActivity(_sexEngine: SexEngine, theid:String, _domInfo: SexDomInfo, _subInfo: SexSubInfo) -> bool:
	return _sexEngine.hasActivity(theid, _domInfo.charID, _subInfo.charID)

func tagsNotBusy(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	var domTags:Array = getCheckTagsDom()
	for tag in domTags:
		if(_sexEngine.hasTag(_domInfo.charID, tag)):
			return false
			
	var subTags:Array = getCheckTagsSub()
	for tag in subTags:
		if(_sexEngine.hasTag(_subInfo.charID, tag)):
			return false
	
	return true

func startActivity(_args):
	pass

func onSwitchFrom(_otherActivity, _args):
	pass

func switchCurrentActivityTo(newactivityID, _args = []):
	getSexEngine().switchActivity(self, newactivityID, _args)

func getTags(_indx:int) -> Array:
	return []

func getCheckTagsDom() -> Array:
	return getTags(DOM_0)

func getCheckTagsSub() -> Array:
	return getTags(SUB_0)

func processTurnFinal():
	if(has_method(getStatePrefix()+"_processTurn")):
		call(getStatePrefix()+"_processTurn")
	processTurn()

func processTurn():
	pass

func reactActivityEnd(_otheractivity):
	pass
	
func getAnimationPriority():
	return 10

func getAnimation():
	return null

func isAnimOptional() -> bool:
	return false

func getAnimationFinal():
	var theAnim = getAnimation()
	if(theAnim == null):
		return null
	if(theAnim.size() <= 2):
		theAnim.append({})
		return theAnim
	var theDict:Dictionary = theAnim[2]
	for field in ["pc", "npc", "npc2", "npc3"]:
		if(theDict.has(field)):
			if(theDict[field] is int):
				theDict[field] = getDomOrSubID(theDict[field])
	return theAnim

func isSub(_charID:String) -> bool:
	for theSubInfo in subs:
		if(theSubInfo.getCharID() == _charID):
			return true
	return false

func isDom(_charID:String) -> bool:
	for theDomInfo in doms:
		if(theDomInfo.getCharID() == _charID):
			return true
	return false

func isInvolved(_charID:String) -> bool:
	if(isSub(_charID) || isDom(_charID)):
		return true
	return false

func checkActiveDomPC(_indx:int) -> bool:
	var _i:int = 0
	for theDomInfo in doms:
		if(theDomInfo.getCharID() == "pc" && theDomInfo.canDoActions()):
			if(_indx != _i):
				return true
		_i += 1
	return false

func affectSub(howmuch:float, lustMod, resistanceMod, fearMod):
	if(lustMod != 0.0):
		getSub().addLust(int(round(howmuch * lustMod * 100.0)))
	if(resistanceMod != 0.0):
		getSubInfo(0).addResistance(howmuch * resistanceMod)
	if(fearMod != 0.0):
		getSubInfo(0).addFear(max(howmuch * fearMod, 0.01))

func affectDom(howmuch:float, lustMod, angerMod):
	if(lustMod != 0.0):
		getDom().addLust(int(round(howmuch * lustMod * 100.0)))
	if(angerMod != 0.0):
		getDomInfo(0).addAnger(howmuch * angerMod)

func getOrgasmHandlePriority(_indx:int) -> int:
	return -1

func isHandlingOrgasms(_indx:int) -> bool:
	return getOrgasmHandlePriority(_indx) >= getSexEngine().getMaxOrgasmHandlePriority(getDomOrSubID(_indx))

func getResistScore(_indx:int) -> float:
	if(_indx >= 0):
		assert(false, "getResistScore function can only be called for subs!")
		return 0.0
	var theInfo := getDomOrSubInfo(_indx)
	if(!theInfo):
		Log.printerr("getResistScore: No character with id "+str(_indx)+" found in the sex activity")
		return 0.0
	return theInfo.getResistScore()

func getComplyScore(_indx:int) -> float:
	if(_indx >= 0):
		assert(false, "getComplyScore function can only be called for subs!")
		return 0.0
	var theInfo := getDomOrSubInfo(_indx)
	if(!theInfo):
		Log.printerr("getComplyScore: No character with id "+str(_indx)+" found in the sex activity")
		return 0.0
	return theInfo.getComplyScore()

func getGenericOrgasmData(_indx:int, extraText = ""):
	var theCharID:String = getDomOrSubID(_indx)
	if(theCharID == ""):
		return ""
	var character:BaseCharacter = getDomOrSub(_indx)
	if(!character):
		return ""
	var text = RNG.pick([
		"A [b]powerful orgasm[/b] overwhelms {<ORGASMER>.your} body"+str(extraText)+".",
		"[b]{<ORGASMER>.You} {<ORGASMER>.youVerb('cum')}[/b] hard"+str(extraText)+"!",
	])
	
	if(character.hasPenis()):
		if(character.isWearingChastityCage()):
			text += RNG.pick([
				" {<ORGASMER>.YourHis} "+RNG.pick(["cock", "dick", "member"])+" wastes its load through the tight chastity cage!",
				" {<ORGASMER>.YourHis} "+RNG.pick(["cock", "dick", "member"])+" shoots out a weak load through the hole in the chastity cage!",
				" {<ORGASMER>.YourHis} "+RNG.pick(["cock", "dick", "member"])+" throbs inside the locked chastity cage and wastes its seed!",
			])
		else:
			text += RNG.pick([
				" {<ORGASMER>.YourHis} "+RNG.pick(["cock", "dick", "member"])+" wastes its load!",
				" {<ORGASMER>.YourHis} "+RNG.pick(["cock", "dick", "member"])+" shoots out a load!",
				" {<ORGASMER>.YourHis} "+RNG.pick(["cock", "dick", "member"])+" throbs while wasting its seed!",
			])
	if(character.hasVagina()):
		text += RNG.pick([
			" {<ORGASMER>.YourHis} "+RNG.pick(["pussy", "slit"])+" gets tight!",
			" {<ORGASMER>.YourHis} "+RNG.pick(["pussy", "slit"])+" clenches and twitches!",
			" {<ORGASMER>.YourHis} "+RNG.pick(["pussy", "slit"])+" pulsates irregularly!",
			" {<ORGASMER>.YourHis} "+RNG.pick(["pussy", "slit"])+" squirts!",
		])
	if(character.getWornPenisPump() != null):
		var penisPump:ItemBase = character.getWornPenisPump()
		var howMuchFluids = penisPump.getFluids().getFluidAmount()
		var isFull = penisPump.getFluids().isFull()
		text += RNG.pick([
			" {<ORGASMER>.YourHis} penis pump collects the load and now holds "+str(Util.roundF(howMuchFluids, 1))+" ml of {<ORGASMER>.cum}!"
		])
		if(isFull):
			text += RNG.pick([
				" The pump is full!"
			])
	
	text = text.replace("<ORGASMER>", theCharID)
	
	return text

func addGenericOrgasmText(_indx:int, extraText:String = ""):
	addText(getGenericOrgasmData(_indx, extraText))

func applyTallymarkIfNeeded(bodypartSlot:String):
	#if(getDom().isPlayer()):
	#	return null
	
	var chanceToAdd = 0.0
	var domBodywritingsScale: float = (getDomInfo(0).fetishScore({Fetish.Bodywritings: 1.0}) + 1.0)/2.0 # makes it a [0.0-1.0] value
	
	if(getSub().hasTallymarks() || getSexType() in [SexType.SlutwallSex, SexType.StocksSex]):
		chanceToAdd = 200.0
	else:
		chanceToAdd = (max(0.0, getDomInfo(0).fetishScore({Fetish.Bodywritings: 1.0})) + getDomInfo(0).personalityScore({PersonalityStat.Mean: 0.3})) * 100.0
		if(!getDomInfo(0).isAngry()):
			chanceToAdd *= 0.5
	chanceToAdd *= domBodywritingsScale
	
	if(!RNG.chance(chanceToAdd)):
		return
	
	var theZone = null
	if(bodypartSlot == BodypartSlot.Head):
		theZone = getSub().addTallymarkFace()
	elif(bodypartSlot == BodypartSlot.Vagina):
		theZone = getSub().addTallymarkCrotch()
	else:
		theZone = getSub().addTallymarkButt()
	var zoneText = "body"
	if(theZone != null && theZone is int):
		zoneText = BodyWritingsZone.getZoneVisibleName(theZone)
	
	addTextPick([
		"{dom.You} "+RNG.pick(["{dom.youVerb('draw')}"])+" a [b]tallymark[/b] on {sub.your} "+zoneText+".",
		"{dom.You} "+RNG.pick(["{dom.youVerb('add')}"])+" a [b]tallymark[/b] to {sub.your} "+zoneText+".",
	])

func sendSexEvent(type, sourceIndx:int = DOM_0, targetIndx:int = SUB_0, data = {}):
	var source:String = getDomOrSubID(sourceIndx)
	var target:String = getDomOrSubID(targetIndx)
	if(source == ""):
		source = getDomID(0)
	if(target == ""):
		target = getSubID(0)
	
	var newSexEvent:SexEvent = SexEvent.new()
	newSexEvent.type = type
	newSexEvent.sourceCharID = source
	newSexEvent.targetCharID = target
	newSexEvent.data = data
	newSexEvent.isSexEngine = true
	newSexEvent.sexEngine = getSexEngine()
	
	getDom().sendSexEvent(newSexEvent)
	if(getSub() != getDom()):
		getSub().sendSexEvent(newSexEvent)
	
func damageClothes(_indx:int) -> String:
	var damageClothesResult = getDomOrSub(_indx).damageClothes()
	if(damageClothesResult[0]):
		return "[b]"+damageClothesResult[2].getVisibleName()+" got damaged![/b] "+damageClothesResult[1]
	return ""
	
func getState() -> String:
	return state

func getStatePrefix() -> String:
	if(state == ""):
		return "init"
	return state

func setState(_newState:String):
	state = _newState
	
func saveData():
	var subsData:Array = []
	for theSubInfo in subs:
		subsData.append(theSubInfo.getCharID())
	var domsData:Array = []
	for theDomInfo in doms:
		domsData.append(theDomInfo.getCharID())
	
	var data = {
		"uniqueID": uniqueID,
		"subs": subsData,
		"doms": domsData,
		"hasEnded": hasEnded,
		"state": state,
	}

	return data
	
func loadData(data):
	uniqueID = SAVE.loadVar(data, "uniqueID", 0)
	hasEnded = SAVE.loadVar(data, "hasEnded", false)
	state = SAVE.loadVar(data, "state", "")
	
	var theSexEngine := getSexEngine()
	
	var subsData:Array = SAVE.loadVar(data, "subs", [])
	subs.clear()
	for theSubID in subsData:
		subs.append(theSexEngine.getSubInfo(theSubID))
	
	var domsData:Array = SAVE.loadVar(data, "doms", [])
	doms.clear()
	for theDomID in domsData:
		doms.append(theSexEngine.getDomInfo(theDomID))

# Condition stuff below
enum {
	COND_HasReachablePenisOrStrapon,
	COND_AllowUnconsciousOrDowned,
}

func doesCharSatisfyCondition(_sexEngine, _charInfo:SexInfoBase, condEntry) -> bool:
	var _char:BaseCharacter = _charInfo.getChar()
	if(condEntry == COND_HasReachablePenisOrStrapon):
		if(!_char.hasReachablePenis() && !_char.isWearingStrapon()):
			return false
	
	return true

func getDomIDsThatSatisfyConditions(_sexEngine, _condList:Array, _amount:int, _ignoreList:Array) -> Array:
	var result:Array = []
	
	var allowUncon:bool = (COND_AllowUnconsciousOrDowned in _condList)
	
	var theChars:Array = _sexEngine.doms.keys()
	theChars.shuffle()
	for theDomID in theChars:
		if(result.size() >= _amount):
			break
		if(theDomID in _ignoreList):
			continue
		var domInfo:SexDomInfo = _sexEngine.doms[theDomID]
		#var dom:BaseCharacter = domInfo.getChar()
		
		if(!allowUncon && domInfo.getIsDown()):
			continue
		
		for condEntry in _condList:
			if(!doesCharSatisfyCondition(_sexEngine, domInfo, condEntry)):
				continue
		result.append(theDomID)
	
	return result

func hasDomIDsThatSatisfyConditions(_sexEngine, _condList:Array, _amount:int, _ignoreList:Array) -> bool:
	if((_sexEngine.doms.size()-_ignoreList.size()) < _amount):
		return false
	return getDomIDsThatSatisfyConditions(_sexEngine, _condList, _amount, _ignoreList).size() == _amount

func getSubIDsThatSatisfyConditions(_sexEngine, _condList:Array, _amount:int, _ignoreList:Array) -> Array:
	var result:Array = []
	
	var allowUncon:bool = (COND_AllowUnconsciousOrDowned in _condList)
	
	var theChars:Array = _sexEngine.subs.keys()
	theChars.shuffle()
	for theSubID in theChars:
		if(result.size() >= _amount):
			break
		if(theSubID in _ignoreList):
			continue
		var subInfo:SexSubInfo = _sexEngine.subs[theSubID]
		
		if(!allowUncon && subInfo.isUnconscious()):
			continue
		
		for condEntry in _condList:
			if(!doesCharSatisfyCondition(_sexEngine, subInfo, condEntry)):
				continue
		result.append(theSubID)
	
	return result

func hasSubIDsThatSatisfyConditions(_sexEngine, _condList:Array, _amount:int, _ignoreList:Array) -> bool:
	if((_sexEngine.subs.size()-_ignoreList.size()) < _amount):
		return false
	return getSubIDsThatSatisfyConditions(_sexEngine, _condList, _amount, _ignoreList).size() == _amount

func pullInDom(_otherDomID:String, stopTheirActivities:bool = true):
	if(isDom(_otherDomID)):
		return
	var theSexEngine := getSexEngine()
	if(stopTheirActivities):
		theSexEngine.stopActivitiesThatInvolveCharID(_otherDomID)
	doms.append(theSexEngine.getDomInfo(_otherDomID))


# Building blocks below


func doCumPussyLickDom():
	var text:String = RNG.pick([
		"{dom.You} {dom.youVerb('shake')} and {dom.youVerb('shiver')} while {dom.yourHis} "+RNG.pick(["pulsating", "twitching"])+" "+RNG.pick(["pussy", "pussy", "slit", "kitty"])+" [b]"+RNG.pick(["cums", "squirts", "orgasms", "climaxes"])+" all over {sub.your} face[/b]!",
	])
	if(getDom().getFirstItemThatCoversBodypart(InventorySlot.Vagina) != null):
		text = RNG.pick([
			"{dom.You} {dom.youVerb('shake')} and {dom.youVerb('shiver')} while {dom.yourHis} "+RNG.pick(["pulsating", "twitching"])+" "+RNG.pick(["pussy", "pussy", "slit", "kitty"])+" [b]"+RNG.pick(["makes", "creates"])+" a wet spot on {dom.yourHis} clothing[/b]!",
		])
	else:
		if(getSub().isOralBlocked()):
			getSub().cummedOnBy(getDomID(0), FluidSource.Vagina)
		else:
			getSub().cummedInMouthBy(getDomID(0), FluidSource.Vagina, 0.5)
			getSub().cummedOnBy(getDomID(0), FluidSource.Vagina, 0.5)
	
	if(getDom().hasReachablePenis()):
		getDom().cumOnFloor()
		text += RNG.pick([
			" {dom.YourHis} "+RNG.pick(["cock", "dick"])+" throbs while shooting strings of "+RNG.pick(["cum", "seed", "semen"])+"!",
		])
	
	getDomInfo(0).cum()

	addText(text)

func doCumBJDom(isDeepthroat:bool = false):
	var text:String = RNG.pick([
		"{dom.You} {dom.youVerb('grunt')} while {dom.yourHis} "+RNG.pick(["cock", "dick", "member"])+" throbs and [b]shoots cum directly into {sub.your} mouth[/b].",
	])
	if(isDeepthroat):
		text = RNG.pick([
			"{dom.You} {dom.youVerb('ram')} {dom.yourHis} "+RNG.pick(["cock", "dick"])+" "+RNG.pick(["balls deep", "as deep as {sub.yourHis} throat allows", "deep down {sub.yourHis} throat"])+" before [b]stuffing {sub.yourHis} belly with lots of cum[/b]!",
		])
	
	var condomBroke:bool = false
	var condom:ItemBase = getDom().getWornCondom()
	if(condom != null):
		var breakChance:float = condom.getCondomBreakChance()
		condomBroke = getDom().shouldCondomBreakWhenFucking(getSub(), breakChance)
		if(condomBroke):
			text = "[b]The condom broke![/b] "+text
			condom.destroyMe()
		else:
			text = RNG.pick([
				"{dom.You} filled the condom inside {sub.your} "+RNG.pick(["mouth"])+"!",
				"{dom.You} stuffed the condom in {sub.your} "+RNG.pick(["mouth"])+" full of {dom.yourHis} "+RNG.pick(["cum", "seed", "jizz", "semen"])+"!",
			])
			getDom().cumInItem(condom)
			getDomInfo(0).cum()
			
			condom.destroyMe()
			getSexEngine().saveCondomToLootIfPerk(condom)
			text += RNG.pick([
				" {dom.You} {dom.youVerb('pull')} out and {dom.youVerb('dispose')} of the used condom.",
			])
			addText(text)
			return
	var beingBredScore:float = getSubInfo(0).fetishScore({Fetish.OralSexGiving: 1.0})
	if(beingBredScore < 0.0):
		getSubInfo(0).addResistance(1.0)
		getSubInfo(0).addFear(0.1)
	getSub().cummedInBodypartByAdvanced(BodypartSlot.Head, getDomID(0), {condomBroke=condomBroke})
	getDomInfo(0).cum()
	
	if(condom != null):
		condom.destroyMe()
		text += RNG.pick([
			" {dom.You} {dom.youVerb('pull')} out and {dom.youVerb('dispose')} of the used condom.",
		])
	
	#return getSexEngine().combineData({text=text}, applyTallymarkIfNeededData(BodypartSlot.Head))
	addText(text)


func doCumBJFacialsDom():
	var text:String = RNG.pick([
		"{dom.You} {dom.youVerb('pull')} {dom.yourHis} cock out and [b]cums all over {sub.your} face[/b]!",
		"{dom.You} {dom.youVerb('pull')} out, [b]cumming all over {sub.your} face[/b]!",
	])
	
	var condom:ItemBase = getDom().getWornCondom()
	if(condom != null):
		var breakChance:float = condom.getCondomBreakChance()
		
		if(RNG.chance(breakChance)):
			text = "[b]The condom broke![/b] "+text
			condom.destroyMe()
		else:
			text = RNG.pick([
				"{dom.You} {dom.youVerb('pull')} {dom.yourHis} cock out and {dom.youVerb('fill')} {dom.yourHis} condom! {dom.You} {dom.youVerb('dispose')} of it.",
				"{dom.You} {dom.youVerb('pull')} out, stuffing {dom.yourHis} condom! {dom.You} {dom.youVerb('dispose')} of it.",
			])
			condom.destroyMe()
			getDom().cumInItem(condom)
			getSexEngine().saveCondomToLootIfPerk(condom)
			getDomInfo(0).cum()
			#satisfyGoals()
			#state = ""
			addText(text)
			return
	
	getSub().cummedOnBy(getDomID(0), FluidSource.Penis)
	getDom().cumOnFloor()
	getDomInfo(0).cum()
	#satisfyGoals()
	#state = ""

	addText(text)


func doCumPussyLickSub(supposedToBeAngry:bool = true):
	#satisfyGoals()
	
	var noPermissionText:String = " {sub.YouHe} [b]came without {dom.yourHis} permission[/b]!" if supposedToBeAngry else ""
	if(getSexType() == SexType.SlutwallSex):
		noPermissionText = ""
		supposedToBeAngry = false
	
	var text:String = ""
	text = RNG.pick([
		"{sub.You} {sub.youVerb('arch', 'arches')} {sub.yourHis} back while {sub.yourHis} "+RNG.pick(["pussy", "pussy slit", "kitty"])+" twitches and squirts all over {dom.your} face!"+noPermissionText,
	])
	getDom().cummedOnBy(getSubID(0), FluidSource.Vagina)
	getSubInfo(0).cum()
	if(getSub().isWearingChastityCage()):
		text += RNG.pick([
			" {sub.YourHis} "+RNG.pick(["cock", "dick", "penis"])+" shoots out a weak load through the chastity cage but that one was easy to avoid.",
		])
	elif(getSub().hasReachablePenis()):
		text += RNG.pick([
			" {sub.YourHis} "+RNG.pick(["cock", "dick", "penis"])+" shoots out a load but at least {dom.you} {dom.youVerb('avoid')} that one.",
		])
	
	#endActivity()
	if(supposedToBeAngry):
		getDomInfo(0).addAnger(0.5)
		text += RNG.pick([
			" That made {dom.you} very angry.",
		])
	addText(text)
	
func doCumBJSub(supposedToBeAngry:bool = true):
	#satisfyGoals()
	
	var noPermissionText:String = " {sub.YouHe} [b]came without {dom.yourHis} permission[/b]!" if supposedToBeAngry else ""
	if(getSexType() == SexType.SlutwallSex):
		noPermissionText = ""
		supposedToBeAngry = false
	
	var text:String = ""

	text = RNG.pick([
		"{sub.You} {sub.youVerb('grunt')} while {sub.yourHis} "+RNG.pick(["cock", "dick", "shaft"])+" throbs and suddenly shoots strings of "+RNG.pick(["cum", "seed", "semen"])+" directly into {dom.your} mouth!"+noPermissionText,
	])
	
	var condomBroke = false
	var condom:ItemBase = getSub().getWornCondom()
	if(condom != null):
		var breakChance:float = condom.getCondomBreakChance()
		condomBroke = getSub().shouldCondomBreakWhenFucking(getDom(), breakChance)
		if(condomBroke):
			text = "[b]The condom broke![/b] "+text
			condom.destroyMe()
		else:
			text = RNG.pick([
				"{sub.You} {sub.youVerb('grunt')} while {sub.yourHis} "+RNG.pick(["cock", "dick", "shaft"])+" throbs and suddenly starts to stuff the condom with {sub.yourHis} "+RNG.pick(["cum", "seed", "semen"])+"!"+noPermissionText,
			])
			getSub().cumInItem(condom)
			getSubInfo(0).cum()
			#endActivity()
			if(supposedToBeAngry):
				getDomInfo(0).addAnger(0.5)
				text += RNG.pick([
					" That made {dom.you} very angry.",
				])
			text += RNG.pick([
				" {dom.You} {dom.youVerb('dispose')} of the used condom.",
			])
			condom.destroyMe()
			getSexEngine().saveCondomToLootIfPerk(condom)
			
			addText(text)
			return
	
	getDom().cummedInMouthByAdvanced(getSubID(0), {condomBroke=condomBroke})
	getSubInfo(0).cum()
	
	#endActivity()
	if(supposedToBeAngry):
		getDomInfo(0).addAnger(0.5)
		text += RNG.pick([
			" That made {dom.you} very angry.",
		])
	addText(text)


func doCumBJFacialsSub(supposedToBeAngry:bool = true):
	#satisfyGoals()
	
	var noPermissionText:String = " {sub.YouHe} [b]came without {dom.yourHis} permission[/b]!" if supposedToBeAngry else ""
	if(getSexType() == SexType.SlutwallSex):
		noPermissionText = ""
		supposedToBeAngry = false
	
	var text:String = ""

	text = RNG.pick([
		"{sub.You} {sub.youVerb('grunt')} while {sub.yourHis} "+RNG.pick(["cock", "dick", "shaft"])+" throbs and suddenly shoots strings of "+RNG.pick(["cum", "seed", "semen"])+" that land directly on {dom.your} face!"+noPermissionText,
	])
	if(getSub().isWearingChastityCage()):
		text = RNG.pick([
			"{sub.You} {sub.youVerb('grunt')} while {sub.yourHis} locked away "+RNG.pick(["cock", "dick", "shaft"])+" throbs in its tight contains and suddenly shoots a few weak strings of "+RNG.pick(["cum", "seed", "semen"])+" through the chastity cage that land on {dom.your} face!"+noPermissionText,
		])
		
	var condom:ItemBase = getSub().getWornCondom()
	if(condom != null):
		var breakChance:float = condom.getCondomBreakChance()
		
		if(RNG.chance(breakChance)):
			text = "[b]The condom broke![/b] "+text
			condom.destroyMe()
		else:
			text = RNG.pick([
				"{sub.You} {sub.youVerb('grunt')} while {sub.yourHis} "+RNG.pick(["cock", "dick", "shaft"])+" throbs and suddenly starts to stuff the condom with {sub.yourHis} "+RNG.pick(["cum", "seed", "semen"])+"!"+noPermissionText,
			])
			getSub().cumInItem(condom)
			getSubInfo(0).cum()
			#endActivity()
			if(supposedToBeAngry):
				getDomInfo(0).addAnger(0.5)
				text += RNG.pick([
					" That made {dom.you} very angry.",
				])
			text += RNG.pick([
				" {dom.You} {dom.youVerb('dispose')} of the used condom.",
			])
			condom.destroyMe()
			getSexEngine().saveCondomToLootIfPerk(condom)
			
			addText(text)
			return
		
	getDom().cummedOnBy(getSubID(0), FluidSource.Penis)
	getSubInfo(0).cum()

	#endActivity()
	if(supposedToBeAngry):
		getDomInfo(0).addAnger(0.5)
		text += RNG.pick([
			" That made {dom.you} very angry.",
		])
	addText(text)



func doSpitCumIntoHoleDom(bodypartSlot = BodypartSlot.Vagina):
	var mixtureText:String = getDom().getBodypartContentsStringList(BodypartSlot.Head)
	var locationName:String = ("{sub.pussyStretch} "+RNG.pick(["pussy", "slit"]) if bodypartSlot == BodypartSlot.Vagina else ("{sub.anusStretch} "+RNG.pick(["anus"])))
	var text:String = RNG.pick([
		"{dom.You} {dom.youVerb('press', 'presses')} {dom.yourHis} lips against {sub.yourHis} "+locationName+" and [b]{dom.youVerb('spit')} "+mixtureText+" into it[/b]!",
	])
	var howMuch = getDom().bodypartTransferFluidsToAmount(BodypartSlot.Head, getSubID(0), bodypartSlot, 0.2, 20.0)
	if(getSub().hasWombIn(bodypartSlot)):
		affectSub(getSubInfo(0).fetishScore({Fetish.BeingBred:1.0}), 0.1, -0.1, -0.05)
	elif(bodypartSlot == BodypartSlot.Vagina):
		affectSub(getSubInfo(0).fetishScore({Fetish.OralSexReceiving:1.0}), 0.1, -0.1, -0.05)
	elif(bodypartSlot == BodypartSlot.Anus):
		affectSub(getSubInfo(0).fetishScore({Fetish.RimmingReceiving:1.0}), 0.1, -0.1, -0.05)
	sendSexEvent(SexEvent.HoleSpitted, DOM_0, SUB_0, {hole=bodypartSlot, loadSize=howMuch})
	addText(text)

func doSpitCumIntoHoleSub(bodypartSlot = BodypartSlot.Vagina):
	var mixtureText = getSub().getBodypartContentsStringList(BodypartSlot.Head)
	var locationName:String = ("{dom.pussyStretch} "+RNG.pick(["pussy", "slit"]) if bodypartSlot == BodypartSlot.Vagina else ("{dom.anusStretch} "+RNG.pick(["anus"])))
	var text = RNG.pick([
		"{sub.You} {sub.youVerb('press', 'presses')} {sub.yourHis} lips against {dom.yourHis} "+locationName+" and [b]{sub.youVerb('spit')} "+mixtureText+" into it[/b]!",
	])
	var howMuch = getSub().bodypartTransferFluidsToAmount(BodypartSlot.Head, getDomID(0), bodypartSlot, 0.2, 20.0)
	if(getDom().hasWombIn(bodypartSlot)):
		affectDom(getDomInfo(0).fetishScore({Fetish.BeingBred:1.0}), 0.1, -0.1)
	elif(bodypartSlot == BodypartSlot.Vagina):
		affectDom(getDomInfo(0).fetishScore({Fetish.OralSexReceiving:1.0}), 0.1, -0.1)
	elif(bodypartSlot == BodypartSlot.Anus):
		affectDom(getDomInfo(0).fetishScore({Fetish.RimmingReceiving:1.0}), 0.1, -0.1)
	sendSexEvent(SexEvent.HoleSpitted, SUB_0, DOM_0, {hole=bodypartSlot, loadSize=howMuch})
	addText(text)

func isWearingStrapon(_indx:int) -> bool:
	var theChar:BaseCharacter = getDomOrSub(_indx)
	if(!theChar):
		return false
	return theChar.isWearingStrapon()

# Just shorter func name
func isStrapon(_indx:int) -> bool:
	var theChar:BaseCharacter = getDomOrSub(_indx)
	if(!theChar):
		return false
	return theChar.isWearingStrapon()

func getPenisSensitivity(_indx:int) -> float:
	var theChar:BaseCharacter = getDomOrSub(_indx)
	if(!theChar):
		return 1.0
	var strapon = theChar.getWornStrapon()
	if(strapon == null):
		return 1.0
	return strapon.getStraponPleasureForDom()
	
func doBlowjobTurnDom():
	stimulate(SUB_0, S_MOUTH, DOM_0, S_PENIS, I_NORMAL, Fetish.OralSexGiving)
	#affectSub(getSubInfo(0).fetishScore({Fetish.OralSexGiving: 1.0})+0.1, 0.1, -0.1, -0.01)
	#affectDom(getDomInfo(0).fetishScore({Fetish.OralSexReceiving: 0.5})+0.6, 0.1*getDomPenisSensetivity(), 0.0)
	#getSubInfo(0).addArousalForeplay(0.03)
	#getDomInfo(0).stimulateArousalZone(0.2, BodypartSlot.Penis, 1.0)
	getSub().gotOrificeStretchedBy(BodypartSlot.Head, getDomID(0), true, 0.05)
	
	var text = RNG.pick([
		"{dom.Your} "+getNamePenis(DOM_0)+" is being sucked by {sub.youHim}.",
		"{sub.You} {sub.youAre} "+RNG.pick(["sucking", "blowing"])+" {dom.yourHis} "+getNamePenis(DOM_0)+".",
		"{sub.You} {sub.youAre} wrapping {sub.yourHis} lips tightly around {dom.your} "+getNamePenis(DOM_0)+".",  
		"{sub.You} {sub.youAre} teasing the tip of {dom.your} "+getNamePenis(DOM_0)+ " with {sub.yourHis} tongue.",  
		"{sub.You} {sub.youVerb('bob')} {sub.yourHis} head along {dom.your} "+getNamePenis(DOM_0)+", taking it deeper.",  
		"{sub.You} {sub.youAre} running {sub.yourHis} tongue along the underside of {dom.your} "+getNamePenis(DOM_0)+".",  
		"{sub.You} {sub.youAre} sucking eagerly on {dom.your} "+getNamePenis(DOM_0)+", drawing a moan from {dom.youHim}.",  
		"{sub.You} {sub.youVerb('swirl')} {sub.yourHis} tongue around the head of {dom.your} "+getNamePenis(DOM_0)+".",  
		"{sub.You} {sub.youVerb('take')} {dom.your} "+getNamePenis(DOM_0)+ " further into {sub.yourHis} mouth, sucking hard.",  
		"{sub.You} {sub.youVerb('press', 'presses')} {sub.yourHis} tongue firmly against {dom.your} "+getNamePenis(DOM_0)+", sliding it slowly along its length.",  
	])
	
	if(!getSubInfo(0).isUnconscious()):
		if(RNG.chance(30)):
			text += RNG.pick([
				" Wet slurping noises can be heard from {sub.you}.",
				" {sub.You} {sub.youAre} making wet noises with {sub.yourHis} mouth.",
				" {sub.You} {sub.youVerb('try', 'tries')} to work that tongue.",
			])
	else:
		text = RNG.pick([
			"{dom.You} {dom.youVerb('use')} {sub.yourHis} "+RNG.pick(["mouth", "lips", "tongue"])+" for {dom.yourHis} pleasure.",
			"{dom.You} "+RNG.pick(["forcefully {dom.youVerb('move')}", "{dom.youVerb('move')}"])+" {sub.yourHis} head back and forth over {dom.yourHis} "+getNamePenis(DOM_0)+"."
		])
		
		if(RNG.chance(30)):
			text += RNG.pick([
				" Wet slurping noises can be heard from {sub.you}.",
				" {sub.You} {sub.youAre} making wet noises with {sub.yourHis} mouth.",
			])
	
	if(isWearingStrapon(DOM_0)):
		if(getDomInfo(0).isReadyToCum()):
			text += RNG.pick([
				" {dom.YouHe} {dom.youAre} about to cum!",
				" {dom.YouHe} {dom.youAre} edging {dom.yourself}.",
				" {dom.YouHe} {dom.youAre} barely keeping {dom.yourself} from cumming.",
				" {dom.YouHe} reached {dom.yourHis} peak!",
			])
		elif(getDomInfo(0).isCloseToCumming()):
			text += RNG.pick([
				" {dom.YouHe} {dom.youAre} gonna cum soon!",
			])
	else:
		if(getDomInfo(0).isReadyToCum()):
			text += RNG.pick([
				" {dom.YouHe} {dom.youAre} about to cum!",
				" {dom.YouHe} {dom.youAre} edging {dom.yourself}.",
				" {dom.YourHis} "+RNG.pick(["cock", "dick", "member"])+" is twitching a lot.",
				" {dom.YouHe} {dom.youAre} barely keeping {dom.yourself} from cumming.",
				" {dom.YouHe} reached {dom.yourHis} peak!",
			])
		elif(getDomInfo(0).isCloseToCumming()):
			text += RNG.pick([
				" {dom.YouHe} {dom.youAre} leaking "+RNG.pick(["pre", "precum"])+" directly into that mouth.",
				" {dom.YouHe} {dom.youAre} gonna cum soon!",
				" {dom.YourHis} "+RNG.pick(["cock", "dick", "member"])+" is twitching slightly.",
			])
	addText(text)


func doDeepthroatTurnDom():
	getSub().gotOrificeStretchedBy(BodypartSlot.Head, getDomID(0), true, 0.1)
	#affectSub(getSubInfo(0).fetishScore({Fetish.OralSexGiving: 1.0})-0.3, 0.1, -0.1, -0.01)
	#affectDom(getDomInfo(0).fetishScore({Fetish.OralSexReceiving: 0.5})+0.6, 0.1*getDomPenisSensetivity(), 0.0)
	#getSubInfo(0).addArousalForeplay(0.06)
	#getDomInfo(0).stimulateArousalZone(0.25, BodypartSlot.Penis, 1.0)
	stimulate(SUB_0, S_MOUTH, DOM_0, S_PENIS, I_HIGH, Fetish.OralSexGiving)
	
	var text = RNG.pick([
		"{sub.You} {sub.youVerb('deepthroat')} that "+getNamePenis(DOM_0)+".",
	])
	if(getSubInfo(0).isUnconscious()):
		text = RNG.pick([
			"{sub.You} {sub.youAre} being forced to deepthroat that "+getNamePenis(DOM_0)+".",
			"{dom.You} {dom.youAre} forcing {sub.yourHis} head deep onto {dom.yourHis} "+getNamePenis(DOM_0)+".",
		])
	
	var freeRoom = getSub().getPenetrationFreeRoomBy(BodypartSlot.Head, getDomID(0))
	if(freeRoom > 3.0):
		text += RNG.pick([
			" {sub.Your} throat is deep enough for {sub.youHim} not to suffocate.",
			" {sub.You} {sub.youVerb('allow')} {dom.youHim} to fuck {sub.yourHis} throat easily.",
			" {sub.Your} throat stretches easily to accommodate for that length.",
			" There is a small "+RNG.pick(["bulge", "bump"])+" on {sub.yourHis} throat.",
		])
	else:
		getSubInfo(0).addConsciousness(-RNG.randf_range(0.05, 0.15))
		text += RNG.pick([
			" {sub.You} {sub.youVerb('choke')} and {sub.youVerb('gag')} because "+RNG.pick(["it's too big", "of its length", "of its size", "{sub.yourHis} throat is not stretched enough"])+".",
			" {sub.You} "+RNG.pick(["{sub.youVerb('choke')}", "{sub.youVerb('suffocate')}", "can't get enough air"])+"!",
			" "+RNG.pick(["A few tears stream", "A single tear streams"])+" down {sub.yourHis} cheeks while {sub.yourHis} throat is being "+RNG.pick(["fucked", "used", "stretched"])+".",
			" There is a noticable "+RNG.pick(["bulge", "bump"])+" on {sub.yourHis} throat.",
		])
	
	if(isWearingStrapon(DOM_0)):
		if(getDomInfo(0).isReadyToCum()):
			text += RNG.pick([
				" {dom.YouHe} {dom.youAre} about to cum!",
				" {dom.YouHe} {dom.youAre} edging {dom.yourself}.",
				" {dom.YouHe} {dom.youAre} barely keeping {dom.yourself} from cumming.",
				" {dom.YouHe} reached {dom.yourHis} peak!",
			])
		elif(getDomInfo(0).isCloseToCumming()):
			text += RNG.pick([
				" {dom.YouHe} {dom.youAre} gonna cum soon!",
			])
	else:
		if(getDomInfo(0).isReadyToCum()):
			text += RNG.pick([
				" {dom.YouHe} {dom.youAre} about to cum!",
				" {dom.YouHe} {dom.youAre} edging {dom.yourself}.",
				" {dom.YourHis} "+RNG.pick(["cock", "dick", "member"])+" is twitching a lot.",
				" {dom.YouHe} {dom.youAre} barely keeping {dom.yourself} from cumming.",
				" {dom.YouHe} reached {dom.yourHis} peak!",
			])
		elif(getDomInfo(0).isCloseToCumming()):
			text += RNG.pick([
				" {dom.YouHe} {dom.youAre} leaking "+RNG.pick(["pre", "precum"])+" directly into that mouth.",
				" {dom.YouHe} {dom.youAre} gonna cum soon!",
				" {dom.YourHis} "+RNG.pick(["cock", "dick", "member"])+" is twitching slightly.",
			])
	
	if(isWearingStrapon(DOM_0)):
		var strapon = getDom().getWornStrapon()
		if(strapon.getFluids() != null && RNG.chance(33) && !strapon.getFluids().isEmpty()):
			var extraMessages = []
			var fluidByAmount = strapon.getFluids().getFluidAmountByType()
			for fluidID in fluidByAmount:
				var fluidObject = GlobalRegistry.getFluid(fluidID)
				if(fluidObject == null):
					continue
				
				var resultMessage = fluidObject.onSwallow(getSub(), fluidByAmount[fluidID])
				if(resultMessage != null && resultMessage != ""):
					extraMessages.append(resultMessage)
			
			getSub().cummedInBodypartByAdvanced(BodypartSlot.Head, getDomID(0))
			text += " {dom.Your} strapon gets squeezed by {sub.your} "+RNG.pick(["throat"])+" enough for it to suddenly [b]release its contents inside {sub.yourHis} mouth[/b]!"
			if(extraMessages.size() > 0):
				text += " "+Util.join(extraMessages, " ")
	
	addText(text)

func doPussyLickingTurnDom():
	stimulate(SUB_0, S_MOUTH, DOM_0, S_VAGINA, I_NORMAL, Fetish.OralSexGiving)
	#affectSub(getSubInfo(0).fetishScore({Fetish.OralSexGiving: 1.0})+0.1, 0.1, -0.1, -0.01)
	#affectDom(getDomInfo(0).fetishScore({Fetish.OralSexReceiving: 0.5})+0.6, 0.1, 0.0)
	#getDomInfo(0).stimulateArousalZone(0.1, BodypartSlot.Vagina, 0.5)
	
	var clothingItem = getDom().getFirstItemThatCoversBodypart(BodypartSlot.Vagina)
	var throughTheClothing = ""
	if(clothingItem != null):
		throughTheClothing = " through the "+clothingItem.getCasualName()
	var text = RNG.pick([
		"{sub.You} {sub.youAre} licking {dom.yourHis} "+RNG.pick(["pussy", "pussy slit", "kitty", "petals", "slit", "folds"])+ throughTheClothing +".",
		"{sub.You} {sub.youAre} dragging {sub.yourHis} tongue over {dom.yourHis} "+RNG.pick(["pussy lips", "kitty", "slit", "petals", "folds", "clit and pussy"])+ throughTheClothing +".",
		"{sub.You} {sub.youAre} licking {dom.yourHis} "+RNG.pick(["pussy", "pussy slit", "kitty", "petals", "slit", "folds"])+ throughTheClothing+".",  
		"{sub.You} {sub.youAre} dragging {sub.yourHis} tongue over {dom.yourHis} "+RNG.pick(["pussy lips", "kitty", "slit", "petals", "folds", "clit and pussy"])+ throughTheClothing+".",  
		"{sub.You} {sub.youAre} exploring {dom.yourHis} "+RNG.pick(["pussy", "folds", "slit", "delicate petals", "heat", "sweetness"])+" with slow, teasing licks"+throughTheClothing+".",  
		"{sub.You} {sub.youAre} pressing {sub.yourHis} tongue against {dom.yourHis} "+RNG.pick(["pussy", "folds", "petals", "sensitive slit", "wetness", "delicate lips"])+ throughTheClothing+".",  
		"{sub.You} {sub.youAre} swirling {sub.yourHis} tongue over {dom.yourHis} "+RNG.pick(["clit and slit", "soft folds", "pussy lips", "petals", "sensitive areas"])+ throughTheClothing+".",  
		"{sub.You} {sub.youAre} savoring the taste of {dom.yourHis} "+RNG.pick(["pussy", "sweet petals", "intimate folds", "slit", "wetness", "sensitive clit and lips"])+ throughTheClothing+".",  
		"{sub.You} {sub.youAre} teasing {dom.yourHis} "+RNG.pick(["pussy", "delicate folds", "petals", "clit and lips", "slit", "soft wetness"])+" with deliberate, sensual licks"+throughTheClothing+".",  
		"{sub.You} {sub.youAre} running {sub.yourHis} tongue along {dom.yourHis} "+RNG.pick(["folds", "clit and pussy", "pussy lips", "slit", "heat", "delicate petals"])+ throughTheClothing+".",  
		"{sub.You} {sub.youAre} drawing slow, tantalizing circles with {sub.yourHis} tongue on {dom.yourHis} "+RNG.pick(["pussy", "soft folds", "slit", "intimate lips", "petals", "delicate skin"])+ throughTheClothing+".",  
		"{sub.You} {sub.youAre} gently flicking {sub.yourHis} tongue over {dom.yourHis} "+RNG.pick(["pussy lips", "soft slit", "folds", "petals", "clit", "intimate heat"])+ throughTheClothing+".",  
		"{sub.You} {sub.youAre} firmly dragging {sub.yourHis} tongue across {dom.yourHis} "+RNG.pick(["wet lips", "folds", "pussy", "slit", "petals", "clit and folds"])+ throughTheClothing+".",  
		"{sub.You} {sub.youAre} spreading {dom.yourHis} "+RNG.pick(["folds", "soft lips", "pussy", "delicate petals", "slit", "wetness"])+" with {sub.yourHis} tongue"+throughTheClothing+".",  

	])
	if(getSubInfo(0).isUnconscious()):
		text = RNG.pick([
			"{dom.You} {dom.youVerb('rub')} {dom.yourHis} "+RNG.pick(["pussy", "slit", "kitty"])+" over {sub.yourHis} tongue"+throughTheClothing+".",
			"{dom.You} {dom.youVerb('use')} {sub.yourHis} tongue on {dom.yourHis} "+RNG.pick(["pussy", "slit", "kitty"])+" for {dom.yourHis} pleasure.",
		])
	
	if(clothingItem == null):
		if(getDom().hasEffect(StatusEffect.HasCumInsideVagina)):
			if(RNG.chance(30) && OPTIONS.isContentEnabled(ContentType.CumStealing)):
				var _howMuch = getDom().bodypartTransferFluidsToAmount(BodypartSlot.Vagina, getSubID(0), BodypartSlot.Head, 0.2, 20.0)
				text += RNG.pick([ 
					" "+Util.capitalizeFirstLetter(getDom().getBodypartContentsStringList(BodypartSlot.Vagina))+" [b]"+RNG.pick(["oozes", "leaks"])+" out[/b] of {dom.yourHis} "+RNG.pick(["", "used ", "stuffed "])+RNG.pick(["pussy", "slit", "kitty"])+".",
				])
	
	if(getDomInfo(0).isReadyToCum()):
		text += RNG.pick([
			" {dom.YouHe} {dom.youAre} about to cum!",
			" {dom.YouHe} {dom.youAre} edging {dom.yourself}.",
			" {dom.YourHis} "+RNG.pick(["pussy", "pussy slit"])+" is twitching a lot.",
			" {dom.YourHis} "+RNG.pick(["pussy", "pussy slit"])+" is leaking arousal a lot.",
			" {dom.YouHe} {dom.youAre} barely keeping {dom.yourself} from cumming.",
			" {dom.YouHe} reached {dom.yourHis} peak!",
		])
	elif(getDomInfo(0).isCloseToCumming()):
		text += RNG.pick([
			" {dom.You} "+RNG.pick(["{dom.youVerb('let')} out some moans", "{dom.youVerb('let')} out a moan", "{dom.youVerb('bite')} {dom.yourHis} lip", "{dom.youVerb('breathe')} deeply"])+" while {dom.yourHis} pussy "+RNG.pick(["gets more wet", "leaks arousal", "becomes more aroused", "drips arousal", "lets out an aroused scent"])+"."
		])
	
	addText(text)
	if(RNG.chance(10)):
		talk(DOM_0, SUB_0, SexReaction.DomsPussyGetsLicked)

func doPussyGrindingTurnDom():
	#affectSub(getSubInfo(0).fetishScore({Fetish.OralSexGiving: 1.0})-0.1, 0.1, -0.1, -0.01)
	#affectDom(getDomInfo(0).fetishScore({Fetish.OralSexReceiving: 0.5})+0.6, 0.1, 0.0)
	#getDomInfo(0).stimulateArousalZone(0.1, BodypartSlot.Vagina, 0.5)
	stimulate(SUB_0, S_MOUTH, DOM_0, S_VAGINA, I_HIGH, Fetish.OralSexGiving)
	
	var clothingItem = getDom().getFirstItemThatCoversBodypart(BodypartSlot.Vagina)
	var throughTheClothing = ""
	if(clothingItem != null):
		throughTheClothing = " through the "+clothingItem.getCasualName()
	var text:String = RNG.pick([
		"{dom.You} {dom.youAre} grinding {dom.yourHis} "+RNG.pick(["pussy", "pussy slit", "kitty", "petals", "slit", "folds"])+" over {sub.yourHis} face"+ throughTheClothing +".",
		"{dom.You} {dom.youVerb('use')} {sub.yourHis} face for {dom.yourHis} pleasure by grinding it!",
	])
	
	if(clothingItem == null):
		if(getDom().hasEffect(StatusEffect.HasCumInsideVagina)):
			if(RNG.chance(30)):
				text += RNG.pick([ 
					" "+Util.capitalizeFirstLetter(getDom().getBodypartContentsStringList(BodypartSlot.Vagina))+" gets spread across {sub.yourHis} face.",
				])
	
	if(getDomInfo(0).isReadyToCum()):
		text += RNG.pick([
			" {dom.YouHe} {dom.youAre} about to cum!",
			" {dom.YouHe} {dom.youAre} edging {dom.yourself}.",
			" {dom.YourHis} "+RNG.pick(["pussy", "pussy slit"])+" is twitching a lot.",
			" {dom.YourHis} "+RNG.pick(["pussy", "pussy slit"])+" is leaking arousal a lot.",
			" {dom.YouHe} {dom.youAre} barely keeping {dom.yourself} from cumming.",
			" {dom.YouHe} reached {dom.yourHis} peak!",
		])
	elif(getDomInfo(0).isCloseToCumming()):
		text += RNG.pick([
			" {dom.You} "+RNG.pick(["{dom.youVerb('let')} out some moans", "{dom.youVerb('let')} out a moan", "{dom.youVerb('bite')} {dom.yourHis} lip", "{dom.youVerb('breathe')} deeply"])+" while {dom.yourHis} pussy "+RNG.pick(["gets more wet", "leaks arousal", "becomes more aroused", "drips arousal", "lets out an aroused scent"])+"."
		])
	
	addText(text)
	if(RNG.chance(10)):
		talk(DOM_0, SUB_0, SexReaction.GrindingFaceWithPussy)
		
func doBlowjobTurn(_indxActor:int, _indxTarget:int):
	if(_indxActor == SUB_0 && _indxTarget == DOM_0):
		doBlowjobTurnDom()
	elif(_indxActor == DOM_0 && _indxTarget == SUB_0):
		doBlowjobTurnSub()
	else:
		assert(false, "Unimplemented")

func doBlowjobTurnSub():
	stimulate(DOM_0, S_MOUTH, SUB_0, S_PENIS, I_NORMAL, Fetish.OralSexGiving)
	#affectSub(getSubInfo(0).fetishScore({Fetish.OralSexReceiving: 1.0})+0.6, 0.1, -0.1, -0.01)
	#affectDom(getDomInfo(0).fetishScore({Fetish.OralSexGiving: 0.5})+0.1, 0.1, 0.0)
	#getDomInfo(0).addArousalForeplay(0.03)
	#getSubInfo(0).stimulateArousalZone(0.2, BodypartSlot.Penis, 1.0)
	getDom().gotOrificeStretchedBy(BodypartSlot.Head, getSubID(0), true, 0.05)
	
	var text:String = RNG.pick([
		"{dom.You} {dom.youAre} sucking {sub.your} "+RNG.pick(["cock", "dick", "member"])+".",
		"{dom.You} {dom.youVerb('drag')} {dom.yourHis} lips over {sub.your} "+RNG.pick(["cock", "dick", "member", "length"])+", sucking it.",
		"{dom.You} {dom.youAre} wrapping {dom.yourHis} lips tightly around {sub.your} "+RNG.pick(["cock", "dick", "member"])+".",  
		"{dom.You} {dom.youAre} teasing the tip of {sub.your} "+RNG.pick(["cock", "dick", "length", "shaft"])+ " with {dom.yourHis} tongue.",  
		"{dom.You} {dom.youVerb('bob')} {dom.yourHis} head along {sub.your} "+RNG.pick(["dick", "cock", "shaft", "member"])+", taking it deeper.",  
		"{dom.You} {dom.youAre} running {dom.yourHis} tongue along the underside of {sub.your} "+RNG.pick(["cock", "length", "member"])+".",  
		"{dom.You} {dom.youAre} sucking eagerly on {sub.your} "+RNG.pick(["dick", "member", "shaft"])+", drawing a moan from {sub.youHim}.",  
		"{dom.You} {dom.youVerb('swirl')} {dom.yourHis} tongue around the head of {sub.your} "+RNG.pick(["cock", "dick", "member"])+".",  
		"{dom.You} {dom.youVerb('take')} {sub.your} "+RNG.pick(["length", "shaft", "cock"])+ " further into {dom.yourHis} mouth, sucking hard.",  
		"{dom.You} {dom.youVerb('press', 'presses')} {dom.yourHis} tongue firmly against {sub.your} "+RNG.pick(["cock", "dick", "member"])+", sliding it slowly along its length.",  
	])
	
	if(RNG.chance(30)):
		text += RNG.pick([
			" Wet slurping noises can be heard from {dom.you}.",
			" {dom.You} {dom.youAre} making wet noises with {dom.yourHis} mouth.",
			" {dom.You} {dom.youVerb('work')} that tongue around the length to provide extra stimulation.",
		])
	
	if(getSubInfo(0).isReadyToCum()):
		text += RNG.pick([
			" {sub.YouHe} {sub.youAre} about to cum!",
			" {sub.YouHe} {sub.youAre} being edged by {dom.youHim}.",
			" {sub.YourHis} "+RNG.pick(["cock", "dick", "member"])+" is twitching a lot.",
			" {sub.YouHe} {sub.youAre} barely keeping {sub.yourself} from cumming.",
			" {sub.YouHe} reached {sub.yourHis} peak!",
		])
	elif(getSubInfo(0).isCloseToCumming()):
		text += RNG.pick([
			" {sub.YouHe} {sub.youAre} leaking "+RNG.pick(["pre", "precum"])+" directly into {dom.yourHis} mouth.",
			" {sub.YouHe} {sub.youAre} gonna cum soon!",
			" {sub.YourHis} "+RNG.pick(["cock", "dick", "member"])+" is twitching slightly.",
		])
	addText(text)

func doPussyLickingTurn(_indxActor:int, _indxTarget:int):
	if(_indxActor == SUB_0 && _indxTarget == DOM_0):
		doPussyLickingTurnDom()
	elif(_indxActor == DOM_0 && _indxTarget == SUB_0):
		doPussyLickingTurnSub()
	else:
		assert(false, "Unimplemented")

func doPussyLickingTurnSub():
	stimulate(DOM_0, S_MOUTH, SUB_0, S_VAGINA, I_NORMAL, Fetish.OralSexGiving)
	#affectSub(getSubInfo(0).fetishScore({Fetish.OralSexReceiving: 1.0})+0.3, 0.1, -0.1, -0.01)
	#affectDom(getDomInfo(0).fetishScore({Fetish.OralSexGiving: 0.5})+0.6, 0.1, 0.0)
	#getSubInfo(0).stimulateArousalZone(0.1, BodypartSlot.Vagina, 0.5)
	
	var clothingItem = getSub().getFirstItemThatCoversBodypart(BodypartSlot.Vagina)
	var throughTheClothing = ""
	if(clothingItem != null):
		throughTheClothing = " through the "+clothingItem.getCasualName()
	var text:String = RNG.pick([
		"{dom.You} {dom.youAre} licking {sub.yourHis} "+RNG.pick(["pussy", "pussy slit", "kitty", "petals", "slit", "folds"])+ throughTheClothing +".",
		"{dom.You} {dom.youAre} dragging {dom.yourHis} tongue over {sub.yourHis} "+RNG.pick(["pussy lips", "kitty", "slit", "petals", "folds", "clit and pussy"])+ throughTheClothing +".",
		"{dom.You} {dom.youAre} exploring {sub.yourHis} "+RNG.pick(["pussy", "folds", "slit", "delicate petals", "heat", "sweetness"])+" with slow, teasing licks"+throughTheClothing+".",  
		"{dom.You} {dom.youAre} pressing {dom.yourHis} tongue against {sub.yourHis} "+RNG.pick(["pussy", "folds", "petals", "sensitive slit", "wetness", "delicate lips"])+ throughTheClothing+".",  
		"{dom.You} {dom.youAre} swirling {dom.yourHis} tongue over {sub.yourHis} "+RNG.pick(["clit and slit", "soft folds", "pussy lips", "petals", "sensitive areas"])+ throughTheClothing+".",  
		"{dom.You} {dom.youAre} savoring the taste of {sub.yourHis} "+RNG.pick(["pussy", "sweet petals", "intimate folds", "slit", "wetness", "sensitive clit and lips"])+ throughTheClothing+".",  
		"{dom.You} {dom.youAre} teasing {sub.yourHis} "+RNG.pick(["pussy", "delicate folds", "petals", "clit and lips", "slit", "soft wetness"])+" with deliberate, sensual licks"+throughTheClothing+".",  
		"{dom.You} {dom.youAre} running {dom.yourHis} tongue along {sub.yourHis} "+RNG.pick(["folds", "clit and pussy", "pussy lips", "slit", "heat", "delicate petals"])+ throughTheClothing+".",  
		"{dom.You} {dom.youAre} drawing slow, tantalizing circles with {dom.yourHis} tongue on {sub.yourHis} "+RNG.pick(["pussy", "soft folds", "slit", "intimate lips", "petals", "delicate skin"])+ throughTheClothing+".",  
		"{dom.You} {dom.youAre} gently flicking {dom.yourHis} tongue over {sub.yourHis} "+RNG.pick(["pussy lips", "soft slit", "folds", "petals", "clit", "intimate heat"])+ throughTheClothing+".",  
		"{dom.You} {dom.youAre} firmly dragging {dom.yourHis} tongue across {sub.yourHis} "+RNG.pick(["wet lips", "folds", "pussy", "slit", "petals", "clit and folds"])+ throughTheClothing+".",  
		"{dom.You} {dom.youAre} spreading {sub.yourHis} "+RNG.pick(["folds", "soft lips", "pussy", "delicate petals", "slit", "wetness"])+" with {dom.yourHis} tongue"+throughTheClothing+".",  
	])
	
	if(clothingItem == null):
		if(getSub().hasEffect(StatusEffect.HasCumInsideVagina)):
			if(RNG.chance(30)):
				text += RNG.pick([ 
					" "+Util.capitalizeFirstLetter(getSub().getBodypartContentsStringList(BodypartSlot.Vagina))+" "+RNG.pick(["oozes", "leaks"])+" out of {sub.yourHis} "+RNG.pick(["", "used ", "stuffed "])+RNG.pick(["pussy", "slit", "kitty"])+".",
				])
	
	if(getSubInfo(0).isReadyToCum()):
		text += RNG.pick([
			" {sub.YouHe} {sub.youAre} about to cum!",
			" {sub.YouHe} {sub.youAre} being kept on edge by {dom.youHim}.",
			" {sub.YourHis} "+RNG.pick(["pussy", "pussy slit"])+" is twitching a lot.",
			" {sub.YourHis} "+RNG.pick(["pussy", "pussy slit"])+" is leaking arousal a lot.",
			" {sub.YouHe} {sub.youAre} barely keeping {sub.yourself} from cumming.",
			" {sub.YouHe} reached {sub.yourHis} peak!",
		])
	elif(getSubInfo(0).isCloseToCumming()):
		text += RNG.pick([
			" {sub.You} "+RNG.pick(["{sub.youVerb('let')} out some moans", "{sub.youVerb('let')} out a moan", "{sub.youVerb('breathe')} deeply"])+" while {sub.yourHis} pussy "+RNG.pick(["gets more wet", "leaks arousal", "becomes more aroused", "drips arousal", "lets out an aroused scent"])+"."
		])
	
	addText(text)


# New-new building blocks

func isReadyToPenetrate(_indx:int) -> bool:
	var theChar:BaseCharacter = getDomOrSub(_indx)
	if(!theChar):
		return false
	return theChar.isReadyToPenetrate()

func isReadyToFuck(_indx:int) -> bool:
	var theChar:BaseCharacter = getDomOrSub(_indx)
	if(!theChar):
		return false
	return hasBodypartUncovered(_indx, S_PENIS) && theChar.isReadyToPenetrate()

func getNamePenis(_indx:int) -> String:
	var theChar:BaseCharacter = getDomOrSub(_indx)
	if(!theChar):
		return "[color=red]error[/color]"
	if(theChar.isWearingStrapon()):
		return "strapon"
	return "{penis}"

func getNameHole(_indx:int, _hole:String) -> String:
	if(_hole == S_VAGINA):
		return RNG.pick(["pussy", "pussy", "slit", "cunt", "kitty"])
	if(_hole == S_ANUS):
		return RNG.pick(["anus", "tailhole", "backdoor", "star", "anal ring"])
	if(_hole == S_MOUTH):
		return RNG.pick(["mouth", "face", "throat"])
	return "[color=red]error[/color]"
	
func doProcessFuck(_indxTop:int, _indxBottom:int, _hole:String, _poseDescriptor:String = ""):
	var topInfo:SexInfoBase = getDomOrSubInfo(_indxTop)
	var topChar:BaseCharacter = topInfo.getChar()
	var topStrapon:bool = topChar.isWearingStrapon()
	var bottomInfo:SexInfoBase = getDomOrSubInfo(_indxBottom)
	var bottomChar:BaseCharacter = bottomInfo.getChar()
	
	var usedBodypartName:String = getNameHole(_indxBottom, _hole)
	
	var text:String = RNG.pick([
		"{<TOP>.You} {<TOP>.youAre} fucking {<BOTTOM>.youHim}"+_poseDescriptor+".",
		"{<TOP>.You} {<TOP>.youVerb('pound')} {<BOTTOM>.your} "+usedBodypartName+".",
		"{<TOP>.You} {<TOP>.youVerb('fuck')} {<BOTTOM>.your} "+usedBodypartName+".",
	])

	if(RNG.chance(20)):
		var freeRoom:float = bottomChar.getPenetrationFreeRoomBy(_hole, topInfo.getCharID())
		
		bottomChar.gotOrificeStretchedBy(_hole, topInfo.getCharID(), true, 0.1)
		
		if(_hole == BodypartSlot.Vagina):
			if(freeRoom <= 5.0):
				text += RNG.pick([
					" The tip of {<TOP>.yourHis} "+("{penis}" if !topStrapon else "strapon")+" easily "+RNG.pick(["hits", "smashes", "reaches", "finds"])+" {<BOTTOM>.yourHis} "+RNG.pick(["cervix", "natural barricade"])+".",
				])
			elif(freeRoom >= 10):
				text += RNG.pick([
					" The tip of {<TOP>.yourHis} "+("{penis}" if !topStrapon else "strapon")+" can barely reach anywhere deep.",
					" The tip of {<TOP>.yourHis} "+("{penis}" if !topStrapon else "strapon")+" is struggling to reach {<BOTTOM>.yourHis} "+RNG.pick(["cervix", "natural barricade"])+".",
				])
		if(_hole == BodypartSlot.Anus):
			if(freeRoom <= 5.0):
				text += RNG.pick([
					" The tip of {<TOP>.yourHis} "+("{penis}" if !topStrapon else "strapon")+" easily "+RNG.pick(["hits", "smashes", "reaches", "finds"])+" {<BOTTOM>.yourHis} "+RNG.pick(["pleasure spot"])+".",
				])
			elif(freeRoom >= 10):
				text += RNG.pick([
					" The tip of {<TOP>.yourHis} "+("{penis}" if !topStrapon else "strapon")+" can barely reach anywhere deep.",
					" The tip of {<TOP>.yourHis} "+("{penis}" if !topStrapon else "strapon")+" is struggling to reach {<BOTTOM>.yourHis} "+RNG.pick(["pleasure spot"])+".",
				])

	addTextRaw(text.replace("<TOP>", topInfo.getCharID()).replace("<BOTTOM>", bottomInfo.getCharID()))


func doProcessFuckExtra(_indxTop:int, _indxBottom:int, _hole:String):
	var topInfo:SexInfoBase = getDomOrSubInfo(_indxTop)
	var topChar:BaseCharacter = topInfo.getChar()
	var topStrapon:bool = topChar.isWearingStrapon()
	
	if(RNG.chance(20) && topChar.bodypartHasTrait(BodypartSlot.Penis, PartTrait.PenisBarbs)):
		addTextRaw(RNG.pick([
			"Barbs on {dom.yourHis} "+("{penis}" if !topStrapon else "strapon")+" provide extra stimulation.",
			"Barbs on {dom.yourHis} "+("{penis}" if !topStrapon else "strapon")+" "+RNG.pick(["rake against", "scratch"])+" the "+RNG.pick(["soft insides", "soft inner walls"])+".",
		]).replace("<TOP>", topInfo.getCharID()))
	if(RNG.chance(20) && topChar.bodypartHasTrait(BodypartSlot.Penis, PartTrait.PenisRidges)):
		addTextRaw(RNG.pick([
			" Ridges on {dom.yourHis} "+("{penis}" if !topStrapon else "strapon")+" provide extra stimulation.",
		]).replace("<TOP>", topInfo.getCharID()))
	
	if(topInfo.getChar().isWearingStrapon()):
		if(topInfo.isReadyToCum()):
			addTextRaw(RNG.pick([
				"{<TOP>.You} {<TOP>.youAre} trembling on the brink, straining against the harness.",
				"{<TOP>.You} {<TOP>.youAre} quivering, {<TOP>.yourHis} body screaming for climax.",
				"{<TOP>.You} {<TOP>.youVerb('quiver')} uncontrollably, inches from cumming.",
				"{<TOP>.You} {<TOP>.youAre} edging {<TOP>.yourself}.",
				"{<TOP>.You} {<TOP>.youAre} about to cum!",
				"{<TOP>.You} {<TOP>.youAre} keeping {<TOP>.yourself} on edge.",
			]).replace("<TOP>", topInfo.getCharID()))
		elif(topInfo.isCloseToCumming()):
			addTextRaw(RNG.pick([
				"{<TOP>.You} {<TOP>.youVerb('pant')} hotly, the harness straining against {<TOP>.yourHis} body.",
				"{<TOP>.You} {<TOP>.youVerb('pant')} eagerly.",
				"{<TOP>.You} {<TOP>.youVerb('close')} in on {<TOP>.yourHis} orgasm.",
				"{<TOP>.You} {<TOP>.youAre} gonna cum soon.",
			]).replace("<TOP>", topInfo.getCharID()))
	else:
		if(topInfo.isReadyToCum()):
			addTextRaw(RNG.pick([
				"{<TOP>.You} {<TOP>.youAre} shaking on the edge, {<TOP>.yourHis} {penis} throbbing uncontrollably.",
				"{<TOP>.You} {<TOP>.youAre} edging {<TOP>.yourself}.",
				"{<TOP>.You} {<TOP>.youAre} about to cum!",
				"{<TOP>.You} {<TOP>.youAre} keeping {<TOP>.yourself} on edge.",
				"{<TOP>.Your} {penis} is moments from cumming.",
				"{<TOP>.Your} {penis} reached its peak."
			]).replace("<TOP>", topInfo.getCharID()))
		elif(topInfo.isCloseToCumming()):
			addTextRaw(RNG.pick([
				"{<TOP>.You} {<TOP>.youVerb('pant')} greedily, hips jerking with each pulse.",
				"{<TOP>.Your} member throbs, heavy and ripe for release.",
				"{<TOP>.Your} cock twitches fiercely, slick with anticipation.",
				"{<TOP>.Your} heavy member pulses, aching to unload.",
				"{<TOP>.Your} twitching shaft is drenched in slick pre.",
				"{<TOP>.You} {<TOP>.youVerb('pant')} eagerly.",
				"{<TOP>.You} {<TOP>.youVerb('close')} in on {<TOP>.yourHis} orgasm.",
				"{<TOP>.You} {<TOP>.youAre} gonna cum soon.",
				"{<TOP>.Your} "+RNG.pick(["cock", "dick", "member"])+" is throbbing.",
				"{<TOP>.Your} "+RNG.pick(["cock", "dick", "member"])+" is twitching and leaking a lot."
			]).replace("<TOP>", topInfo.getCharID()))


func doProcessCumInside(_indxTop:int, _indxBottom:int, _hole:String, tryKnot:bool = false) -> Dictionary:
	var topInfo:SexInfoBase = getDomOrSubInfo(_indxTop)
	var topChar:BaseCharacter = topInfo.getChar()
	#var topStrapon:bool = topChar.isWearingStrapon()
	var bottomInfo:SexInfoBase = getDomOrSubInfo(_indxBottom)
	var bottomChar:BaseCharacter = bottomInfo.getChar()

	var wombText:String = RNG.pick([
		"womb", "womb",
		"babymaker",
	])
	if(_hole == BodypartSlot.Anus):
		wombText = RNG.pick([
			"guts",
			"insides",
		])
	var text:String = ""
	var condomBroke:bool = false
	var knotSuccess:bool = false
	var didCumInside:bool = false
	var handledCum:bool = false

	if(tryKnot):
		var freeRoom:float = bottomChar.getPenetrationFreeRoomBy(_hole, topChar.getID())
		var chanceToPain:float = -freeRoom * 5.0
		if(topInfo.isAngry()):
			chanceToPain *= 2.0
		if(RNG.chance(10)):
			chanceToPain *= 1.5
		if(RNG.chance(chanceToPain)):
			bottomChar.doPainfullyStretchHole(_hole, topChar.getID())
		
		#isTryingToKnot = true
		bottomChar.gotOrificeStretchedBy(_hole, topChar.getID(), true, 0.5)
		if(RNG.chance(bottomChar.getKnottingChanceBy(_hole, topChar.getID()))):
			knotSuccess = true
		else:
			text += RNG.pick([
				"{<TOP>.You} {<TOP>.youVerb('try', 'tries')} to "+RNG.pick(["force {<TOP>.yourHis} knot in", "knot {<BOTTOM>.you}"])+" but the hole is just too tight. "
			])
	
	if(knotSuccess):
		text += RNG.pick([
			"{<TOP>.You} "+RNG.pick(["{<TOP>.youVerb('ram')}", "{<TOP>.youVerb('shove')}", "{<TOP>.youVerb('slide')}"])+" {<TOP>.yourHis} cock deep inside {<BOTTOM>.yourHis} "+getNameHole(_indxBottom, _hole)+" and force the knot in, stretching {<BOTTOM>.yourHis} "+getNameHole(_indxBottom, _hole)+" wide before [b]"+RNG.pick(["stuffing", "filling"])+" it full of {<TOP>.yourHis} seed[/b]!",
			"{<TOP>.You} {<TOP>.youVerb('manage')} to force {<TOP>.yourHis} knot in, stretching {<BOTTOM>.youHim} out! {<TOP>.YouHe} {<TOP>.youVerb('grunt')} as {<TOP>.yourHis} cock starts shooting thick ropes of "+RNG.pick(["cum", "seed", "jizz", "semen"])+" deep [b]inside {<BOTTOM>.yourHis} "+wombText+"[/b]!",
			"{<TOP>.Your} balls tense up as {<TOP>.youHe} "+RNG.pick(["{<TOP>.youVerb('ram')}", "{<TOP>.youVerb('shove')}", "{<TOP>.youVerb('slide')}"])+" {<TOP>.yourHis} cock deep. The knot slips in, stretching {<BOTTOM>.yourHis} "+getNameHole(_indxBottom, _hole)+" while [b]{<TOP>.youHe} {<TOP>.youAre} cumming inside[/b]!",
			"{<TOP>.You} "+RNG.pick(["{<TOP>.youVerb('ram')}", "{<TOP>.youVerb('shove')}", "{<TOP>.youVerb('slide')}"])+" {<TOP>.yourHis} cock balls-deep. The knot stretches {<BOTTOM>.yourHis} "+getNameHole(_indxBottom, _hole)+" until finally slipping in. {<TOP>.You} {<TOP>.youVerb('grunt')} while [b]stuffing {<BOTTOM>.yourHis} "+wombText+"[/b]!",
		])
	else:
		text += RNG.pick([
			"{<TOP>.You} "+RNG.pick(["{<TOP>.youVerb('ram')}", "{<TOP>.youVerb('shove')}", "{<TOP>.youVerb('slide')}"])+" {<TOP>.yourHis} cock deep inside {<BOTTOM>.yourHis} "+getNameHole(_indxBottom, _hole)+" and [b]"+RNG.pick(["{<TOP>.youVerb('stuff')}", "{<TOP>.youVerb('fill')}"])+" it full of {<TOP>.yourHis} seed[/b]!",
			"{<TOP>.You} {<TOP>.youVerb('grunt')} as {<TOP>.yourHis} cock starts shooting thick ropes of "+RNG.pick(["cum", "seed", "jizz", "semen"])+" deep [b]inside {<BOTTOM>.yourHis} "+wombText+"[/b]!",
			"{<TOP>.Your} balls tense up as {<TOP>.youHe} "+RNG.pick(["{<TOP>.youVerb('ram')}", "{<TOP>.youVerb('shove')}", "{<TOP>.youVerb('slide')}"])+" {<TOP>.yourHis} cock deep and [b]{<TOP>.youVerb('cum')} inside {<BOTTOM>.you}[/b]!",
			"{<TOP>.You} "+RNG.pick(["{<TOP>.youVerb('ram')}", "{<TOP>.youVerb('shove')}", "{<TOP>.youVerb('slide')}"])+" {<TOP>.yourHis} cock balls-deep and {<TOP>.youVerb('grunt')} while [b]stuffing {<BOTTOM>.yourHis} "+getNameHole(_indxBottom, _hole)+"[/b]!",
		])
	
	var condom:ItemBase = topChar.getWornCondom()
	if(condom != null):
		var breakChance:float = condom.getCondomBreakChance()
		condomBroke = topChar.shouldCondomBreakWhenFucking(bottomChar, breakChance)
		if(condomBroke):
			text = "[b]The condom broke![/b] "+text
			condom.destroyMe()
			didCumInside = true
		else:
			handledCum = true
			text = RNG.pick([
				"{<TOP>.You} filled the condom inside {<BOTTOM>.your} "+getNameHole(_indxBottom, _hole)+"!",
				"{<TOP>.You} stuffed the condom in {<BOTTOM>.your} "+getNameHole(_indxBottom, _hole)+" full of {<TOP>.yourHis} "+RNG.pick(["cum", "seed", "jizz", "semen"])+"!",
			])
			if(knotSuccess):
				text = RNG.pick([
					"{<TOP>.You} {<TOP>.youVerb('manage')} to knot {<BOTTOM>.youHim}! ",
					"{<TOP>.You} {<TOP>.youVerb('manage')} to shove {<TOP>.yourHis} knot into {<BOTTOM>.youHim}! ",
				]) + text
			
			var loadSize = topChar.cumInItem(condom)
			topInfo.cum()
			bottomInfo.addArousalSex(0.2)
			sendSexEvent(SexEvent.FilledCondomInside, _indxTop, _indxBottom, {hole=_hole,loadSize=loadSize,knotted=knotSuccess})
			#satisfyGoals()
			#if(knotSuccess):
			#	state = "knotting"
			#else:
			#	state = "aftercumminginside"
			
			#addText(text)
			#applyTallymarkIfNeeded(usedBodypart)
	
	if(!handledCum):
		didCumInside = true
		if(bottomChar.hasWombIn(_hole)):
			var beingBredScore:float = bottomInfo.fetishScore({Fetish.BeingBred: 1.0})
			if(beingBredScore < 0.0):
				bottomInfo.addResistance(1.0)
				bottomInfo.addFear(0.1)
		bottomChar.cummedInBodypartByAdvanced(_hole, getDomID(), {knotted=knotSuccess,condomBroke=condomBroke})
		topInfo.cum()
		bottomInfo.addArousalSex(0.2)
	#satisfyGoals()
	#if(knotSuccess):
	#	state = "knotting"
	#else:
	#	state = "aftercumminginside"
	
	#addText(text)
	#applyTallymarkIfNeeded(usedBodypart)
	addTextTopBottom(text, _indxTop, _indxBottom)
	return {
		text=text,
		didCumInside=didCumInside,
		condomBroke=condomBroke,
		knotSuccess=knotSuccess
	}

func addTextTopBottom(_theText:String, _indxTop:int, _indxBottom:int):
	var topInfo:SexInfoBase = getDomOrSubInfo(_indxTop)
	var bottomInfo:SexInfoBase = getDomOrSubInfo(_indxBottom)
	_theText=_theText.replace("<TOP>", topInfo.getCharID()).replace("<BOTTOM>", bottomInfo.getCharID())
	addTextRaw(_theText)
	
func cumGeneric(_indxWho:int, _indxCauser:int, uniqueOrgasm:String = "", extraOrgasmText:String = ""):
	var theInfo:SexInfoBase = getDomOrSubInfo(_indxWho)
	var causerInfo:SexInfoBase = getDomOrSubInfo(_indxCauser)
	theInfo.getChar().cumOnFloor(causerInfo.getCharID() if causerInfo != theInfo else "")
	theInfo.cum(causerInfo if causerInfo != theInfo else null)
	addGenericOrgasmText(_indxWho, extraOrgasmText)
	if(uniqueOrgasm != ""):
		sendSexEvent(SexEvent.UniqueOrgasm, _indxCauser, _indxWho, {orgasmType=uniqueOrgasm})

func cumInside(_indxWho:int, _indxTarget:int, _hole:String, _extra:Dictionary = {}) -> Dictionary:
	#var theInfo:SexInfoBase = getDomOrSubInfo(_indxWho)
	var theChar:BaseCharacter = getDomOrSub(_indxWho)
	#var targetInfo:SexInfoBase = getDomOrSubInfo(_indxTarget)
	var target:BaseCharacter = getDomOrSub(_indxTarget)
	
	if(!theChar.hasPenis() && !theChar.isWearingStrapon()):
		return {}
	if(!target.hasBodypart(_hole)):
		return {}
	
	var tryKnot:bool = _extra["tryKnot"] if _extra.has("tryKnot") else false
	var isDeepthroat:bool = _extra["isDeepthroat"] if _extra.has("isDeepthroat") else false
	
	if(theChar.isWearingStrapon()):
		var strapon = theChar.getWornStrapon()
		if(strapon.getFluids() != null && !strapon.getFluids().isEmpty()):
			target.cummedInBodypartByAdvanced(_hole, theChar.getID())
			var text:String = "{<TOP>.Your} strapon gets squeezed by {<BOTTOM>.your} "+getNameHole(_indxTarget, _hole)+" enough for it to suddenly [b]release its contents inside {<BOTTOM>.youHim}[/b]!"
			addTextTopBottom(text, _indxWho, _indxTarget)
		return {}
	
	if(_hole in [S_VAGINA, S_ANUS]):
		return doProcessCumInside(_indxWho, _indxTarget, _hole, tryKnot)
	if(_hole == S_MOUTH):
		return doProcessCumBJInside(_indxWho, _indxTarget, isDeepthroat)
	
	return {}




func doProcessCumBJInside(_indxTop:int, _indxBottom:int, isDeepthroat:bool = false) -> Dictionary:
	var topInfo:SexInfoBase = getDomOrSubInfo(_indxTop)
	var topChar:BaseCharacter = topInfo.getChar()
	#var topStrapon:bool = topChar.isWearingStrapon()
	var bottomInfo:SexInfoBase = getDomOrSubInfo(_indxBottom)
	var bottomChar:BaseCharacter = bottomInfo.getChar()
	
	var text:String = RNG.pick([
		"{<TOP>.You} {<TOP>.youVerb('grunt')} while {<TOP>.yourHis} "+RNG.pick(["cock", "dick", "member"])+" throbs and [b]shoots cum directly into {<BOTTOM>.your} mouth[/b].",
	])
	if(isDeepthroat):
		text = RNG.pick([
			"{<TOP>.You} {<TOP>.youVerb('ram')} {<TOP>.yourHis} "+RNG.pick(["cock", "dick"])+" "+RNG.pick(["balls deep", "as deep as {<BOTTOM>.yourHis} throat allows", "deep down {<BOTTOM>.yourHis} throat"])+" before [b]stuffing {<BOTTOM>.yourHis} belly with lots of cum[/b]!",
		])
	
	var condomBroke:bool = false
	var condom:ItemBase = topChar.getWornCondom()
	if(condom != null):
		var breakChance:float = condom.getCondomBreakChance()
		condomBroke = topChar.shouldCondomBreakWhenFucking(bottomChar, breakChance)
		if(condomBroke):
			text = "[b]The condom broke![/b] "+text
			condom.destroyMe()
		else:
			text = RNG.pick([
				"{<TOP>.You} filled the condom inside {<BOTTOM>.your} "+RNG.pick(["mouth"])+"!",
				"{<TOP>.You} stuffed the condom in {<BOTTOM>.your} "+RNG.pick(["mouth"])+" full of {<TOP>.yourHis} "+RNG.pick(["cum", "seed", "jizz", "semen"])+"!",
			])
			topChar.cumInItem(condom)
			topInfo.cum()
			
			condom.destroyMe()
			getSexEngine().saveCondomToLootIfPerk(condom)
			text += RNG.pick([
				" {<TOP>.You} {<TOP>.youVerb('pull')} out and {<TOP>.youVerb('dispose')} of the used condom.",
			])
			addTextTopBottom(text, _indxTop, _indxBottom)
			return {}
	if(bottomInfo is SexSubInfo):
		var beingBredScore:float = bottomInfo.fetishScore({Fetish.OralSexGiving: 1.0})
		if(beingBredScore < 0.0):
			bottomInfo.addResistance(1.0)
			bottomInfo.addFear(0.1)
	bottomChar.cummedInBodypartByAdvanced(BodypartSlot.Head, topInfo.getCharID(), {condomBroke=condomBroke})
	topInfo.cum()
	
	if(condom != null):
		condom.destroyMe()
		text += RNG.pick([
			" {<TOP>.You} {<TOP>.youVerb('pull')} out and {<TOP>.youVerb('dispose')} of the used condom.",
		])
	
	#return getSexEngine().combineData({text=text}, applyTallymarkIfNeededData(BodypartSlot.Head))
	addTextTopBottom(text, _indxTop, _indxBottom)
	return {}




func squirtOnto(_indxWho:int, _indxTarget:int, _extra:Dictionary = {}):
	var theInfo:SexInfoBase = getDomOrSubInfo(_indxWho)
	var theChar:BaseCharacter = getDomOrSub(_indxWho)
	#var targetInfo:SexInfoBase = getDomOrSubInfo(_indxTarget)
	var target:BaseCharacter = getDomOrSub(_indxTarget)
	
	if(!theChar.hasVagina()):
		return {}
	
	var text:String = ""
	text = RNG.pick([
		"{<TOP>.You} {<TOP>.youVerb('arch', 'arches')} {<TOP>.yourHis} back while {<TOP>.yourHis} "+RNG.pick(["pussy", "pussy slit", "kitty"])+" twitches and squirts all over {<BOTTOM>.your} face!",
	])
	target.cummedOnBy(theChar.getID(), FluidSource.Vagina)
	theInfo.cum()
	if(theChar.isWearingChastityCage()):
		text += RNG.pick([
			" {<TOP>.YourHis} "+RNG.pick(["cock", "dick", "penis"])+" shoots out a weak load through a chastity cage.",
		])
	elif(theChar.hasReachablePenis()):
		text += RNG.pick([
			" {<TOP>.YourHis} "+RNG.pick(["cock", "dick", "penis"])+" shoots out a load of {<TOP>.cum} flying through the air.",
		])
	
	addTextTopBottom(text, _indxWho, _indxTarget)


func cumOnto(_indxWho:int, _indxTarget:int, _extra:Dictionary = {}):
	var theInfo:SexInfoBase = getDomOrSubInfo(_indxWho)
	var theChar:BaseCharacter = getDomOrSub(_indxWho)
	#var targetInfo:SexInfoBase = getDomOrSubInfo(_indxTarget)
	var target:BaseCharacter = getDomOrSub(_indxTarget)
	
	if(!theChar.hasPenis()):
		return {}
	
	var text:String = RNG.pick([
		"{<TOP>.You} {<TOP>.youVerb('pull')} {<TOP>.yourHis} cock out and [b]cums all over {<BOTTOM>.your} face[/b]!",
		"{<TOP>.You} {<TOP>.youVerb('pull')} out, [b]cumming all over {<BOTTOM>.your} face[/b]!",
	])
	
	var condom:ItemBase = theChar.getWornCondom()
	if(condom != null):
		var breakChance:float = condom.getCondomBreakChance()
		
		if(RNG.chance(breakChance)):
			text = "[b]The condom broke![/b] "+text
			condom.destroyMe()
		else:
			text = RNG.pick([
				"{<TOP>.You} {<TOP>.youVerb('pull')} {<TOP>.yourHis} cock out and {<TOP>.youVerb('fill')} {<TOP>.yourHis} condom! {<TOP>.You} {<TOP>.youVerb('dispose')} of it.",
				"{<TOP>.You} {<TOP>.youVerb('pull')} out, stuffing {<TOP>.yourHis} condom! {<TOP>.You} {<TOP>.youVerb('dispose')} of it.",
			])
			condom.destroyMe()
			theChar.cumInItem(condom)
			getSexEngine().saveCondomToLootIfPerk(condom)
			theInfo.cum()
			#satisfyGoals()
			#state = ""
			addTextTopBottom(text, _indxWho, _indxTarget)
			return
	
	target.cummedOnBy(theInfo.getCharID(), FluidSource.Penis)
	theChar.cumOnFloor()
	theInfo.cum()
	#satisfyGoals()
	#state = ""

	addTextTopBottom(text, _indxWho, _indxTarget)





func tryPenetrate(_indxTop:int, _indxBottom:int, _hole:String, isEnveloping:bool = false) -> bool:
	var topInfo:SexInfoBase = getDomOrSubInfo(_indxTop)
	var topChar:BaseCharacter = topInfo.getChar()
	var topStrapon:bool = topChar.isWearingStrapon()
	var bottomInfo:SexInfoBase = getDomOrSubInfo(_indxBottom)
	var bottomChar:BaseCharacter = bottomInfo.getChar()
	
	if(!(_hole in [S_VAGINA, S_ANUS])):
		return true
	var fetishGiving:String = Fetish.VaginalSexGiving if _hole == S_VAGINA else Fetish.AnalSexGiving
	
	if(!RNG.chance(bottomChar.getPenetrateChanceBy(_hole, topChar.getID()))):
		bottomChar.gotOrificeStretchedBy(_hole, topChar.getID(), true, 0.1)
		if(!isEnveloping):
			addTextTopBottom("{<TOP>.Your} "+getNamePenis(_indxTop)+" stretches {<BOTTOM>.your} "+getNameHole(_indxBottom, _hole)+" out while trying to fit inside.", _indxTop, _indxBottom)
		else:
			addTextTopBottom("{<BOTTOM>.You} {<BOTTOM>.youVerb('try', 'tries')} to envelop {<TOP>.yourHis} "+getNamePenis(_indxTop)+" but it's too big!", _indxTop, _indxBottom)
		stimulate(_indxTop, S_PENIS, _indxBottom, _hole, I_TEASE, fetishGiving)
		
		return false
	else:
		sendSexEvent(SexEvent.HolePenetrated, _indxTop, _indxBottom, {hole=_hole,engulfed=isEnveloping,strapon=topStrapon})
		bottomChar.gotOrificeStretchedBy(_hole, topChar.getID(), true, 0.2)
		stimulate(_indxTop, S_PENIS, _indxBottom, _hole, I_LOW, fetishGiving)
		var text:String = RNG.pick([
			"{<TOP>.You} {<TOP>.youVerb('manage','manages')} to penetrate {<BOTTOM>.your} "+getNameHole(_indxBottom, _hole)+"!",
			"{<TOP>.You} {<TOP>.youVerb('shove','shoves')} {<TOP>.yourHis} "+getNamePenis(_indxTop)+" inside {<BOTTOM>.your} "+getNameHole(_indxBottom, _hole)+"!",
		])
		if(isEnveloping):
			text = "{<BOTTOM>.You} {<BOTTOM>.youVerb('engulf')} {<TOP>.youHis} "+getNamePenis(_indxTop)+", letting it penetrate {<BOTTOM>.yourHis} "+getNameHole(_indxBottom, _hole)+"."
		if(_hole == BodypartSlot.Anus && bottomChar.getInventory().hasSlotEquipped(InventorySlot.Anal)):
			var item = bottomChar.getInventory().getEquippedItem(InventorySlot.Anal)
			if(!isEnveloping):
				text = "{<TOP>.You} temporarily {<TOP>.youVerb('retrieve')} "+str(item.getAStackName())+" out of {<BOTTOM>.your} ass. "+text
			else:
				text = "{<BOTTOM>.You} temporarily {<BOTTOM>.youVerb('retrieve')} "+str(item.getAStackName())+" out of {<BOTTOM>.yourHis} ass. "+text
		elif(_hole == BodypartSlot.Vagina && bottomChar.getInventory().hasSlotEquipped(InventorySlot.Vagina)):
			var item = bottomChar.getInventory().getEquippedItem(InventorySlot.Vagina)
			if(!isEnveloping):
				text = "{<TOP>.You} temporarily {<TOP>.youVerb('retrieve')} "+str(item.getAStackName())+" out of {<BOTTOM>.your} pussy. "+text
			else:
				text = "{<BOTTOM>.You} temporarily {<BOTTOM>.youVerb('retrieve')} "+str(item.getAStackName())+" out of {<BOTTOM>.yourHis} pussy. "+text
		
		var freeRoom:float = bottomChar.getPenetrationFreeRoomBy(_hole, topChar.getID())
		var chanceToPain = -freeRoom * 2.0
		if(RNG.chance(chanceToPain) || ((topInfo is SexDomInfo) && topInfo.isAngry() && RNG.chance(20))):
			bottomChar.doPainfullyStretchHole(_hole, topChar.getID())
		
		addTextTopBottom(text, _indxTop, _indxBottom)
		return true
