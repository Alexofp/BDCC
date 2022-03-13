extends BodypartTail

func _init():
	visibleName = "feline tail"
	id = "felinetail"
	dollType = "Cat"

func getCompatibleSpecies():
	return [Species.Feline]

func getLewdSizeAdjective():
	return RNG.pick(["long"])

func getLewdAdjective():
	return RNG.pick(["feline", "fluffy"])
