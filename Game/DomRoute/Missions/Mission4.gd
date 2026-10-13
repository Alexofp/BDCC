extends MissionBase

func _init():
	id = "Mission4"
	name = "The Quinn's Gambit"
	desc = "It's time to figure out how are you gonna get your hands on Eliza Quinn, the chemist doctor."
	
	startScene = "DomM4s1Intro"
	requiredMissions = ["Mission3"]
	
	flags = {
		"t": flag(FlagType.Bool), # Did Tavi's scene happen
		"tavi": flag(FlagType.Text), # "tryfight", "letgo"
		"kait": flag(FlagType.Text), # "letgo", "avy"
	}
	
	decisions = {
		"kait": {
			name = "Let Kait go or make her thank Avy",
			outcomes = {
				"letgo": {
					text = "Let Kait go",
					effects = [
						DECISION_EFFECT_AVY_OBEDIENCE,
					],
					kaitLine = "Got my uniform back. I almost caught Eliza myself. But yeah, she was ready for me.",
					avyLine = "That bitch got what she deserved. I guess both of them did.",
				},
				"avy": {
					text = "Thank Avy",
					effects = [
						DECISION_EFFECT_KAIT_OBEDIENCE,
					],
					kaitLine = "Got my uniform back. I almost caught Eliza myself. But yeah.. I overextended a bit too much.",
					avyLine = "That bitch got what she deserved. The nerd one.",
				},
			},
		}
	}
	
	rewardExp = 200
	rewardCredits = 0

func onMissionStart():
	#setMissionMarker("med_mental3")
	pass

func getObjectives() -> Array:
	var result:Array = []
	
	result.append("You were talking with Ferri when Avy approached you, saying that Kait is missing.")
	result.append("Find Kait, she must be somewhere in the medical wing.")
	if(getFlag("t", false)):
		result.append("A weird cat has told you that Kait could be somewhere in the mental ward.")
#	if(getFlag("s2", false)):
#		result.append("The storage room is locked! You need to find a working badge somewhere near the showers of the medical wing!")
#	if(getFlag("s3", false)):
#		result.append("You have a badge, go back to the storage room!")
	
	return result

func getStartSceneButtonsLoc(_loc:String) -> Array:
	#if(!getFlag("s2", false) && _loc == "cellblock_red_nearcell"): # Check flags
	#	return [startSceneButton("DomM2s2", [], "Mission", "Meet your team here and look for Ferri!")]
	
	return []

func onSceneStart(_sceneID:String, _args:Array):
	if(_sceneID == "DomM4s3Tavi"):
		setFlag("t", true)
		setMissionMarker("med_mental3")
		GM.main.IS.removePawnsWithType(CharacterType.Nurse)
		GM.main.IS.spawnPawnWithTypeAt(CharacterType.Nurse, "med_corridor17")
		GM.main.IS.spawnPawnWithTypeAt(CharacterType.Nurse, "med_corridor15")
		GM.main.IS.spawnPawnWithTypeAt(CharacterType.Nurse, "med_near_storage")
		GM.main.IS.spawnPawnWithTypeAt(CharacterType.Nurse, "medical_firstcorridorcross")
		GM.main.IS.spawnPawnWithTypeAt(CharacterType.Nurse, "med_mental5")
#	if(_sceneID == "DomM3s3StorageLocked"):
#		setFlag("s2", true)
#		setMissionMarker("med_nearshower")
#		GM.main.IS.spawnPawnWithTypeAt(CharacterType.Nurse, "med_corridor4")
#	if(_sceneID == "DomM3s4Shower"):
#		setFlag("s3", true)
#		setMissionMarker("med_near_storage")
#		GM.main.IS.spawnPawnWithTypeAt(CharacterType.Nurse, "med_corridor4")
#		GM.main.IS.spawnPawnWithTypeAt(CharacterType.Nurse, "med_corridor6")
	if(_sceneID == "DomM4s3SaveKait"):
		clearMissionMarkers()
	pass

func onSimpleScene(_eventID:String, _args:Array, _scene):
	if(_eventID == "roomleaveleft"):
		GM.pc.setLocation("med_nearlab")
	if(_eventID == "roomleaveright"):
		GM.pc.setLocation("medical_nearconfessionary")
	pass

func getEventSceneLoc(_loc:String) -> Array:
	if(_loc == "med_staffonly_door1"):
		return ["MissionSimpleScene", ["You won't be able to enter this area again if you leave. So you don't.", "roomleaveleft", []]]
	if(_loc == "med_staffonly_door2"):
		return ["MissionSimpleScene", ["You won't be able to enter this area again if you leave. So you don't.", "roomleaveright", []]]
	
	if(!getFlag("t", false)):
		if(_loc == "med_corridor16" || _loc == "med_near_wards"):
			return ["DomM4s3Tavi", []]
	if(_loc == "med_mental3"):
		return ["DomM4s3SaveKait", []]

	return [] # [sceneid, args]
