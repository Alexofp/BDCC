extends BodypartEars

func _init():
	visibleName = "lynx ears"
	id = "lynxears"
	dollType = "Lynx"

func getCompatibleSpecies():
	return [Species.Feline]

func getDoll3DScene():
	return "res://Player/Player3D/Parts/Ears/LynxEars/LynxEars.tscn"
