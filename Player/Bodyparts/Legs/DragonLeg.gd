extends BodypartLeg

func _init():
	visibleName = "dragon legs"
	id = "dragonleg"

func getCompatibleSpecies():
	return [Species.Dragon]

func getDoll3DScene():
	return "res://Player/Player3D/Parts/Legs/DigiLegs/DigiLegs.tscn"
