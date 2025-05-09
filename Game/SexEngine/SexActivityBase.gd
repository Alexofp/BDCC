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

#TODO: REMOVE THESE AFTER REFACTOR IS DONE
var subID:String
var domID:String
var subInfo:SexSubInfo
var domInfo:SexDomInfo

# Here is hope this won't bite me
# Only use these with stimulate()
const DOM_0 = 0
const DOM_1 = 1

const SUB_0 = -1
const SUB_1 = -2

const S_VAGINA = BodypartSlot.Vagina
const S_ANUS = BodypartSlot.Anus
const S_PENIS = BodypartSlot.Penis
const S_MOUTH = BodypartSlot.Head
const S_HANDS = BodypartSlot.Arms
const S_LEGS = BodypartSlot.Legs
const S_BREASTS = BodypartSlot.Breasts

const I_TEASE = SexActIntensity.Tease
const I_SLOWSEX = SexActIntensity.SlowSex
const I_SEX = SexActIntensity.Sex
const I_HARDSEX = SexActIntensity.HardSex

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

func stimulate(_indxTarget:int, _slot1:String, _indxActor:int, _slot2:String, _intensity:int, _fetishID:String):
	var info1:SexInfoBase = getDomOrSubInfo(_indxTarget)
	var info2:SexInfoBase = getDomOrSubInfo(_indxActor)
	
	exposeToFetish(_indxTarget, _fetishID, _intensity, _indxActor)
	exposeToFetish(_indxActor, _fetishID, _intensity, _indxActor) # Target is same as Exposer?
	
	var fetishScore:float = info1.fetishScore({_fetishID:1.0}) if _fetishID != "" else 1.0
	fetishScore = unClampValue(fetishScore, 0.2)
	var fetishScore2:float = info2.fetishScore({_fetishID:1.0}) if _fetishID != "" else 1.0
	fetishScore2 = unClampValue(fetishScore2, 0.2)
	
	if(_intensity == SexActIntensity.Tease):
		info1.addArousalForeplay(0.1 + fetishScore*0.05)
		info2.addArousalForeplay(0.1 + fetishScore2*0.05)
	elif(_intensity == SexActIntensity.SlowSex):
		info1.stimulateArousalZone(0.1, _slot1, 0.5)
		info2.stimulateArousalZone(0.1, _slot2, 0.5)
	elif(_intensity == SexActIntensity.Sex):
		info1.stimulateArousalZone(0.2, _slot1, 1.0)
		info2.stimulateArousalZone(0.2, _slot2, 1.0)
	elif(_intensity == SexActIntensity.HardSex):
		info1.stimulateArousalZone(0.3, _slot1, 1.5)
		info2.stimulateArousalZone(0.3, _slot2, 1.5)

func addOutputRaw(_rawEntry:Array):
	getSexEngine().addOutputRaw(_rawEntry)

func talkText(_indx1:int, _text:String):
	if(_text.empty()):
		return
	var theInfo := getDomOrSubInfo(_indx1)
	addOutputRaw([SexEngine.OUTPUT_SAY, theInfo.getCharID(), processText(_text)])

func talk(_indx1:int, _indx2:int, reactionID:int):
	# Check if can talk
	var theInfo := getDomOrSubInfo(_indx1)
	if(theInfo.isUnconscious()):
		return
	var theInfo2 := getDomOrSubInfo(_indx2)
	
	var theText:String = ""
	if(theInfo is SexDomInfo && theInfo2 is SexSubInfo):
		theText = theInfo.getChar().getVoice().getDomReaction(reactionID, getSexEngine(), theInfo, theInfo2)
		
		if(theText != ""):
			addOutputRaw([SexEngine.OUTPUT_SAY, theInfo.getCharID(), GM.ui.processString(theText, {
				dom = theInfo.getCharID(),
				sub = theInfo2.getCharID(),
			})])
		
	elif(theInfo is SexSubInfo && theInfo2 is SexDomInfo):
		theText = theInfo.getChar().getVoice().getSubReaction(reactionID, getSexEngine(), theInfo2, theInfo)
	
		if(theText != ""):
			addOutputRaw([SexEngine.OUTPUT_SAY, theInfo.getCharID(), GM.ui.processString(theText, {
				dom = theInfo2.getCharID(),
				sub = theInfo.getCharID(),
			})])


