extends BodypartEars

func _init():
	name = "human ears"
	id = "humanears"
	dollType = "Human"

func getCompatibleSpecies():
	return [Species.Human]

func getHybridPriority():
	return -1
