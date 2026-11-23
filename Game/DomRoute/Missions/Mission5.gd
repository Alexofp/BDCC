extends MissionBase

func _init():
	id = "Mission5"
	name = "Small talk"
	desc = "You need to figure out how you can get rid of the shock collars."
	
	startScene = "DomM5s1Intro"
	requiredMissions = ["Mission4"]
	
	flags = {
		"t": flag(FlagType.Bool), # Did the meet scene happen
		"agreeKait": flag(FlagType.Text), # "yes", "no"
		"rishaAns": flag(FlagType.Text), # "lost", "wayout", "risha"
		"rishaOut": flag(FlagType.Text), # "lost", "leave", "degrade", "bj", "lick"
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
	
	rewardExp = 100
	rewardCredits = 0

func onMissionStart():
	setMissionMarker("main_yard_connector")
	pass

func getObjectives() -> Array:
	var result:Array = []
	
	result.append("Head towards the elevator so you can get down to the mining floor that has the workshop.")
	if(getFlag("t", false)):
		result.append("You found Alex Rynard. Ans had a talk with him!")
	
	return result

func getStartSceneButtonsLoc(_loc:String) -> Array:
	#if(!getFlag("s2", false) && _loc == "cellblock_red_nearcell"): # Check flags
	#	return [startSceneButton("DomM2s2", [], "Mission", "Meet your team here and look for Ferri!")]
	
	return []

func onSceneStart(_sceneID:String, _args:Array):
	if(_sceneID == "DomM5s2Meet"):
		clearMissionMarkers()
		setFlag("t", true)
	pass

func onSimpleScene(_eventID:String, _args:Array, _scene):
	pass

func getEventSceneLoc(_loc:String) -> Array:
	if(_loc in ["main_yard_connector", "hall_mainentrance", "mining_nearentrance"]):
		return ["DomM5s2Meet", []]

	return [] # [sceneid, args]
