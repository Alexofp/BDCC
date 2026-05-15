extends MissionBase

func _init():
	id = "TestMission"
	name = "Test mission"
	desc = "This is a test mission.\n\nMeow meow."
	
	startScene = "MeScene"
	
	flags = {
		"TestFlag": flag(FlagType.Bool),
	}

func getObjectives() -> Array:
	var result:Array = []
	
	result.append("Do a hecking meow.")
	
	return result
