extends BodypartArms

func _init():
	visibleName = "human arms"
	id = "humanarms"
	dollType = "Human"

func getCompatibleSpecies():
	return [Species.Human]
