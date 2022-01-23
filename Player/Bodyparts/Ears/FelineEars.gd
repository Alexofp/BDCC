extends BodypartEars

func _init():
	name = "feline ears"
	id = "felineears"
	dollType = "Cat"

func getCompatibleSpecies():
	return [Species.Feline]
