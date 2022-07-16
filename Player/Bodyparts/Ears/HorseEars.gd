extends BodypartEars

func _init():
	visibleName = "horse ears"
	id = "horseears"

func getCompatibleSpecies():
	return [Species.Equine]

func getDoll3DScene():
	return "res://Player/Player3D/Parts/Ears/HorseEars/HorseEars.tscn"
