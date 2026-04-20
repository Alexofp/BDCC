extends Reference
class_name SexReactionHandler

const REACT_CHANCE = 0
const REACT_TOGETHER = 1
const REACT_CHANCES = 2

const DOM_0 = 0
const DOM_1 = 1
const DOM_2 = 2

const SUB_0 = -1
const SUB_1 = -2
const SUB_2 = -3

const ROLE_MAIN = 0
const ROLE_TARGET = 1
const ROLE_EXTRA = 2
const ROLE_EXTRA_2 = 3

var chanceToReact:float = 100.0
var handles:Dictionary = {}

var handlerWeight:float = 1.0

func shouldSayTogether(_reactionID:int) -> bool:
	if(handles.has(_reactionID) && handles[_reactionID].has(REACT_TOGETHER)):
		return handles[_reactionID][REACT_TOGETHER]
	return false

func getChance(_reactionID:int) -> float:
	if(!shouldSayTogether(_reactionID) && handles.has(_reactionID) && handles[_reactionID].has(REACT_CHANCES)):
		var theChances:Array = handles[_reactionID][REACT_CHANCES]
		if(indxTemp < theChances.size()):
			return theChances[indxTemp]
	
	if(handles.has(_reactionID) && handles[_reactionID].has(REACT_CHANCE)):
		return handles[_reactionID][REACT_CHANCE]
	return chanceToReact

func checkChance(_reactionID:int, _chances:Array = []) -> bool:
	if(!_chances.empty()):
		if(indxTemp >= 0 && indxTemp < _chances.size()):
			return RNG.chance(_chances[indxTemp])
	return RNG.chance(getChance(_reactionID))

func addLines(_lines:Array):
	linesTemp.append_array(_lines)

func getLines(_reaction:int, _role:int, _args:Array):
	addLines(["Fuck you!"])

func say(_indx:int, _args:Array):
	if(_indx >= 0 && sexEngineTemp.domsNoTalking):
		return
	
	activityIndxTemp = _indx
	tempInfo = activityTemp.getDomOrSubInfo(activityIndxTemp)
	getLines(idTemp, indxTemp, _args)
	
	if(!linesTemp.empty()):
		talk(_indx, RNG.pick(linesTemp))
	
	tempInfo = null
	linesTemp.clear()

func talk(_indx1:int, _text:String):
	var theOverrides:Dictionary = {}
	for _i in range(actorsTemp.size()):
		var theID:String = getChar(_i).getID()
		if(_i == 0):
			theOverrides["main"] = theID
		if(_i == 1):
			theOverrides["target"] = theID
		if(_i == 2):
			theOverrides["extra"] = theID
		if(_i == 3):
			theOverrides["extra2"] = theID
	
	talkRaw(_indx1, GM.ui.processString(_text, theOverrides))

func talkRaw(_indx1:int, _text:String):
	activityTemp.talkText(_indx1, _text)

var linesTemp:Array = []
var sexEngineTemp
var activityTemp
var idTemp:int
var activityIndxTemp:int# DOM_0, SUB_0 (activity index)
var indxTemp:int# 0, 1, 2 (indx of an _actors array)
var tempInfo
var actorsTemp

func doReactFinal(_id:int, _actors:Array, _chances:Array, _activity, _sexEngine, _args:Array):
	activityTemp = _activity
	sexEngineTemp = _sexEngine
	idTemp = _id
	actorsTemp = _actors
	
	var shouldTogether:bool = shouldSayTogether(_id)
	if(shouldTogether):
		indxTemp = 0
		if(checkChance(_id, _chances)):
			for actorIndx in _actors:
				say(actorIndx, _args)
				indxTemp += 1
	else:
		indxTemp = 0
		for actorIndx in _actors:
			if(checkChance(_id, _chances)):
				say(actorIndx, _args)
			indxTemp += 1
	
	activityTemp = null
	sexEngineTemp = null
	actorsTemp = null

func isMain() -> bool:
	return indxTemp == 0
func isTarget() -> bool:
	return indxTemp == 1

func isDom() -> bool:
	return (tempInfo is SexDomInfo)
func isSub() -> bool:
	return (tempInfo is SexSubInfo)

func getInfo(_indx:int=-1) -> SexInfoBase:
	if(_indx < 0):
		return tempInfo
	if(!actorsTemp || (_indx >= actorsTemp.size())):
		Log.printerr("SexReactionHandler.getInfo() the index wasn't provided! ActorsTemp="+str(actorsTemp)+", indx="+str(_indx))
		return null
	return activityTemp.getDomOrSubInfo(actorsTemp[_indx])

func hatesFetish(fetishID:String, _indx:int=-1) -> bool:
	var theInfo := getInfo(_indx)
	if(!theInfo):
		return false
	return theInfo.fetishScore({fetishID: 1.0}) < 0.0

func lovesFetish(fetishID:String, _indx:int=-1) -> bool:
	var theInfo := getInfo(_indx)
	if(!theInfo):
		return false
	return theInfo.fetishScore({fetishID: 1.0}) > 0.0

func isResisting(_indx:int=-1) -> bool:
	var theInfo := getInfo(_indx)
	if(!theInfo || (theInfo is SexDomInfo)):
		return false
	if(theInfo is SexSubInfo):
		return theInfo.isResisting()
	return false

func getChar(_indx:int=-1) -> BaseCharacter:
	var theInfo := getInfo(_indx)
	if(!theInfo):
		return null
	return theInfo.getChar()

func isSubby(_indx:int=-1) -> bool:
	var theInfo:SexInfoBase = getInfo(_indx)
	if(!theInfo):
		return false
	return theInfo.personalityScore({PersonalityStat.Subby:1.0})>0.4

func isMean(_indx:int=-1) -> bool:
	var theInfo:SexInfoBase = getInfo(_indx)
	if(!theInfo):
		return false
	return theInfo.personalityScore({PersonalityStat.Mean:1.0})>0.5

func isScared(_indx:int=-1) -> bool:
	var theInfo:SexInfoBase = getInfo(_indx)
	if(!theInfo):
		return false
	if(theInfo is SexSubInfo):
		if(theInfo.isScared()):
			return true
	return false

func isAngry(_indx:int=-1) -> bool:
	var theInfo:SexInfoBase = getInfo(_indx)
	if(!theInfo):
		return false
	if(theInfo is SexDomInfo):
		if(theInfo.personalityScore({PersonalityStat.Mean:1.0})>0.5 || theInfo.isAngry()):
			return true
		return false
	if(theInfo is SexSubInfo):
		if(theInfo.personalityScore({PersonalityStat.Mean:1.0})>0.5 || theInfo.isResisting()):
			return true
		return false
	return false

func isVeryAngry(_indx:int=-1) -> bool:
	var theInfo:SexInfoBase = getInfo(_indx)
	if(!theInfo):
		return false
	if(theInfo is SexDomInfo):
		if(theInfo.personalityScore({PersonalityStat.Mean:1.0})>0.5 && theInfo.isAngry()):
			return true
		return false
	if(theInfo is SexSubInfo):
		if(theInfo.personalityScore({PersonalityStat.Mean:1.0})>0.5 && theInfo.isResisting()):
			return true
		return false
	return false
