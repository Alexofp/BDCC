extends Reference
class_name SexReactionHandler

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
var chanceByReaction:Dictionary = {}

var handlerWeight:float = 1.0

func getChance(_reactionID:int) -> float:
	if(chanceByReaction.has(_reactionID)):
		return chanceByReaction[_reactionID]
	return chanceToReact

func checkChance(_reactionID:int) -> bool:
	return RNG.chance(getChance(_reactionID))

func addLines(_lines:Array):
	linesTemp.append_array(_lines)

func getLines(_reaction:int, _role:int):
	addLines(["Fuck you!"])

func say(_indx:int):
	activityIndxTemp = _indx
	tempInfo = activityTemp.getDomOrSubInfo(activityIndxTemp)
	getLines(idTemp, indxTemp)
	
	if(!linesTemp.empty()):
		talkRaw(_indx, RNG.pick(linesTemp))
	
	tempInfo = null
	linesTemp.clear()

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

func doReactFinal(_id:int, _actors:Array, _activity, _sexEngine, _args:Array):
	activityTemp = _activity
	sexEngineTemp = _sexEngine
	idTemp = _id
	actorsTemp = _actors
	
	if(checkChance(_id)):
		indxTemp = 0
		for actorIndx in _actors:
			say(actorIndx)
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

func getInfo() -> SexInfoBase:
	return tempInfo
func isAngry() -> bool:
	var theInfo:SexInfoBase = getInfo()
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

func isVeryAngry() -> bool:
	var theInfo:SexInfoBase = getInfo()
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
