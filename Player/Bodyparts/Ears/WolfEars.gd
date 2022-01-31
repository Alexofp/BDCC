extends BodypartEars

func _init():
	name = "wolf ears"
	id = "wolfears"
	dollType = "Wolf"

func getCompatibleSpecies():
	return [Species.Canine, Species.Wolf]
