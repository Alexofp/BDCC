extends BodypartHorns

func _init():
	name = "dragon horns"
	id = "dragonhorns"
	dollType = "Dragon"

func getCompatibleSpecies():
	return [Species.Dragon]
