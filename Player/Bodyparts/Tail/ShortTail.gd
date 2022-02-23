extends BodypartTail

func _init():
	name = "short tail"
	id = "shorttail"
	dollType = "Short"

func getCompatibleSpecies():
	return [Species.Canine, Species.Wolf, Species.Feline]

func getLewdSizeAdjective():
	return RNG.pick(["short"])

func getLewdAdjective():
	return RNG.pick(["fluffy"])
