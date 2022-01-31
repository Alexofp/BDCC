extends BodypartTail

func _init():
	name = "short tail"
	id = "shorttail"
	dollType = "Short"

func getCompatibleSpecies():
	return [Species.Canine, Species.Wolf, Species.Feline]
