extends MissionBase

func _init():
	id = "TestMission"
	name = "Test mission"
	desc = "This is a test mission.\nMeow meow."
	
	startScene = "DomM1s1Intro"
	
	flags = {
		"TestFlag": flag(FlagType.Bool),
	}

func getObjectives() -> Array:
	var result:Array = []
	
	result.append("Do a hecking meow.")
	
	return result

func getStartSceneButtonsLoc(_loc:String) -> Array:
	if(_loc == "hall_mainentrance"): # Check flags
		return [startSceneButton("DomM1s2Checkpoint")]
	return []

func getStartSceneButtonsCharacter(_char:String) -> Array:
	return [
		#startSceneButton("DomM1s2Checkpoint"),
	]
