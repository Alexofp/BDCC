extends Reference
class_name SexActivityBase

var id = "error"
var uniqueID = 0
var domID = null
var subID = null
var hasEnded = false
var sexEngine: WeakRef

var state:String = ""

func getSexEngine() -> SexEngine:
	if(sexEngine == null):
		return null
	return sexEngine.get_ref()

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

func canStartActivity(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	return tagsNotBusy(_sexEngine, _domInfo, _subInfo)

func getActivityScore(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	return 0.0

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
