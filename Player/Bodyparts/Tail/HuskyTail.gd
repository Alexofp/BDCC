extends BodypartTail

func _init():
	name = "husky tail"
	id = "huskytail"
	dollType = "Husky"

func getCompatibleSpecies():
	return [Species.Canine, Species.Wolf]

func getLewdSizeAdjective():
	return RNG.pick(["curled-up"])

func getLewdAdjective():
	return RNG.pick(["fluffy", "husky"])
