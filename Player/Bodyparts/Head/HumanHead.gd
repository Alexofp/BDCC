extends BodypartHead

func _init():
	visibleName = "human head"
	id = "humanhead"

func getCompatibleSpecies():
	return [Species.Human]

func getDoll3DScene():
	return "res://Player/Player3D/Parts/Head/HumanHead/HumanHead.tscn"
