extends Character

func _init():
	id = "cp_guard"
	
func _getName():
	return "Checkpoint guard"

func getGender():
	return Character.Gender.Male
	
func getSmallDescription() -> String:
	return "A male canine wearing a guard uniform and a light armor"

func getSpecies():
	return ["canine"]

