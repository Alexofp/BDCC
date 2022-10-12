extends BodypartHorns

func _init():
	visibleName = "demon horns"
	id = "demonhorns"

func getCompatibleSpecies():
	return [Species.Dragon, Species.Demon]

func getDoll3DScene():
	return "res://Player/Player3D/Parts/Horns/DemonHorns/DemonHorns.tscn"
