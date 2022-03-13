extends BodypartArms

func _init():
	visibleName = "dragon arms"
	id = "dragonarms"
	dollType = "Human"

func getCompatibleSpecies():
	return [Species.Dragon]
