extends MissionBase

func _init():
	id = "Mission2"
	name = "Ferocious"
	desc = "You got the papers with all the names. Time to figure out who you're gonna recruit next!"
	
	startScene = "DomM2s1Intro"
	requiredMissions = ["Mission1"]
	
	flags = {
		"s2": flag(FlagType.Bool), # Did we catch Ferri
		"fight": flag(FlagType.Text), # "let", "stop"
	}
	
	decisions = {
		"fight": {
			name = "Allowed fight",
			outcomes = {
				"let": {
					text = "Yes",
					effects = [
						DECISION_EFFECT_KAIT_OBEDIENCE,
					],
				},
				"stop": {
					text = "No",
					effects = [
						DECISION_EFFECT_AVY_OBEDIENCE,
					],
				},
			},
		}
	}
	
	rewardExp = 50
	rewardCredits = 5

func getObjectives() -> Array:
	var result:Array = []
	
	result.append("Meet your team in the high-sec cellblock in order to find Ferri!")
	if(getFlag("s2", false)):
		result.append("You got Ferri! Now you have to break her.")
	
	return result

func getStartSceneButtonsLoc(_loc:String) -> Array:
	if(!getFlag("s2", false) && _loc == "cellblock_red_nearcell"): # Check flags
		return [startSceneButton("DomM2s2", [], "Mission", "Meet your team here and look for Ferri!")]
	
	return []

func onSceneStart(_sceneID:String, _args:Array):
	if(_sceneID == "DomM2s2"):
		setFlag("s2", true)
