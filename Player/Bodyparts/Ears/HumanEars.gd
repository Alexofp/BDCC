extends BodypartEars

func _init():
	visibleName = "human ears"
	id = "humanears"
	dollType = "Human"

func getCompatibleSpecies():
	return [Species.Human]

func getHybridPriority():
	return -1

func getDoll3DScene():
	return "res://Player/Player3D/Parts/Ears/HumanEars/HumanEars.tscn"
