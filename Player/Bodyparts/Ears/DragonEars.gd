extends BodypartEars

func _init():
	visibleName = "dragon ears"
	id = "dragonears"
	dollType = "Dragon"

func getCompatibleSpecies():
	return [Species.Dragon]
