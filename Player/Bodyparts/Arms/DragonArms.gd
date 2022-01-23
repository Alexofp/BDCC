extends BodypartArms

func _init():
	name = "dragon arms"
	id = "dragonarms"
	dollType = "Human"

func getCompatibleSpecies():
	return [Species.Dragon]
