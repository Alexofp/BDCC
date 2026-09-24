extends MissionBase

func _init():
	id = "Mission3"
	name = "Just Lab Stuff"
	desc = "You recruited Ferri, a chemist dracat. But now you need to get a chemistry lab setup for her."
	
	startScene = "DomM3s1Intro"
	requiredMissions = ["Mission2"]
	
	flags = {
		"s1": flag(FlagType.Bool), # Did we start the first search for the storage room
		"s2": flag(FlagType.Bool), # Found the room. But now we need to find a badge in the showers room
		"s3": flag(FlagType.Bool), # Got the badge, gotta return back
		"nurse": flag(FlagType.Text), # "letgo", "reward", "break"
		"scarlet": flag(FlagType.Text), # "nothing", "nothingpeek", "shower", "finger", "fuck", "fuckpullout"
	}
	
	decisions = {
		"nurse": {
			name = "Nurse outcome",
			outcomes = {
				"letgo": {
					text = "Let go",
					effects = [
						#DECISION_EFFECT_KAIT_OBEDIENCE,
					],
					kaitLine = "Letting her go was stupid. I don't wanna lie to people. If I promised that nurse to reward her, we should have rewarded her.",
					avyLine = "Letting that bitch go was dumb. If she talks, I swear.",
				},
				"reward": {
					text = "Rewarded",
					effects = [
						DECISION_EFFECT_KAIT_LOVE,
					],
					kaitLine = "I'm certain that the nurse won't talk now. Not after what we did to her~.",
					avyLine = "Hope you had fun with that bitch. And the other bitch.",
				},
				"break": {
					text = "Broken",
					effects = [
						DECISION_EFFECT_AVY_LOVE,
					],
					kaitLine = "Hope you didn't kill the girl. I don't wanna lie to people. If I promised that nurse to reward her, we should have rewarded her.",
					avyLine = "You know what, that was fun. We should be breaking more people.",
				},
			},
		}
	}
	
	rewardExp = 100
	rewardCredits = 10

func onMissionStart():
	setMissionMarker("med_lobby_start")

func getObjectives() -> Array:
	var result:Array = []
	
	result.append("Meet your team in the medical lobby. Use the lift to get down to the medical wing.")
	if(getFlag("s1", false)):
		result.append("Find the medical storage room. It should be somewhere in the staff-only area.")
	if(getFlag("s2", false)):
		result.append("The storage room is locked! You need to find a working badge somewhere near the showers of the medical wing!")
	if(getFlag("s3", false)):
		result.append("You have a badge, go back to the storage room!")
	
	return result

func getStartSceneButtonsLoc(_loc:String) -> Array:
	#if(!getFlag("s2", false) && _loc == "cellblock_red_nearcell"): # Check flags
	#	return [startSceneButton("DomM2s2", [], "Mission", "Meet your team here and look for Ferri!")]
	
	return []

func onSceneStart(_sceneID:String, _args:Array):
	if(_sceneID == "DomM3s2Lobby"):
		setFlag("s1", true)
		setMissionMarker("med_near_storage")
		GM.main.IS.spawnPawnWithTypeAt(CharacterType.Nurse, "med_corridor5")
		GM.main.IS.spawnPawnWithTypeAt(CharacterType.Nurse, "med_corridor_split2")
	if(_sceneID == "DomM3s3StorageLocked"):
		setFlag("s2", true)
		setMissionMarker("med_nearshower")
		GM.main.IS.spawnPawnWithTypeAt(CharacterType.Nurse, "med_corridor4")
	if(_sceneID == "DomM3s4Shower"):
		setFlag("s3", true)
		setMissionMarker("med_near_storage")
		GM.main.IS.spawnPawnWithTypeAt(CharacterType.Nurse, "med_corridor4")
		GM.main.IS.spawnPawnWithTypeAt(CharacterType.Nurse, "med_corridor6")
	if(_sceneID == "DomM3s5Return"):
		clearMissionMarkers()
	pass

func onSimpleScene(_eventID:String, _args:Array, _scene):
	if(_eventID == "roomlocked"):
		GM.pc.setLocation("med_near_storage")
	if(_eventID == "roomleaveleft"):
		GM.pc.setLocation("med_nearlab")
	if(_eventID == "roomleaveright"):
		GM.pc.setLocation("medical_nearconfessionary")

func getEventSceneLoc(_loc:String) -> Array:
	if(_loc == "medical_storage"):
		return ["MissionSimpleScene", ["You try to enter the storage room but it's locked! And so you go back..", "roomlocked", []]]
	if(getFlag("s1", false)):
		if(_loc == "med_staffonly_door1"):
			return ["MissionSimpleScene", ["You won't be able to enter this area again if you leave. So you don't.", "roomleaveleft", []]]
		if(_loc == "med_staffonly_door2"):
			return ["MissionSimpleScene", ["You won't be able to enter this area again if you leave. So you don't.", "roomleaveright", []]]
		
	if(!getFlag("s1", false)):
		if(_loc == "med_lobby_start"):
			return ["DomM3s2Lobby", []]
	elif(!getFlag("s2", false)):
		if(_loc == "med_near_storage"):
			return ["DomM3s3StorageLocked", []]
	elif(!getFlag("s3", false)):
		if(_loc == "med_nearshower"):
			return ["DomM3s4Shower", []]
	else:
		if(_loc == "med_near_storage"):
			return ["DomM3s5Return", []]
	return [] # [sceneid, args]
