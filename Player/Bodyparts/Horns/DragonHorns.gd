extends BodypartHorns

func _init():
	visibleName = "dragon horns"
	id = "dragonhorns"
	dollType = "Dragon"

func getCompatibleSpecies():
	return [Species.Dragon]
