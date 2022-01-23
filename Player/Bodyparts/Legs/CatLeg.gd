extends BodypartLeg

func _init():
	name = "feline legs"
	id = "felineleg"
	dollType = "Digi"

func getCompatibleSpecies():
	return [Species.Feline]
