extends BodypartEars

func _init():
	visibleName = "lynx ears"
	id = "lynxears"
	dollType = "Lynx"

func getCompatibleSpecies():
	return [Species.Feline]
