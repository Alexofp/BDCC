extends Reference
class_name RecruitSystem

var recruits:Dictionary = {}

var currentID:String = ""
var replayMode:bool = false # If true, doing the recruiting stuff won't trigger the story scene of the recruit

func _init():
	for recruitID in GlobalRegistry.getRecruits():
		var theRec = GlobalRegistry.createRecruit(recruitID)
		if(!theRec):
			continue
		recruits[recruitID] = theRec

func clearCurrent():
	currentID = ""

func setCurrent(_id:String, _replayMode:bool = false) -> bool:
	if(!recruits.has(_id)):
		return false
	currentID = _id
	replayMode = _replayMode
	return true

func hasCurrent() -> bool:
	if(currentID.empty() || !recruits.has(currentID)):
		return false
	return true

func getRecruit():
	if(!hasCurrent()):
		return null
	return recruits[currentID]

func isReplayMode() -> bool:
	return replayMode

func getDebugActionOptions() -> Array:
	var result:Array = []
	for recruitID in recruits:
		result.append([recruitID, recruitID])
	return result

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
	}

func loadData(_data:Dictionary):
	currentID = SAVE.loadVar(_data, "currentID", "")
	replayMode = SAVE.loadVar(_data, "replayMode", false)
	
	# Assumes we re-create this system on load
	var recData:Dictionary = SAVE.loadVar(_data, "recruits", {})
	for recruitID in recData:
		if(!recruits.has(recruitID)):
			continue
		recruits[recruitID].loadData(recData[recruitID])
