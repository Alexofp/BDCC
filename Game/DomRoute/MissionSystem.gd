extends Reference
class_name MissionSystem

var current:String = ""
var completed:Dictionary = {}
var flags:Dictionary = {} # mission id = dictionary[flag id] = flag value
var pcPain:int = 0
var pcLust:int = 0
var pcStamina:int = 0 # Missing stamina
var oldFlags:Dictionary = {} # The old flags of the mission that we have started again
var replayMode:bool = false # Are we replaying a mission for the second time
var missionMarkers:Array = [] # Locations of rooms that should have a mission marker

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

func getAllCompletedMainMissions() -> Array:
	var result:Array = []
	for missionID in completed:
		if(!GlobalRegistry.missions.has(missionID)):
			continue
		var theMission = GlobalRegistry.missions[missionID]
		if(!theMission.isSideMission()):
			result.append(theMission)
	return result

func getAllCompletedSideMissions() -> Array:
	var result:Array = []
	for missionID in completed:
		if(!GlobalRegistry.missions.has(missionID)):
			continue
		var theMission = GlobalRegistry.missions[missionID]
		if(theMission.isSideMission()):
			result.append(theMission)
	return result

func getMissionStats() -> Array: # Check for secret missions?
	var totalMissionAmount:int = 0
	var completedMissionAmount:int = 0
	var totalSideMissionAmount:int = 0
	var completedSideMissionAmount:int = 0
	for missionID in GlobalRegistry.missions:
		var theMission = GlobalRegistry.missions[missionID]
		if(theMission.isDisabled()):
			continue
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

func didCompleteAllMainMissions() -> bool:
	var totalMissionAmount:int = 0
	var completedMissionAmount:int = 0
	for missionID in GlobalRegistry.missions:
		var theMission = GlobalRegistry.missions[missionID]
		if(theMission.isDisabled()):
			continue
		if(!theMission.isSideMission()):
			totalMissionAmount += 1
			if(isCompleted(missionID)):
				completedMissionAmount += 1
#		else:
#			totalSideMissionAmount += 1
#			if(isCompleted(missionID)):
#				completedSideMissionAmount += 1
	
	if(completedMissionAmount >= totalMissionAmount):
		return true
	return false

func didCompleteAllSideMissions() -> bool:
	var totalSideMissionAmount:int = 0
	var completedSideMissionAmount:int = 0
	for missionID in GlobalRegistry.missions:
		var theMission = GlobalRegistry.missions[missionID]
		if(theMission.isDisabled()):
			continue
		if(!theMission.isSideMission()):
			pass
#			totalMissionAmount += 1
#			if(isCompleted(missionID)):
#				completedMissionAmount += 1
		else:
			totalSideMissionAmount += 1
			if(isCompleted(missionID)):
				completedSideMissionAmount += 1
	
	if(completedSideMissionAmount >= totalSideMissionAmount):
		return true
	return false

func isOnMission() -> bool:
	if(!current.empty()):
		return true
	return false

func canStartAnyMission() -> bool:
	if(isOnMission()):
		return false
	return true

func autoCompleteNextMainMission():
	if(!current.empty()):
		return
	var theMainMissions:Array = GM.main.MS.getAllPossibleMainMissions()
	if(theMainMissions.empty()):
		return
	var theMission = theMainMissions[0]
	startMission(theMission.id, false, false)
	for theDecisionID in theMission.decisions:
		setDecision(theDecisionID, theMission.decisions[theDecisionID]["outcomes"].keys()[0])
	completeMission()

func startMission(_id:String, _runScene:bool = true, _announceIt:bool = true, _replayMode:bool = false):
	if(!current.empty()):
		assert(false, "TRYING TO START A MISSION BUT WE'RE ALREADY ARE ON ONE!")
		return
	var theMission = GlobalRegistry.getMission(_id)
	if(!theMission):
		assert(false, "MISSION WITH ID "+_id+" IS NOT FOUND!")
		return
	current = _id
	oldFlags = flags[current].duplicate(true) if flags.has(current) else {} # Saving the old flags in case we're restarting
	flags[current] = {} # Reset all flags of this mission
	replayMode = _replayMode
	
	var theStartLoc:String = theMission.getStartLoc()
	if(!theStartLoc.empty()):
		GM.pc.setLocation(theStartLoc)
		GM.main.aimCameraAndSetLocName(theStartLoc)
	theMission.onMissionStart()
	if(_runScene):
		GM.main.runScene(theMission.getStartScene())
	if(_announceIt):
		GM.main.addMessage("Task accepted!")
	pcPain = GM.pc.getPain()
	pcLust = GM.pc.getLust()
	pcStamina = GM.pc.getMaxStamina() - GM.pc.getStamina()

