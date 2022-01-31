extends BodypartHead

func _init():
	name = "fox head"
	id = "foxhead"
	dollType = "Fox"

func getCompatibleSpecies():
	return [Species.Canine, Species.Wolf]
