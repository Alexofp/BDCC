extends BodypartLeg

func _init():
	name = "dragon legs"
	id = "dragonleg"
	dollType = "Digi"

func getCompatibleSpecies():
	return [Species.Dragon]
