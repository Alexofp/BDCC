extends BodypartHead

func _init():
	name = "feline head"
	id = "felinehead"
	dollType = "Cat"

func getCompatibleSpecies():
	return [Species.Feline]
