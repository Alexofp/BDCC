extends BodypartArms

func _init():
	visibleName = "human arms"
	id = "humanarms"

func getCompatibleSpecies():
	return [Species.Human]

func getDoll3DScene():
	return "res://Player/Player3D/Parts/Arms/HumanArms/HumanArms.tscn"
