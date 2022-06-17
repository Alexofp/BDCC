extends BodypartLeg

func _init():
	visibleName = "feline legs"
	id = "felineleg"

func getCompatibleSpecies():
	return [Species.Feline]

func getDoll3DScene():
	return "res://Player/Player3D/Parts/Legs/DigiLegs/DigiLegs.tscn"
