extends BodypartArms

func _init():
	visibleName = "anthro arms"
	id = "anthroarms"

func getCompatibleSpecies():
	return [Species.Any]

func getDoll3DScene():
	return "res://Player/Player3D/Parts/Arms/HumanArms/HumanArms.tscn"
