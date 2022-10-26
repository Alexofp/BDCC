extends BodypartHorns

func _init():
	visibleName = "unicorn horn"
	id = "unicornhorn"

func getCompatibleSpecies():
	return [Species.Equine]

func getDoll3DScene():
	return "res://Player/Player3D/Parts/Horns/UnicornHorn/UnicornHorn.tscn"
