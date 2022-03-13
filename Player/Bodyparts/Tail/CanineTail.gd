extends BodypartTail

func _init():
	visibleName = "canine tail"
	id = "caninetail"
	dollType = "Canine"

func getCompatibleSpecies():
	return [Species.Canine, Species.Wolf]
