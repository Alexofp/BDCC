extends BodypartArms

func _init():
	name = "human arms"
	id = "humanarms"
	dollType = "Human"

func getCompatibleSpecies():
	return [Species.Human]
