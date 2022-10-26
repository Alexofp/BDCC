extends BodypartHorns

func _init():
	visibleName = "demon horns 3"
	id = "demonhorns3"

func getCompatibleSpecies():
	return [Species.Dragon, Species.Demon]

func getDoll3DScene():
	return "res://Player/Player3D/Parts/Horns/DemonHorns3/DemonHorns3.tscn"
