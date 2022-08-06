extends BodypartHead

func _init():
	visibleName = "big horse head"
	id = "horseheadbig"

func getCompatibleSpecies():
	return [Species.Equine]

func getDoll3DScene():
	return "res://Player/Player3D/Parts/Head/HorseHead/HorseHead.tscn"
