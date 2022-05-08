extends BodypartPenis

func _init():
	visibleName = "dragon penis"
	id = "dragonpenis"
	dollType = "Dragon"

func getCompatibleSpecies():
	return [Species.Any]

func getLewdAdjective():
	return RNG.pick(["knotted", "ribbed", "dragon"])
