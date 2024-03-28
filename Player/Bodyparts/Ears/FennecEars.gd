extends BodypartEars

func _init():
	visibleName = "fennec ears"
	id = "fennecears"

func getCompatibleSpecies():
	return [Species.Canine]

func getDoll3DScene():
	return "res://Player/Player3D/Parts/Ears/FennecEars/FennecEars.tscn"
