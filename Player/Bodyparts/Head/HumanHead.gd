extends BodypartHead

func _init():
	name = "human head"
	id = "humanhead"
	dollType = "Human"

func getCompatibleSpecies():
	return [Species.Human]
