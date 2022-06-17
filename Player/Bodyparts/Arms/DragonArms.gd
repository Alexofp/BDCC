extends BodypartArms

func _init():
	visibleName = "dragon arms"
	id = "dragonarms"

func getCompatibleSpecies():
	return [Species.Dragon]

func getDoll3DScene():
	return "res://Player/Player3D/Parts/Arms/HumanArms/HumanArms.tscn"
