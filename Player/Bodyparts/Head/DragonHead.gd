extends BodypartHead

func _init():
	visibleName = "dragon head"
	id = "dragonhead"
	dollType = "Cat"

func getCompatibleSpecies():
	return [Species.Dragon]
