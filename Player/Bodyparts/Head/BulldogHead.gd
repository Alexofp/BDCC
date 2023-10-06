extends BodypartHead

func _init():
	visibleName = "bulldog head"
	id = "bulldoghead"

func getCompatibleSpecies():
	return [Species.Canine]

func getDoll3DScene():
	return "res://Player/Player3D/Parts/Head/BulldogHead/BulldogHead.tscn"

func getHeadLength():
	return 0.2
