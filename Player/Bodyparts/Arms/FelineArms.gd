extends BodypartArms

func _init():
	name = "feline arms"
	id = "felinearms"
	dollType = "Human"

func getCompatibleSpecies():
	return [Species.Feline]
