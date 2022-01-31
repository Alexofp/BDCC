extends BodypartTail

func _init():
	name = "canine tail"
	id = "caninetail"
	dollType = "Canine"

func getCompatibleSpecies():
	return [Species.Canine, Species.Wolf]
