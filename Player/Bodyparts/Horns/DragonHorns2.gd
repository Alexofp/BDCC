extends BodypartHorns

func _init():
	visibleName = "dragon horns 2"
	id = "dragonhorns2"

func getCompatibleSpecies():
	return [Species.Dragon, Species.Demon]

func getDoll3DScene():
	return "res://Player/Player3D/Parts/Horns/DragonHorns2/DragonHorns2.tscn"
