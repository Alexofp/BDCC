extends BodypartHead

func _init():
	visibleName = "horse head"
	id = "horsehead"

func getCompatibleSpecies():
	return [Species.Equine]

func getDoll3DScene():
	return "res://Player/Player3D/Parts/Head/HorseHead2/HorseHead2.tscn"

func getHeadLength():
	return 0.55
