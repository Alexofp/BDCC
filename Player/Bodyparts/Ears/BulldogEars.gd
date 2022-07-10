extends BodypartEars

func _init():
	visibleName = "bulldog ears"
	id = "bulldogears"

func getCompatibleSpecies():
	return [Species.Canine, Species.Wolf]

func getDoll3DScene():
	return "res://Player/Player3D/Parts/Ears/BulldogEars/BulldogEars.tscn"