func isCompleted(_missionID:String) -> bool:
	return completed.has(_missionID)

func setMissionCompleteStatus(_missionID:String, _completed:bool):
	if(_completed):
		completed[_missionID] = true
	else:
		completed.erase(_missionID)

func canCancelCurrentMission() -> bool:
	if(current.empty()):
		return false
	var theMission = GlobalRegistry.getMission(current)
	if(!theMission):
		return false
	if(!theMission.canCancelAtAnyTime()):
		return false
	return true

func restoreOldFlags():
	if(oldFlags.empty()):
		flags.erase(current)
	else:
		flags[current] = oldFlags # Restore old flags
	oldFlags = {}

func cancelCurrentMission():
	if(current.empty()):
		return
	restoreOldFlags()
	clearMissionMarkers()
	current = ""
	GM.main.RCS.clearCurrentIfMission()

func failCurrentMission():
	if(replayMode): # If we're replaying the mission, restore the old flags
		restoreOldFlags()
		replayMode = false
	else:
		flags.erase(current) # Make sure there is nothing recorded about what we did
	clearMissionMarkers()
	current = ""
	GM.main.RCS.clearCurrentIfMission()
	
func restartCurrentMission(_resetStats:bool = true):
	if(!isOnMission()):
		return
	var theMissionID:String = current
	cancelCurrentMission()
	if(_resetStats):
		GM.pc.addPain(pcPain - GM.pc.getPain())
		GM.pc.addLust(pcLust - GM.pc.getLust())
		GM.pc.addStamina(GM.pc.getMaxStamina() - pcStamina - GM.pc.getStamina())
	startMission(theMissionID, true, true, replayMode)

func completeMission():
	var oldDidCompleteAll := didCompleteAllMainMissions()
	if(!isOnMission()):
		assert(false, "TRYING TO MARK MISSION AS COMPLETED WHEN WE'RE NOT ON A MISSION")
		return
	var wasAlreadyCompleted:bool = isCompleted(current)
	var theMission = GlobalRegistry.getMission(current)
	completed[current] = true
	clearMissionMarkers()
	current = ""
	GM.main.addMessage("Task completed!")
	# Add experience here?
	if(theMission):
		theMission.giveRewardFinal(wasAlreadyCompleted)
	
	if(!oldDidCompleteAll && didCompleteAllMainMissions()):
		GM.main.addMessage("You have completed all of the currently available main missions of this route! Next update will have more, hopefully.")
		if(!didCompleteAllSideMissions()):
			GM.main.addMessage("You can still do the side missions!")
		
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

func setDecision(_flagID:String, _value):
	if(current.empty()):
		Log.printerr("TRYING TO SET A MISSION DECISION WHILE NOT ON A MISSION.")
		return
	setDecisionSpecific(current, _flagID, _value)

func setDecisionSpecific(_missionID:String, _flagID:String, _value):
	var oldKaitLove := getKaitLove()
	var oldKaitObedience := getKaitObedience()
	var oldAvyLove := getAvyLove()
	var oldAvyObedience := getAvyObedience()
	
	setSpecificFlag(_missionID, _flagID, _value)
	
	var theMission = GlobalRegistry.getMission(_missionID)
	if(theMission && theMission.decisions.has(_flagID)):
		var theDecision:Dictionary = theMission.decisions[_flagID]
		var theOutcomes:Dictionary = theDecision.get("outcomes", {})
		if(theOutcomes.has(_value)):
			var theOutcome:Dictionary = theOutcomes[_value]
			
			if(theOutcome.has("kaitLine")):
				setKaitLine(theOutcome["kaitLine"])
			if(theOutcome.has("avyLine")):
				setAvyLine(theOutcome["avyLine"])
	
	if(oldKaitLove < 2 && getKaitLove() >= 2):
		GM.main.addMessage("You've unlocked the first 'Love' scenes with Kait! Go talk with her when you can.")
	if(oldKaitObedience < 2 && getKaitObedience() >= 2):
		GM.main.addMessage("You've unlocked the first 'Obedience' scenes with Kait! Go talk with her when you can.")
	if(oldAvyLove < 2 && getAvyLove() >= 2):
		GM.main.addMessage("You've unlocked the first 'Love' scenes with Avy! Go talk with her when you can.")
	if(oldAvyObedience < 2 && getAvyObedience() >= 2):
		GM.main.addMessage("You've unlocked the first 'Obedience' scenes with Avy! Go talk with her when you can.")

func isDoingMission(_id:String) -> bool:
	return current == _id

func getMission():
	if(current.empty()):
		return null
	return GlobalRegistry.getMission(current)

