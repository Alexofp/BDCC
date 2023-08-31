extends BodypartHead

func _init():
	visibleName = "fox head"
	id = "foxhead"

func getCompatibleSpecies():
	return [Species.Canine]

func getDoll3DScene():
	return "res://Player/Player3D/Parts/Head/FoxHead/FoxHead.tscn"

func getHeadLength():
	return 0.5
