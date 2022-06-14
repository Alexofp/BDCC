extends BodypartLeg

func _init():
	visibleName = "dragon legs"
	id = "dragonleg"
	dollType = "Digi"

func getCompatibleSpecies():
	return [Species.Dragon]

func getDoll3DScene():
	return "res://Player/Player3D/Parts/Legs/DigiLegs/DigiLegs.tscn"