func addText(_text:String):
	if(_text.empty()):
		return
	addOutputRaw([SexEngine.OUTPUT_TEXT, processText(_text)])

func addTextPick(_texts:Array):
	if(_texts.empty()):
		return
	addText(RNG.pick(_texts))

func processText(_text:String) -> String:
	var theOverrides:Dictionary = {}
	var _i:int = 0
	for theSubInfo in subs:
		if(_i == 0):
			theOverrides["sub"] = theSubInfo.getCharID()
		else:
			theOverrides["sub"+str(_i+1)] = theSubInfo.getCharID()
		_i += 1
	_i = 0
	for theDomInfo in doms:
		if(_i == 0):
			theOverrides["dom"] = theDomInfo.getCharID()
		else:
			theOverrides["dom"+str(_i+1)] = theDomInfo.getCharID()
		_i += 1
	return GM.ui.processString(_text, theOverrides)

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
	
func doAction(_indx:int, _actionID:String, _action:Dictionary):
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
	
	return "ERROR"

func getThroughClothingText(_indx:int, _slot:String) -> String:
	var theChar := getDomOrSub(_indx)
	var clothingItem = theChar.getFirstItemThatCoversBodypart(BodypartSlot.Vagina)
	var throughTheClothing:String = ""
	if(clothingItem != null):
		throughTheClothing = " through {"+indxToOverrideName(_indx)+".yourHis} "+clothingItem.getCasualName()
	return throughTheClothing

func isCloseToCumming(_indx:int) -> bool:
	return getDomOrSubInfo(_indx).isCloseToCumming()
	
func isReadyToCum(_indx:int) -> bool:
	return getDomOrSubInfo(_indx).isReadyToCum()

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

func clearSexEngineRefAndParticipants():
	sexEngineRef = null
	subs.clear()
	doms.clear()

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

func canBeStartedByDom():
	return startedByDom
	
func canBeStartedBySub():
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
	return {
		text = str(id)+" HAS STARTED",
	}

func onSwitchFrom(_otherActivity, _args):
	return {
		text = str(id)+" HAS STARTED BY BEING SWITCHED FROM "+str(_otherActivity.id)
	}

func switchCurrentActivityTo(newactivityID, _args = []):
	getSexEngine().switchActivity(self, newactivityID, _args)

func getDomTags():
	return []

func getSubTags():
	return []

func getDomTagsCheck():
	return getDomTags()

func getSubTagsCheck():
	return getSubTags()

func getTags(_indx:int) -> Array:
	return []

func getCheckTagsDom() -> Array:
	return getTags(DOM_0)

func getCheckTagsSub() -> Array:
	return getTags(SUB_0)

func processTurnFinal():
	if(has_method(getStatePrefix()+"_processTurn")):
		return call(getStatePrefix()+"_processTurn")
	return processTurn()

func processTurn():
	return {
		text = str(id)+" IS STILL HAPPENING.",
	}

func reactActivityEnd(_otheractivity):
	return null

func getDomActionsFinal():
	var result:Array = getDomActions()
	if(has_method(getStatePrefix()+"_domActions")):
		result.append_array(call(getStatePrefix()+"_domActions"))
	return result

func getDomActions():
	return []

func doDomActionFinal(_id, _actionInfo):
	var result
	if(has_method(getStatePrefix()+"_doDomAction")):
		result = call(getStatePrefix()+"_doDomAction", _id, _actionInfo)
	if(result == null):
		return doDomAction(_id, _actionInfo)
	return result

func doDomAction(_id, _actionInfo):
	return {
		"text": "Bad stuff happened",
	}
	
