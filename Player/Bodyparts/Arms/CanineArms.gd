extends BodypartArms

func _init():
	visibleName = "canine arms"
	id = "caninearms"
	dollType = "Human"

func getCompatibleSpecies():
	return [Species.Canine, Species.Wolf]

func getDoll3DScene():
	return "res://Player/Player3D/Parts/Arms/HumanArms/HumanArms.tscn"
