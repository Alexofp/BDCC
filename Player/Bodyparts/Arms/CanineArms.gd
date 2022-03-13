extends BodypartArms

func _init():
	visibleName = "canine arms"
	id = "caninearms"
	dollType = "Human"

func getCompatibleSpecies():
	return [Species.Canine, Species.Wolf]
