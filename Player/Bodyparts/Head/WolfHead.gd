extends BodypartHead

func _init():
	name = "wolf head"
	id = "wolfhead"
	dollType = "Wolf"

func getCompatibleSpecies():
	return [Species.Canine, Species.Wolf]
