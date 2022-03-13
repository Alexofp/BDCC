extends BodypartArms

func _init():
	visibleName = "feline arms"
	id = "felinearms"
	dollType = "Human"

func getCompatibleSpecies():
	return [Species.Feline]
