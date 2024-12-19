extends BodypartEars

func _init():
	visibleName = "feline ears 2"
	id = "felineears2"

func getCompatibleSpecies():
	return [Species.Feline]

func getDoll3DScene():
	return "res://Player/Player3D/Parts/Ears/CatEars2/CatEars2.tscn"
