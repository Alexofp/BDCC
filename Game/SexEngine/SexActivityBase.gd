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
	return true

func startActivity(_args):
	return {
		text = str(id)+" HAS STARTED",
	}

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
