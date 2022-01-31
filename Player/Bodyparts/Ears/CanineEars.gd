extends BodypartEars

func _init():
	name = "canine ears"
	id = "canineears"
	dollType = "Canine"

func getCompatibleSpecies():
	return [Species.Canine, Species.Wolf]
