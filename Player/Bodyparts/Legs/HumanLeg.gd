extends BodypartLeg

func _init():
	name = "human legs"
	id = "humanleg"
	dollType = "Human"

func getCompatibleSpecies():
	return [Species.Human]
