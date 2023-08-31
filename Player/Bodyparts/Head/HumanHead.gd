extends BodypartHead

func _init():
	visibleName = "human head"
	id = "humanhead"

func getCompatibleSpecies():
	return [Species.Human, Species.Demon]

func getDoll3DScene():
	return "res://Player/Player3D/Parts/Head/HumanHead/HumanHead.tscn"

func getHeadLength():
	return 0.0
