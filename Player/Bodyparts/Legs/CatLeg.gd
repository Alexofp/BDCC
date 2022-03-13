extends BodypartLeg

func _init():
	visibleName = "feline legs"
	id = "felineleg"
	dollType = "Digi"

func getCompatibleSpecies():
	return [Species.Feline]
