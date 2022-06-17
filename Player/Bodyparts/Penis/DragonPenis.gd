extends BodypartPenis

func _init():
	visibleName = "dragon penis"
	id = "dragonpenis"

func getCompatibleSpecies():
	return [Species.Any]

func getLewdAdjective():
	return RNG.pick(["knotted", "ribbed", "dragon"])

func getDoll3DScene():
	return "res://Player/Player3D/Parts/Penis/DragonPenis/DragonPenis.tscn"
