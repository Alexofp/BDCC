extends BodypartHead

func _init():
	visibleName = "fox head"
	id = "foxhead"
	dollType = "Fox"

func getCompatibleSpecies():
	return [Species.Canine, Species.Wolf]
