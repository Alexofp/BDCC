extends BodypartHead

func _init():
	visibleName = "canine head"
	id = "caninehead"
	dollType = "Canine"

func getCompatibleSpecies():
	return [Species.Canine, Species.Wolf]
