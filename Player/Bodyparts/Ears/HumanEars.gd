extends BodypartEars

func _init():
	visibleName = "human ears"
	id = "humanears"
	dollType = "Human"

func getCompatibleSpecies():
	return [Species.Human]

func getHybridPriority():
	return -1
