extends Character

func _init():
	id = "intro_detective"
	
func _getName():
	return "Jake"

func getGender():
	return Character.Gender.Male
	
func getSmallDescription() -> String:
	return "Elegant-looking canine with grey fur. Black pants, white shirt and old-school reading glasses"
