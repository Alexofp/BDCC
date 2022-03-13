extends BodypartEars

func _init():
	visibleName = "wolf ears"
	id = "wolfears"
	dollType = "Wolf"

func getCompatibleSpecies():
	return [Species.Canine, Species.Wolf]
