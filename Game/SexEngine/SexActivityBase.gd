extends Reference
class_name SexActivityBase

var id = "error"
var uniqueID = 0
var domID = null
var subID = null
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
	var se = getSexEngine()
	if(se != null):
		return se.getSub()
	return null

func getDom() -> BaseCharacter:
	var se = getSexEngine()
	if(se != null):
		return se.getDom()
	return null

func initParticipants(theDomID, theSubID):
	domID = theDomID
	subID = theSubID

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

func getActivityScore(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	var goalData = getGoals()
	
	var resultScore = 0.0
	
	for goalID in goalData:
		if(_sexEngine.hasGoal(_domInfo, goalID, _subInfo)):
			resultScore += goalData[goalID]

	return resultScore

func getStopScore(stopscore = 2.0, alwaysstopscore = 0.0):
	var sexEngine = getSexEngine()
	
	var activityScore = getActivityScore(sexEngine, sexEngine.getDomInfo(domID), sexEngine.getSubInfo(subID))
	
	if(activityScore > 0.0):
		return alwaysstopscore
	return stopscore

func getDomAngryScore():
	var sexEngine = getSexEngine()
	var domInfo:SexDomInfo = sexEngine.getDomInfo(domID)
	return clamp(domInfo.anger, 0.0, 1.0)

func makeDomAngry(howmuch = 0.2):
	var sexEngine = getSexEngine()
	var domInfo:SexDomInfo = sexEngine.getDomInfo(domID)
	var personality: Personality = domInfo.getChar().getPersonality()
	var evilness = personality.getStat(PersonalityStat.Evilness)
	if(evilness >= 0.0):
		domInfo.makeAngry(howmuch * (1.0 + evilness))
	else:
		domInfo.makeAngry(howmuch * (1.0 + evilness))

func calmDomDown(howmuch = 0.2):
	var sexEngine = getSexEngine()
	var domInfo:SexDomInfo = sexEngine.getDomInfo(domID)
	domInfo.makeAngry(-howmuch)

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
