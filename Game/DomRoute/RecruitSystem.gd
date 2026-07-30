extends Reference
class_name RecruitSystem

var recruits:Dictionary = {}

var currentID:String = ""
var replayMode:bool = false # If true, doing the recruiting stuff won't trigger the story scene of the recruit
var mission:bool = false # Was this recruitment started from a mission

func _init():
	for recruitID in GlobalRegistry.getRecruits():
		var theRec = GlobalRegistry.createRecruit(recruitID)
		if(!theRec):
			continue
		recruits[recruitID] = theRec

func clearCurrent():
	currentID = ""
	replayMode = false

func clearCurrentIfMission():
	if(!mission):
		return
	currentID = ""
	replayMode = false

func setCurrent(_id:String, _replayMode:bool = false, _missionMode:bool = true) -> bool:
	if(!recruits.has(_id)):
		return false
	currentID = _id
	replayMode = _replayMode
	mission = _missionMode
	return true

func hasCurrent() -> bool:
	if(currentID.empty() || !recruits.has(currentID)):
		return false
	return true

func getRecruit():
	if(!hasCurrent()):
		return null
	return recruits[currentID]

func getRecruitName() -> String:
	if(!hasCurrent()):
		return "Unknown"
	return GlobalRegistry.getCharacter(recruits[currentID].charID).getName()

func isReplayMode() -> bool:
	return replayMode

func getDebugActionOptions() -> Array:
	var result:Array = []
	for recruitID in recruits:
		result.append([recruitID, recruitID])
	return result

func submitContext(_context:RecruitContext):
	var theRecruit = getRecruit()
	if(theRecruit):
		theRecruit.onContext(_context)

# Called from KaitModule
func resetMainRoute():
	currentID = ""
	replayMode = false
	for recID in recruits:
		recruits[recID].completed = false
		recruits[recID].history.clear()

func saveData() -> Dictionary:
	var recData:Dictionary = {}
	for recruitID in recruits:
		var theRec = recruits[recruitID]
		if(!theRec.needsToBeSaved()):
			continue
		recData[recruitID] = theRec.saveData()
	
	return {
		currentID = currentID,
		recruits = recData,
		replayMode = replayMode,
		mission = mission,
	}

func loadData(_data:Dictionary):
	currentID = SAVE.loadVar(_data, "currentID", "")
	replayMode = SAVE.loadVar(_data, "replayMode", false)
	mission = SAVE.loadVar(_data, "mission", false)
	
	# Assumes we re-create this system on load
	var recData:Dictionary = SAVE.loadVar(_data, "recruits", {})
	for recruitID in recData:
		if(!recruits.has(recruitID)):
			continue
		recruits[recruitID].loadData(recData[recruitID])
