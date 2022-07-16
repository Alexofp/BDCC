extends BodypartHead

func _init():
	visibleName = "small horse head"
	id = "horsehead2"

func getCompatibleSpecies():
	return [Species.Equine]

func getDoll3DScene():
	return "res://Player/Player3D/Parts/Head/HorseHead2/HorseHead2.tscn"
