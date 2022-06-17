extends BodypartEars

func _init():
	visibleName = "feline ears"
	id = "felineears"

func getCompatibleSpecies():
	return [Species.Feline]

func getDoll3DScene():
	return "res://Player/Player3D/Parts/Ears/CatEars/CatEars.tscn"
