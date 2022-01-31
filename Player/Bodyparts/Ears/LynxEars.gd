extends BodypartEars

func _init():
	name = "lynx ears"
	id = "lynxears"
	dollType = "Lynx"

func getCompatibleSpecies():
	return [Species.Feline]
