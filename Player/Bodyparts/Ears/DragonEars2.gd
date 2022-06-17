extends BodypartEars

func _init():
	visibleName = "dragon ears 2"
	id = "dragonears2"

func getCompatibleSpecies():
	return [Species.Dragon]

func getDoll3DScene():
	return "res://Player/Player3D/Parts/Ears/DragonEars2/DragonEars2.tscn"
