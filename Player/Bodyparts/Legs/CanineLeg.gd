extends BodypartLeg

func _init():
	visibleName = "canine legs"
	id = "canineleg"
	dollType = "Digi"

func getCompatibleSpecies():
	return [Species.Canine, Species.Wolf]