const DECISION_EFFECT_AVY_LOVE := 0
const DECISION_EFFECT_KAIT_LOVE := 1
const DECISION_EFFECT_AVY_OBEDIENCE := 2
const DECISION_EFFECT_KAIT_OBEDIENCE := 3

func getKaitLove() -> int:
	return getEffectValue(DECISION_EFFECT_KAIT_LOVE)

func getKaitObedience() -> int:
	return getEffectValue(DECISION_EFFECT_KAIT_OBEDIENCE)

func getAvyLove() -> int:
	return getEffectValue(DECISION_EFFECT_AVY_LOVE)

func getAvyObedience() -> int:
	return getEffectValue(DECISION_EFFECT_AVY_OBEDIENCE)

func getEffectValue(_effectID:int) -> int:
	var result:int = 0
	
	var theMissionIDsToCheck:Array = completed.keys()
	if(isOnMission()):
		theMissionIDsToCheck.append(current)
	for missionID in theMissionIDsToCheck:
		var theMission = GlobalRegistry.getMission(missionID)
		if(!theMission):
			continue
		for theFlagID in theMission.decisions:
			var theDecision:Dictionary = theMission.decisions[theFlagID]
			var theOutcomes:Dictionary = theDecision.get("outcomes", {})
			var theCurVal = getSpecificFlag(missionID, theFlagID, "")
			if(!theOutcomes.has(theCurVal)):
				continue
			var theOutcome:Dictionary = theOutcomes[theCurVal]
			
			for theEffect in theOutcome["effects"]:
				if(theEffect == _effectID):
					result += 1
	
	return result

func getDecisionsStrings(_missionID:String) -> Array:
	#if(!isCompleted(_missionID)):
	#	return []
	var theMission = GlobalRegistry.getMission(_missionID)
	if(!theMission):
		return []
	var result:Array = []
	for theFlagID in theMission.decisions:
		var theDecision:Dictionary = theMission.decisions[theFlagID]
		var theOutcomes:Dictionary = theDecision.get("outcomes", {})
		var theCurVal = getSpecificFlag(_missionID, theFlagID, "")
		if(!theOutcomes.has(theCurVal)):
			result.append(theDecision["name"]+": Unknown")
			continue
		var theEffectsStrArray:Array = []
		var theOutcome:Dictionary = theOutcomes[theCurVal]
		for theEffect in theOutcome.get("effects", []):
			if(theEffect == DECISION_EFFECT_AVY_LOVE):
				theEffectsStrArray.append("Avi's Love +")
			elif(theEffect == DECISION_EFFECT_AVY_OBEDIENCE):
				theEffectsStrArray.append("Avi's Obedience +")
			elif(theEffect == DECISION_EFFECT_KAIT_LOVE):
				theEffectsStrArray.append("Kait's Love +")
			elif(theEffect == DECISION_EFFECT_KAIT_OBEDIENCE):
				theEffectsStrArray.append("Kait's Obedience +")
		result.append(theDecision["name"]+": "+theOutcome["text"]+("" if theEffectsStrArray.empty() else (" ("+Util.humanReadableList(theEffectsStrArray)+")")))
	return result
	
# Called from KaitModule
func resetMainRoute():
	clearMissionMarkers()
	current = ""
	completed.clear()
	flags.clear()

func setKaitLine(_text:String):
	GM.main.setFlag("KaitModule.kaitApproach", _text)

func setAvyLine(_text:String):
	GM.main.setFlag("KaitModule.avyApproach", _text)

func clearMissionMarkers():
	if(!current.empty()):
		setMissionMarkers([])

func setMissionMarkers(_Ar:Array):
	if(!isOnMission()):
		Log.printerr("Trying to call setMissionMarkers("+str(_Ar)+") while not on a mission!")
		_Ar = []
	if(_Ar != missionMarkers):
		missionMarkers = _Ar.duplicate()
	GM.world.setMissionRooms(_Ar)

func internal_setMissionMarkers(_Ar:Array):
	GM.world.setMissionRooms(_Ar)

func setMissionMarker(_loc:String):
	setMissionMarkers([_loc] if !_loc.empty() else [])

func saveData() -> Dictionary:
	return {
		current = current,
		completed = completed.keys(),
		flags = flags,
		pcPain = pcPain,
		pcLust = pcLust,
		pcStamina = pcStamina,
		oldFlags = oldFlags,
		replayMode = replayMode,
		missionMarkers = missionMarkers,
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
	oldFlags = SAVE.loadVar(_data, "oldFlags", {})
	replayMode = SAVE.loadVar(_data, "replayMode", false)
	missionMarkers = SAVE.loadVar(_data, "missionMarkers", [])
	call_deferred("internal_setMissionMarkers", missionMarkers) # Ehh, just a visual thing, its fine to use call_deferred here
