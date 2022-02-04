extends BodypartArms

func _init():
	name = "canine arms"
	id = "caninearms"
	dollType = "Human"

func getCompatibleSpecies():
	return [Species.Canine, Species.Wolf]
