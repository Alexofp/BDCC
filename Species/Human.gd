extends Species

func _init():
	id = Species.Human
	
func getVisibleName():
	return "Human"

func getDefaultLegs():
	return "humanleg"

func getDefaultBreasts():
	return "humanbreasts"
