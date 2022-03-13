extends BodypartEars

func _init():
	visibleName = "feline ears"
	id = "felineears"
	dollType = "Cat"

func getCompatibleSpecies():
	return [Species.Feline]