func getSubActionsFinal():
	var result:Array = getSubActions()
	if(has_method(getStatePrefix()+"_subActions")):
		result.append_array(call(getStatePrefix()+"_subActions"))
	return result
	
func getSubActions():
	return []

func doSubActionFinal(_id, _actionInfo):
	var result
	if(has_method(getStatePrefix()+"_doSubAction")):
		result = call(getStatePrefix()+"_doSubAction", _id, _actionInfo)
	if(result == null):
		return doSubAction(_id, _actionInfo)
	return result

func doSubAction(_id, _actionInfo):
	return {
		"text": "Sub bad stuff happened",
	}

func domFetishScore(fetishes = {}):
	var fetishHolder: FetishHolder = getDom().getFetishHolder()
	
	var result = 0.0
	for fetishID in fetishes:
		var fetishValue = fetishHolder.getFetishValue(fetishID)
		result += fetishValue * fetishes[fetishID]
	
	return result
	
func subFetishScore(fetishes = {}):
	var fetishHolder: FetishHolder = getSub().getFetishHolder()
	
	var result = 0.0
	for fetishID in fetishes:
		var fetishValue = fetishHolder.getFetishValue(fetishID)
		result += fetishValue * fetishes[fetishID]
	
	return result

func domPersonalityScore(personalityStats = {}):
	var personality: Personality = getDom().getPersonality()
	
	var result = 0.0
	for personalityStatID in personalityStats:
		var personalityValue = personality.getStat(personalityStatID)
		result += personalityValue * personalityStats[personalityStatID]
	
	return result

func subPersonalityScore(personalityStats = {}):
	var personality: Personality = getSub().getPersonality()
	
	var result = 0.0
	for personalityStatID in personalityStats:
		var personalityValue = personality.getStat(personalityStatID)
		result += personalityValue * personalityStats[personalityStatID]
	
	return result

func addDomLust(howmuch, fetishes = {}):
	getDom().addLust(howmuch * (1.0 + domFetishScore(fetishes)))
		
func addSubLust(howmuch, fetishes = {}):
	getSub().addLust(howmuch * (1.0 + subFetishScore(fetishes)))
		
func getSubLikingItScore():
	return getSub().getLustLevel()

func getSubHatingItScore():
	return 1.0 - getSub().getLustLevel()

func subReaction(reactionID, chance = 100):
	if(getSubInfo(0).isUnconscious()):
		return null
	
	if(chance >= 100 || RNG.chance(chance)):
		return getSub().getVoice().getSubReaction(reactionID, getSexEngine(), getDomInfo(0), getSubInfo(0))

func domReaction(reactionID, chance = 100):
	if(getSubInfo(0).isUnconscious()):
		return null
	
	if(chance >= 100 || RNG.chance(chance)):
		return getDom().getVoice().getDomReaction(reactionID, getSexEngine(), getDomInfo(0), getSubInfo(0))

func getAnimationPriority():
	return 10

func getAnimation():
	return null

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

func getDomOrgasmHandlePriority():
	return -1

func getSubOrgasmHandlePriority():
	return -1

func getOrgasmHandlePriority(_indx:int) -> int:
	return -1

func isHandlingOrgasms(_indx:int) -> bool:
	return getOrgasmHandlePriority(_indx) >= getSexEngine().getMaxOrgasmHandlePriority(getDomOrSubID(_indx))

func isHandlingSubOrgasms():
	return getSubOrgasmHandlePriority() >= getSexEngine().getCurrentActivitiesMaxSubOrgasmHandlePriority(getDomID(0), getSubID(0))

func isHandlingDomOrgasms():
	return getDomOrgasmHandlePriority() >= getSexEngine().getCurrentActivitiesMaxDomOrgasmHandlePriority(getDomID(0), getSubID(0))

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

func getGenericSubOrgasmData(extraText = ""):
	return getGenericOrgasmData(true, extraText)

func getGenericDomOrgasmData(extraText = ""):
	return getGenericOrgasmData(false, extraText)

func addGenericSubOrgasmText(extraText:String = ""):
	addText(getGenericSubOrgasmData(extraText)["text"])

