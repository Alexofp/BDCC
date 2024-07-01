extends BodypartEars

func _init():
	visibleName = "canine ears 2"
	id = "canineears2"

func getCompatibleSpecies():
	return [Species.Canine]

func getDoll3DScene():
	return "res://Player/Player3D/Parts/Ears/CanineEars2/CanineEars2.tscn"
