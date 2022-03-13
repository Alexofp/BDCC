extends BodypartLeg

func _init():
	visibleName = "human legs"
	id = "humanleg"
	dollType = "Human"

func getCompatibleSpecies():
	return [Species.Human]
