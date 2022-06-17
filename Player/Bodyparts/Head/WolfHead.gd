extends BodypartHead

func _init():
	visibleName = "wolf head"
	id = "wolfhead"

func getCompatibleSpecies():
	return [Species.Canine, Species.Wolf]

func getDoll3DScene():
	return "res://Player/Player3D/Parts/Head/WolfHead/WolfHead.tscn"
