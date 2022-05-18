extends Character

func _init():
	id = "alexrynard"
	
func _getName():
	return "Alex Rynard"

func getGender():
	return Gender.Male
	
func getSmallDescription() -> String:
	return "Male fox with a cold stare. Wears an engineer uniform"

func getSpecies():
	return ["canine"]

func getChatColor():
	return '#FFF60C'
