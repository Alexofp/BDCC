extends BodypartTail

func _init():
	name = "feline tail"
	id = "felinetail"
	dollType = "Cat"

func getCompatibleSpecies():
	return [Species.Feline]
