extends BodypartHead

func _init():
	name = "dragon head"
	id = "dragonhead"
	dollType = "Cat"

func getCompatibleSpecies():
	return [Species.Dragon]
