extends Species

func _init():
	id = Species.Canine
	
func getVisibleName():
	return "Canine"

func getDefaultLegs():
	return "felineleg"

func getDefaultBreasts():
	return "humanbreasts"

func getDefaultTail():
	return "caninetail"

func isPlayable():
	return true

func getVisibleDescription():
	return "The good boys and girls"

func getDefaultHead():
	return "caninehead"

func getDefaultArms():
	return "felinearms"

func getDefaultEars():
	return "canineears"