func addGenericDomOrgasmText(extraText:String = ""):
	addText(getGenericDomOrgasmData(extraText)["text"])

func addGenericOrgasmText(_indx:int, extraText:String = ""):
	addText(getGenericOrgasmData(_indx, extraText))

func applyTallymarkIfNeededData(bodypartSlot):
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
		return null
	
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
	
	var text = RNG.pick([
		"{dom.You} "+RNG.pick(["{dom.youVerb('draw')}"])+" a [b]tallymark[/b] on {sub.your} "+zoneText+".",
		"{dom.You} "+RNG.pick(["{dom.youVerb('add')}"])+" a [b]tallymark[/b] to {sub.your} "+zoneText+".",
	])
	
	return {
		text = text,
	}

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
	
func damageSubClothes():
	var damageClothesResult = getSub().damageClothes()
	if(damageClothesResult[0]):
		return "[b]"+damageClothesResult[2].getVisibleName()+" got damaged![/b] "+damageClothesResult[1]
	return ""

func damageDomClothes():
	var damageClothesResult = getDom().damageClothes()
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



# Building blocks below


func combineData(_data1, _data2):
	return getSexEngine().combineData(_data1, _data2)

func doCumPussyLickDom():
	var text = RNG.pick([
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

	return {text=text}

func doCumBJDom(isDeepthroat = false):
	var text = RNG.pick([
		"{dom.You} {dom.youVerb('grunt')} while {dom.yourHis} "+RNG.pick(["cock", "dick", "member"])+" throbs and [b]shoots cum directly into {sub.your} mouth[/b].",
	])
	if(isDeepthroat):
		text = RNG.pick([
			"{dom.You} {dom.youVerb('ram')} {dom.yourHis} "+RNG.pick(["cock", "dick"])+" "+RNG.pick(["balls deep", "as deep as {sub.yourHis} throat allows", "deep down {sub.yourHis} throat"])+" before [b]stuffing {sub.yourHis} belly with lots of cum[/b]!",
		])
	
	var condomBroke = false
	var condom:ItemBase = getDom().getWornCondom()
	if(condom != null):
		var breakChance = condom.getCondomBreakChance()
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
			
			return {text=text}
	var beingBredScore = getSubInfo(0).fetishScore({Fetish.OralSexGiving: 1.0})
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
	return {text=text}


func doCumBJFacialsDom():
		var text = RNG.pick([
			"{dom.You} {dom.youVerb('pull')} {dom.yourHis} cock out and [b]cums all over {sub.your} face[/b]!",
			"{dom.You} {dom.youVerb('pull')} out, [b]cumming all over {sub.your} face[/b]!",
		])
		
		var condom:ItemBase = getDom().getWornCondom()
		if(condom != null):
			var breakChance = condom.getCondomBreakChance()
			
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
				
				return {text=text}
		
		getSub().cummedOnBy(getDomID(0), FluidSource.Penis)
		getDom().cumOnFloor()
		getDomInfo(0).cum()
		#satisfyGoals()
		#state = ""

		return {text=text}


func doCumPussyLickSub(supposedToBeAngry = true):
	#satisfyGoals()
	
	var noPermissionText = " {sub.YouHe} [b]came without {dom.yourHis} permission[/b]!" if supposedToBeAngry else ""
	if(getSexType() == SexType.SlutwallSex):
		noPermissionText = ""
		supposedToBeAngry = false
	
	var text = ""
	text = RNG.pick([
		"{sub.You} {sub.youVerb('arch', 'arches')} {sub.yourHis} back while {sub.yourHis} "+RNG.pick(["pussy", "pussy slit", "kitty"])+" twitches and squirts all over {dom.your} face!"+noPermissionText,
	])
	getDom().cummedOnBy(getSubID(0), FluidSource.Vagina)
	getSubInfo(0).cum()
	if(getSub().hasReachablePenis()):
		if(getSub().isWearingChastityCage()):
			text += RNG.pick([
				" {sub.YourHis} "+RNG.pick(["cock", "dick", "penis"])+" shoots out a weak load through the chastity cage but that one was easy to avoid.",
			])
		else:
			text += RNG.pick([
				" {sub.YourHis} "+RNG.pick(["cock", "dick", "penis"])+" shoots out a load but at least {dom.you} {dom.youVerb('avoid')} that one.",
			])
	
	#endActivity()
	if(supposedToBeAngry):
		getDomInfo(0).addAnger(0.5)
		text += RNG.pick([
			" That made {dom.you} very angry.",
		])
	return {text = text}
	
func doCumBJSub(supposedToBeAngry = true):
	#satisfyGoals()
	
	var noPermissionText = " {sub.YouHe} [b]came without {dom.yourHis} permission[/b]!" if supposedToBeAngry else ""
	if(getSexType() == SexType.SlutwallSex):
		noPermissionText = ""
		supposedToBeAngry = false
	
	var text = ""

	text = RNG.pick([
		"{sub.You} {sub.youVerb('grunt')} while {sub.yourHis} "+RNG.pick(["cock", "dick", "shaft"])+" throbs and suddenly shoots strings of "+RNG.pick(["cum", "seed", "semen"])+" directly into {dom.your} mouth!"+noPermissionText,
	])
	
	var condomBroke = false
	var condom:ItemBase = getSub().getWornCondom()
	if(condom != null):
		var breakChance = condom.getCondomBreakChance()
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
			
			return {text=text}
	
	getDom().cummedInMouthByAdvanced(getSubID(0), {condomBroke=condomBroke})
	getSubInfo(0).cum()
	
	#endActivity()
	if(supposedToBeAngry):
		getDomInfo(0).addAnger(0.5)
		text += RNG.pick([
			" That made {dom.you} very angry.",
		])
	return {text = text}


func doCumBJFacialsSub(supposedToBeAngry = true):
	#satisfyGoals()
	
	var noPermissionText = " {sub.YouHe} [b]came without {dom.yourHis} permission[/b]!" if supposedToBeAngry else ""
	if(getSexType() == SexType.SlutwallSex):
		noPermissionText = ""
		supposedToBeAngry = false
	
	var text = ""

	text = RNG.pick([
		"{sub.You} {sub.youVerb('grunt')} while {sub.yourHis} "+RNG.pick(["cock", "dick", "shaft"])+" throbs and suddenly shoots strings of "+RNG.pick(["cum", "seed", "semen"])+" that land directly on {dom.your} face!"+noPermissionText,
	])
	if(getSub().isWearingChastityCage()):
		text = RNG.pick([
			"{sub.You} {sub.youVerb('grunt')} while {sub.yourHis} locked away "+RNG.pick(["cock", "dick", "shaft"])+" throbs in its tight contains and suddenly shoots a few weak strings of "+RNG.pick(["cum", "seed", "semen"])+" through the chastity cage that land on {dom.your} face!"+noPermissionText,
		])
		
	var condom:ItemBase = getSub().getWornCondom()
	if(condom != null):
		var breakChance = condom.getCondomBreakChance()
		
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
			
			return {text=text}
		
	getDom().cummedOnBy(getSubID(0), FluidSource.Penis)
	getSubInfo(0).cum()

	#endActivity()
	if(supposedToBeAngry):
		getDomInfo(0).addAnger(0.5)
		text += RNG.pick([
			" That made {dom.you} very angry.",
		])
	return {text = text}



func doSpitCumIntoHoleDom(bodypartSlot = BodypartSlot.Vagina):
	var mixtureText = getDom().getBodypartContentsStringList(BodypartSlot.Head)
	var locationName:String = ("{sub.pussyStretch} "+RNG.pick(["pussy", "slit"]) if bodypartSlot == BodypartSlot.Vagina else ("{sub.anusStretch} "+RNG.pick(["anus"])))
	var text = RNG.pick([
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
	return {text = text}

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
	return {text = text}

func isDomWearingStrapon():
	return getDom().isWearingStrapon()

func isSubWearingStrapon():
	return getSub().isWearingStrapon()

func getDomPenisSensetivity():
	var strapon = getDom().getWornStrapon()
	if(strapon == null):
		return 1.0
	
	return strapon.getStraponPleasureForDom()

func getSubPenisSensetivity():
	var strapon = getSub().getWornStrapon()
	if(strapon == null):
		return 1.0
	
	return strapon.getStraponPleasureForDom()

func getDomDickName(dickName = null):
	if(isDomWearingStrapon()):
		return "strapon"
	if(dickName == null):
		return RNG.pick(["cock", "dick", "member"])
	return dickName

func getSubDickName(dickName = null):
	if(isSubWearingStrapon()):
		return "strapon"
	if(dickName == null):
		return RNG.pick(["cock", "dick", "member"])
	return dickName
	
func doBlowjobTurnDom():
	affectSub(getSubInfo(0).fetishScore({Fetish.OralSexGiving: 1.0})+0.1, 0.1, -0.1, -0.01)
	affectDom(getDomInfo(0).fetishScore({Fetish.OralSexReceiving: 0.5})+0.6, 0.1*getDomPenisSensetivity(), 0.0)
	getSubInfo(0).addArousalForeplay(0.03)
	getDomInfo(0).stimulateArousalZone(0.2, BodypartSlot.Penis, 1.0)
	getSub().gotOrificeStretchedBy(BodypartSlot.Head, getDomID(0), true, 0.05)
	
	var text = RNG.pick([
		"{dom.Your} "+getDomDickName()+" is being sucked by {sub.youHim}.",
		"{sub.You} {sub.youAre} "+RNG.pick(["sucking", "blowing"])+" {dom.yourHis} "+getDomDickName()+".",
		"{sub.You} {sub.youAre} wrapping {sub.yourHis} lips tightly around {dom.your} "+getDomDickName(RNG.pick(["cock", "dick", "member"]))+".",  
		"{sub.You} {sub.youAre} teasing the tip of {dom.your} "+getDomDickName(RNG.pick(["cock", "dick", "length", "shaft"]))+ " with {sub.yourHis} tongue.",  
		"{sub.You} {sub.youVerb('bob')} {sub.yourHis} head along {dom.your} "+getDomDickName(RNG.pick(["dick", "cock", "shaft", "member"]))+", taking it deeper.",  
		"{sub.You} {sub.youAre} running {sub.yourHis} tongue along the underside of {dom.your} "+getDomDickName(RNG.pick(["cock", "length", "member"]))+".",  
		"{sub.You} {sub.youAre} sucking eagerly on {dom.your} "+getDomDickName(RNG.pick(["dick", "member", "shaft"]))+", drawing a moan from {dom.youHim}.",  
		"{sub.You} {sub.youVerb('swirl')} {sub.yourHis} tongue around the head of {dom.your} "+getDomDickName(RNG.pick(["cock", "dick", "member"]))+".",  
		"{sub.You} {sub.youVerb('take')} {dom.your} "+getDomDickName(RNG.pick(["length", "shaft", "cock"]))+ " further into {sub.yourHis} mouth, sucking hard.",  
		"{sub.You} {sub.youVerb('press', 'presses')} {sub.yourHis} tongue firmly against {dom.your} "+getDomDickName(RNG.pick(["cock", "dick", "member"]))+", sliding it slowly along its length.",  
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
			"{dom.You} "+RNG.pick(["forcefully {dom.youVerb('move')}", "{dom.youVerb('move')}"])+" {sub.yourHis} head back and forth over {dom.yourHis} "+getDomDickName(RNG.pick(["cock", "dick", "member", "length"]))+"."
		])
		
		if(RNG.chance(30)):
			text += RNG.pick([
				" Wet slurping noises can be heard from {sub.you}.",
				" {sub.You} {sub.youAre} making wet noises with {sub.yourHis} mouth.",
			])
	
	if(isDomWearingStrapon()):
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
	return {text = text}


func doDeepthroatTurnDom():
	getSub().gotOrificeStretchedBy(BodypartSlot.Head, getDomID(0), true, 0.1)
	affectSub(getSubInfo(0).fetishScore({Fetish.OralSexGiving: 1.0})-0.3, 0.1, -0.1, -0.01)
	affectDom(getDomInfo(0).fetishScore({Fetish.OralSexReceiving: 0.5})+0.6, 0.1*getDomPenisSensetivity(), 0.0)
	getSubInfo(0).addArousalForeplay(0.06)
	getDomInfo(0).stimulateArousalZone(0.25, BodypartSlot.Penis, 1.0)
	
	var text = RNG.pick([
		"{sub.You} {sub.youVerb('deepthroat')} that "+getDomDickName()+".",
	])
	if(getSubInfo(0).isUnconscious()):
		text = RNG.pick([
			"{sub.You} {sub.youAre} being forced to deepthroat that "+getDomDickName()+".",
			"{dom.You} {dom.youAre} forcing {sub.yourHis} head deep onto {dom.yourHis} "+getDomDickName(RNG.pick(["cock", "dick", "length", "prick"]))+".",
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
	
	if(isDomWearingStrapon()):
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
	
	if(isDomWearingStrapon()):
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
	
	return {text = text}

func doPussyLickingTurnDom():
	affectSub(getSubInfo(0).fetishScore({Fetish.OralSexGiving: 1.0})+0.1, 0.1, -0.1, -0.01)
	affectDom(getDomInfo(0).fetishScore({Fetish.OralSexReceiving: 0.5})+0.6, 0.1, 0.0)
	getDomInfo(0).stimulateArousalZone(0.1, BodypartSlot.Vagina, 0.5)
	
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
	
	return {text = text, domSay=domReaction(SexReaction.DomsPussyGetsLicked, 10)}

func doPussyGrindingTurnDom():
	affectSub(getSubInfo(0).fetishScore({Fetish.OralSexGiving: 1.0})-0.1, 0.1, -0.1, -0.01)
	affectDom(getDomInfo(0).fetishScore({Fetish.OralSexReceiving: 0.5})+0.6, 0.1, 0.0)
	getDomInfo(0).stimulateArousalZone(0.1, BodypartSlot.Vagina, 0.5)
	
	var clothingItem = getDom().getFirstItemThatCoversBodypart(BodypartSlot.Vagina)
	var throughTheClothing = ""
	if(clothingItem != null):
		throughTheClothing = " through the "+clothingItem.getCasualName()
	var text = RNG.pick([
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
	
	return {text = text,domSay=domReaction(SexReaction.GrindingFaceWithPussy, 10)}

func doBlowjobTurnSub():
	affectSub(getSubInfo(0).fetishScore({Fetish.OralSexReceiving: 1.0})+0.6, 0.1, -0.1, -0.01)
	affectDom(getDomInfo(0).fetishScore({Fetish.OralSexGiving: 0.5})+0.1, 0.1, 0.0)
	getDomInfo(0).addArousalForeplay(0.03)
	getSubInfo(0).stimulateArousalZone(0.2, BodypartSlot.Penis, 1.0)
	getDom().gotOrificeStretchedBy(BodypartSlot.Head, getSubID(0), true, 0.05)
	
	var text = RNG.pick([
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
	return {text = text}

func doPussyLickingTurnSub():
	affectSub(getSubInfo(0).fetishScore({Fetish.OralSexReceiving: 1.0})+0.3, 0.1, -0.1, -0.01)
	affectDom(getDomInfo(0).fetishScore({Fetish.OralSexGiving: 0.5})+0.6, 0.1, 0.0)
	getSubInfo(0).stimulateArousalZone(0.1, BodypartSlot.Vagina, 0.5)
	
	var clothingItem = getSub().getFirstItemThatCoversBodypart(BodypartSlot.Vagina)
	var throughTheClothing = ""
	if(clothingItem != null):
		throughTheClothing = " through the "+clothingItem.getCasualName()
	var text = RNG.pick([
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
	
	return {text = text}
