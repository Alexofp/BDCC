extends BodypartTail

func _init():
	name = "husky tail"
	id = "huskytail"
	dollType = "Husky"

func getCompatibleSpecies():
	return [Species.Canine, Species.Wolf]
