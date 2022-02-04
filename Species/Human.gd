extends Species

func _init():
	id = Species.Human
	
func getVisibleName():
	return "Human"

func getDefaultLegs(_gender):
	return "humanleg"

func isPlayable():
	return true

func getVisibleDescription():
	return "Your ordinary human"

func getDefaultEars(_gender):
	return "humanears"
