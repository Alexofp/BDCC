extends BodypartHead

func _init():
	visibleName = "feline head"
	id = "felinehead"
	dollType = "Cat"

func getCompatibleSpecies():
	return [Species.Feline]
