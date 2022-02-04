extends BodypartLeg

func _init():
	name = "canine legs"
	id = "canineleg"
	dollType = "Digi"

func getCompatibleSpecies():
	return [Species.Canine, Species.Wolf]
