extends BodypartHead

func _init():
	visibleName = "canine head"
	id = "caninehead"

func getCompatibleSpecies():
	return [Species.Canine]

func getDoll3DScene():
	return "res://Player/Player3D/Parts/Head/CanineHead/CanineHead.tscn"

func getHeadLength():
	return 0.55
