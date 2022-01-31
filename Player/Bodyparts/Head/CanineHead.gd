extends BodypartHead

func _init():
	name = "canine head"
	id = "caninehead"
	dollType = "Canine"

func getCompatibleSpecies():
	return [Species.Canine, Species.Wolf]
