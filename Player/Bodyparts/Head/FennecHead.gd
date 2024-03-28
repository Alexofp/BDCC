extends BodypartHead

func _init():
	visibleName = "fennec head"
	id = "fennechead"

func getCompatibleSpecies():
	return [Species.Canine]

func getDoll3DScene():
	return "res://Player/Player3D/Parts/Head/FennecHead/FennecHead.tscn"

func getHeadLength():
	return 0.25
