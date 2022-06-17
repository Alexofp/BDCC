extends BodypartEars

func _init():
	visibleName = "lynx ears 2"
	id = "lynxears2"

func getCompatibleSpecies():
	return [Species.Feline]

func getDoll3DScene():
	return "res://Player/Player3D/Parts/Ears/LynxEars2/LynxEars2.tscn"
