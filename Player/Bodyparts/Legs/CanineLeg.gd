extends BodypartLeg

func _init():
	visibleName = "canine legs"
	id = "canineleg"

func getCompatibleSpecies():
	return [Species.Canine, Species.Wolf]

func getDoll3DScene():
	return "res://Player/Player3D/Parts/Legs/DigiLegs/DigiLegs.tscn"
