extends Reference
class_name MissionSystem

var current:String = ""
var completed:Dictionary = {}
var flags:Dictionary = {} # mission id = dictionary[flag id] = flag value
var pcPain:int = 0
var pcLust:int = 0
var pcStamina:int = 0 # Missing stamina

func getAllPossibleMissions() -> Array:
	var result:Array = []
	
	for missionID in GlobalRegistry.missions:
		var theMission = GlobalRegistry.missions[missionID]
		if(theMission.isVisibleFinal()):
			result.append(theMission)
	
	return result

func getAllPossibleMainMissions() -> Array:
	var result:Array = []
	for missionID in GlobalRegistry.missions:
		var theMission = GlobalRegistry.missions[missionID]
		if(!theMission.isSideMission() && theMission.isVisibleFinal()):
			result.append(theMission)
	return result

func getAllPossibleSideMissions() -> Array:
	var result:Array = []
	for missionID in GlobalRegistry.missions:
		var theMission = GlobalRegistry.missions[missionID]
		if(theMission.isSideMission() && theMission.isVisibleFinal()):
			result.append(theMission)
	return result

func getMissionStats() -> Array: # Check for secret missions?
	var totalMissionAmount:int = 0
	var completedMissionAmount:int = 0
	var totalSideMissionAmount:int = 0
	var completedSideMissionAmount:int = 0
	for missionID in GlobalRegistry.missions:
		var theMission = GlobalRegistry.missions[missionID]
		if(!theMission.isSideMission()):
			totalMissionAmount += 1
			if(isCompleted(missionID)):
				completedMissionAmount += 1
		else:
			totalSideMissionAmount += 1
			if(isCompleted(missionID)):
				completedSideMissionAmount += 1
		
	var result:Array = [
		"Completed missions: "+str(completedMissionAmount)+"/"+str(totalMissionAmount),
		"Side missions: "+str(completedSideMissionAmount)+"/"+str(totalSideMissionAmount),
	]
	
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
	# Could instead save the old flags in case we're doing this mission for the second time
	
	var theStartLoc:String = theMission.getStartLoc()
	if(!theStartLoc.empty()):
		GM.pc.setLocation(theStartLoc)
		GM.main.aimCameraAndSetLocName(theStartLoc)
	theMission.onMissionStart()
	if(_runScene):
		GM.main.runScene(theMission.getStartScene())
	GM.main.addMessage("Task accepted!")
	pcPain = GM.pc.getPain()
	pcLust = GM.pc.getLust()
	pcStamina = GM.pc.getMaxStamina() - GM.pc.getStamina()

func isCompleted(_missionID:String) -> bool:
	return completed.has(_missionID)

func cancelCurrentMission():
	current = ""

func failCurrentMission():
	current = ""
	
func restartCurrentMission(_resetStats:bool = true):
	if(!isOnMission()):
		return
	var theMissionID:String = current
	cancelCurrentMission()
	if(_resetStats):
		GM.pc.addPain(pcPain - GM.pc.getPain())
		GM.pc.addLust(pcLust - GM.pc.getLust())
		GM.pc.addStamina(GM.pc.getMaxStamina() - pcStamina - GM.pc.getStamina())
	startMission(theMissionID)

func completeMission():
	if(!isOnMission()):
		assert(false, "TRYING TO MARK MISSION AS COMPLETED WHEN WE'RE NOT ON A MISSION")
		return
	var wasAlreadyCompleted:bool = isCompleted(current)
	var theMission = GlobalRegistry.getMission(current)
	completed[current] = true
	current = ""
	GM.main.addMessage("Task completed!")
	# Add experience here?
	if(theMission):
		theMission.giveRewardFinal(wasAlreadyCompleted)
	
func getDebugMissionList() -> Array:
	var result:Array = []
	for missionID in GlobalRegistry.missions:
		result.append([missionID, missionID+":"+GlobalRegistry.missions[missionID].getName()])
	return result

func setSpecificFlag(_missionID:String, _flagID:String, _value):
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

func getSpecificFlag(_missionID:String, _flagID:String, _default = null):
	if(!flags.has(_missionID)):
		return _default
	if(!flags[_missionID].has(_flagID)):
		return _default
	return flags[_missionID][_flagID]

func setFlag(_flagID:String, _value):
	if(current.empty()):
		Log.printerr("TRYING TO SET A MISSION FLAG WHILE NOT ON A MISSION.")
		return
	setSpecificFlag(current, _flagID, _value)

func getFlag(_flagID:String, _default = null):
	if(current.empty()):
		Log.printerr("TRYING TO GET A MISSION FLAG WHILE NOT ON A MISSION.")
		return _default
	return getSpecificFlag(current, _flagID, _default)

func isDoingMission(_id:String) -> bool:
	return current == _id

func getMission():
	if(current.empty()):
		return null
	return GlobalRegistry.getMission(current)

func saveData() -> Dictionary:
	return {
		current = current,
		completed = completed.keys(),
		flags = flags,
		pcPain = pcPain,
		pcLust = pcLust,
		pcStamina = pcStamina,
	}

func loadData(_data:Dictionary):
	current = SAVE.loadVar(_data, "current", "")
	var theCompletedKeys:Array = SAVE.loadVar(_data, "completed", [])
	completed.clear()
	for theMissionID in theCompletedKeys:
		completed[theMissionID] = true
	flags = SAVE.loadVar(_data, "flags", {})
	pcPain = SAVE.loadVar(_data, "pcPain", 0)
	pcLust = SAVE.loadVar(_data, "pcLust", 0)
	pcStamina = SAVE.loadVar(_data, "pcStamina", 0)
