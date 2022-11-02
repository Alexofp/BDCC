extends Reference
class_name SexActivityBase

var id = "error"
var uniqueID = 0
var domID = null
var subID = null
var domInfo: SexDomInfo
var subInfo: SexSubInfo

var hasEnded = false
var sexEngineRef: WeakRef
var startedByDom = true
var startedBySub = false

var state:String = ""

func getVisibleName():
	return id

func getCategory():
	return []

func getSexEngine() -> SexEngine:
	if(sexEngineRef == null):
		return null
	return sexEngineRef.get_ref()

func getSub() -> BaseCharacter:
	return GlobalRegistry.getCharacter(subID)

func getDom() -> BaseCharacter:
	return GlobalRegistry.getCharacter(domID)

func initParticipants(theDomID, theSubID):
	domID = theDomID
	subID = theSubID
	
	domInfo = getSexEngine().getDomInfo(domID)
	subInfo = getSexEngine().getSubInfo(subID)

func endActivity():
	hasEnded = true

func getGoals():
	return {}

func satisfyGoals():
	var goalData = getGoals()
	var sexEngine = getSexEngine()
	
	for goalID in goalData:
		sexEngine.satisfyGoal(sexEngine.getDomInfo(domID), goalID, sexEngine.getSubInfo(subID))

func canStartActivity(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	return tagsNotBusy(_sexEngine, _domInfo, _subInfo) && !hasActivity(_sexEngine, id, _domInfo, _subInfo)

func canBeStartedByDom():
	return startedByDom
	
func canBeStartedBySub():
	return startedBySub

func getActivityBaseScore(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	return 0.0

func getActivityScore(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	var goalData = getGoals()
	
	var resultScore = getActivityBaseScore(_sexEngine, _domInfo, _subInfo)
	
	for goalID in goalData:
		if(_sexEngine.hasGoal(_domInfo, goalID, _subInfo)):
			resultScore += goalData[goalID]

	return resultScore

func getActivityScoreSub(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	return getActivityBaseScore(_sexEngine, _domInfo, _subInfo)

func getStopScore(stopscore = 2.0, alwaysstopscore = 0.0):
	var sexEngine = getSexEngine()
	
	var activityScore = getActivityScore(sexEngine, sexEngine.getDomInfo(domID), sexEngine.getSubInfo(subID))
	
	if(activityScore > 0.0):
		return alwaysstopscore
	return stopscore

func hasActivity(_sexEngine: SexEngine, theid, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	return _sexEngine.hasActivity(theid, _domInfo.charID, _subInfo.charID)

func tagsNotBusy(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	var domTags = getDomTags()
	for tag in domTags:
		if(_sexEngine.hasTag(_domInfo.charID, tag)):
			return false
	
	var subTags = getSubTags()
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

func processTurn():
	return {
		text = str(id)+" IS STILL HAPPENING.",
	}

func getDomActions():
	return []

func doDomAction(_id, _actionInfo):
	return {
		"text": "Bad stuff happened",
	}
	
func getSubActions():
	return []

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

func subReaction(reactionID, chance = 100, fetishes = {}):
	if(chance >= 100 || RNG.chance(chance)):
		return getSub().getVoice().getSubReaction(reactionID, getSexEngine(), domInfo, subInfo, subFetishScore(fetishes))

func domReaction(reactionID, chance = 100, fetishes = {}):
	if(chance >= 100 || RNG.chance(chance)):
		return getSub().getVoice().getDomReaction(reactionID, getSexEngine(), domInfo, subInfo, domFetishScore(fetishes))

func getAnimation():
	return null
