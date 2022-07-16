extends BodypartHead

func _init():
	visibleName = "horse head"
	id = "horsehead"

func getCompatibleSpecies():
	return [Species.Equine]

func getDoll3DScene():
	return "res://Player/Player3D/Parts/Head/HorseHead/HorseHead.tscn"
