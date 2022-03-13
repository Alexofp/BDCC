extends BodypartHead

func _init():
	visibleName = "wolf head"
	id = "wolfhead"
	dollType = "Wolf"

func getCompatibleSpecies():
	return [Species.Canine, Species.Wolf]
