extends BodypartLeg

func _init():
	visibleName = "dragon legs"
	id = "dragonleg"
	dollType = "Digi"

func getCompatibleSpecies():
	return [Species.Dragon]
