extends BodypartEars

func _init():
	visibleName = "canine ears 3"
	id = "canineears3"

func getCompatibleSpecies():
	return [Species.Canine]

func getDoll3DScene():
	return "res://Player/Player3D/Parts/Ears/CanineEars3/CanineEars3.tscn"
