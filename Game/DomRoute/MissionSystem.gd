extends Reference
class_name MissionSystem

var current:String = ""
var completed:Dictionary = {}
var flags:Dictionary = {} # mission id = dictionary[flag id] = flag value

func getAllPossibleMissions() -> Array:
	var result:Array = []
	
	for missionID in GlobalRegistry.missions:
		var theMission = GlobalRegistry.missions[missionID]
		if(theMission.isVisibleFinal()):
			result.append(theMission)
	
	return result

func isOnMission() -> bool:
	if(!current.empty()):
		return true
	return false

func canStartAnyMission() -> bool:
	if(isOnMission()):
		return false
	return true

func startMission(_id:String, _runScene:bool = true):
	if(!current.empty()):
		assert(false, "TRYING TO START A MISSION BUT WE'RE ALREADY ARE ON ONE!")
		return
	var theMission = GlobalRegistry.getMission(_id)
	if(!theMission):
		assert(false, "MISSION WITH ID "+_id+" IS NOT FOUND!")
		return
	current = _id
	flags[current] = {} # Reset all flags of this mission. Maybe not needed?
	
	if(_runScene):
		GM.main.runScene(theMission.getStartScene())
	GM.main.addMessage("Task accepted!")

func isCompleted(_missionID:String) -> bool:
	return completed.has(_missionID)

func cancelCurrentMission():
	current = ""

func completeMission():
	if(!isOnMission()):
		assert(false, "TRYING TO MARK MISSION AS COMPLETED WHEN WE'RE NOT ON A MISSION")
		return
	completed[current] = true
	current = ""
	GM.main.addMessage("Task completed!")
	# Add experience here?

func getDebugMissionList() -> Array:
	var result:Array = []
	for missionID in GlobalRegistry.missions:
		result.append([missionID, missionID+":"+GlobalRegistry.missions[missionID].getName()])
	return result

func setFlag(_missionID:String, _flagID:String, _value):
	var theMission = GlobalRegistry.getMission(_missionID)
	if(!theMission):
		assert(false, "MISSION WITH ID "+_missionID+" IS NOT FOUND!")
		return
	if(!theMission.flags.has(_flagID)):
		assert(false, "MISSION WITH ID "+_missionID+" DOEN'T HAVE A FLAG '"+_flagID+"'!")
		return
		
	# Check that the flag has the right type here
	
	if(!flags.has(_missionID)):
		flags[_missionID] = {}
	if(_value == null):
		flags[_missionID].erase(_flagID)
		return
	flags[_missionID][_flagID] = _value

func getFlag(_missionID:String, _flagID:String, _default = null):
	if(!flags.has(_missionID)):
		return _default
	if(!flags[_missionID].has(_flagID)):
		return _default
	return flags[_missionID][_flagID]

func isDoingMission(_id:String) -> bool:
	return current == _id

func saveData() -> Dictionary:
	return {
		current = current,
		completed = completed.keys(),
		flags = flags,
	}

func loadData(_data:Dictionary):
	current = SAVE.loadVar(_data, "current", "")
	var theCompletedKeys:Array = SAVE.loadVar(_data, "completed", [])
	completed.clear()
	for theMissionID in theCompletedKeys:
		completed[theMissionID] = true
	flags = SAVE.loadVar(_data, "flags", {})
