extends MissionBase

func _init():
	id = "Mission1"
	name = "Paper Trail"
	desc = "You need to get prison's staff/inmate records to figure out the best potential recruiting targets."
	
	startScene = "DomM1s1Intro"
	
	flags = {
		"check": flag(FlagType.Bool), # Arrived to the checkpoint
		"c1": flag(FlagType.Bool), # Checked cd_office1
		"c2": flag(FlagType.Bool), # Checked cd_office2
		"c3": flag(FlagType.Bool), # Checked cd_office3
		"c4": flag(FlagType.Bool), # Checked cd_office4
		"skar": flag(FlagType.Bool), # Went into cd_near_captain_office
		"skarOutcome": flag(FlagType.Text), # "", "lost", "won", "ridevag", "rideanal", "fuckhim", "ridevagout", "rideanalout"
		"risha": flag(FlagType.Text), # "no", "kiss", "bite", "pp", "vag". How did player punish Risha
		"helped": flag(FlagType.Text), # "avy", "kait"
	}
	
	decisions = {
		"helped": {
			name = "Helped Kait",
			outcomes = {
				"avy": {
					text = "No",
					effects = [
						DECISION_EFFECT_AVY_LOVE,
					],
					kaitLine = "I asked Avy not to help me.. but she still could have done something!",
					avyLine = "It was pretty fun to see that softie get wrecked.",
				},
				"kait": {
					text = "Yes",
					effects = [
						DECISION_EFFECT_KAIT_LOVE,
					],
					kaitLine = "You saved me back there. Thanks.",
					avyLine = "It would have been much more fun to see that slut getting wrecked. Whatever.",
				},
			},
		}
	}
	
	rewardExp = 50
	rewardCredits = 3

func onMissionStart():
	setMissionMarker("hall_mainentrance")

func getObjectives() -> Array:
	var result:Array = []
	
	result.append("Meet your team in front of the checkpoint that's near the elevator.")
	if(getFlag("check", false)):
		result.append("Search the offices until you find the right one!")
	
	return result

func getStartSceneButtonsLoc(_loc:String) -> Array:
	if(!getFlag("check", false) && _loc == "hall_mainentrance"): # Check flags
		return [startSceneButton("DomM1s2Checkpoint", [], "Mission", "Meet your team here and begin the heist!")]
	
	if(getFlag("check", false)):
		for _i in 4:
			var _indx:int = _i + 1 # [1, 2, 3, 4]
			var theStuff:Array = checkOfficeStuff("c"+str(_indx), _loc, "cd_office"+str(_indx))
			if(theStuff):
				return theStuff
		
	return []

func checkOfficeStuff(_flagID:String, _loc:String, _officeLoc:String) -> Array:
	if(_loc != _officeLoc || getFlag(_flagID, false)):
		return []
	if(getAmountOfOfficesChecked() >= 3):
		return [startSceneButton("DomM1s3Office", [], "Office", "Check this office!")]
	
	return [startSimpleSceneButton(getCheckOfficeText(), "check", [_flagID], "Office", "Check this office!")]

func onSceneStart(_sceneID:String, _args:Array):
	if(_sceneID == "DomM1s2Checkpoint"):
		setFlag("check", true)
		updateOfficeMarkers()
	if(_sceneID == "DomM1OptionalSkar"):
		setFlag("skar", true)

func updateOfficeMarkers():
	var theMarkers:Array = []
	for _i in 4:
		var _index:int = _i + 1
		if(!getFlag("c"+str(_index), false)):
			theMarkers.append("cd_office"+str(_index))
	setMissionMarkers(theMarkers)

func onSimpleScene(_eventID:String, _args:Array, _scene):
	if(_eventID == "check"):
		setFlag(_args[0], true)
		updateOfficeMarkers()
	if(_eventID == "skarNope"):
		GM.pc.setLocation("cd_last_intersection")

func getEventSceneLoc(_loc:String) -> Array:
	if(_loc == "cd_near_captain_office" && !getFlag("skar", false)):
		return ["DomM1OptionalSkar", []]
	if(_loc == "cd_near_captain_office" && getFlag("skar", false) && getFlag("skarOutcome", "") == ""):
		return ["DomM1OptionalSkarFight", []]
	if(_loc == "cd_near_captain_office" && getFlag("skarOutcome", "") != ""):
		return ["MissionSimpleScene", ["It's best not to go here anymore.. so you turn back.", "skarNope", []]]
	return [] # [sceneid, args]

func getStartSceneButtonsCharacter(_char:String) -> Array:
	return [
		#startSceneButton("DomM1s2Checkpoint"),
	]

func getAmountOfOfficesChecked() -> int:
	var result:int = 0
	if(getFlag("c1", false)):
		result += 1
	if(getFlag("c2", false)):
		result += 1
	if(getFlag("c3", false)):
		result += 1
	if(getFlag("c4", false)):
		result += 1
	return result

func getCheckOfficeText() -> String:
	var theAm:int = getAmountOfOfficesChecked()
	
	if(theAm == 0):
		return "You check the first office. There is a console you can use but there is no printer!\n\nYou will have to check the other offices."
	if(theAm == 1):
		return "You check the second office. There are no consoles here sadly.\n\nYou will have to look for another one."
	if(theAm == 2):
		return "You check the third office. It has a console and a printer! Sadly, the console requires a password.\n\nYou will have to look for another one."
	return "You check another office. It has a console and a printer! Sadly, the console requires a password.\n\nYou will have to look for another one."
