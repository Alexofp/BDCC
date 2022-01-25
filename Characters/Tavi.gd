extends Character

func _init():
	id = "tavi"
	
func _getName():
	return "Tavi"

func getGender():
	return Character.Gender.Female
	
func getSmallDescription() -> String:
	return "Red block inmate. A tall feline with a fancy purple and green fur pattern and red/green eyes"

func getSpecies():
	return ["feline"]

