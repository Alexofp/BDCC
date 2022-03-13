extends BodypartHead

func _init():
	visibleName = "human head"
	id = "humanhead"
	dollType = "Human"

func getCompatibleSpecies():
	return [Species.Human]
