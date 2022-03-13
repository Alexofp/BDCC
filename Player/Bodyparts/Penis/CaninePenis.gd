extends BodypartPenis

func _init():
	visibleName = "knotted penis"
	id = "caninepenis"
	dollType = "Canine"

func getCompatibleSpecies():
	return [Species.Any]

func getLewdAdjective():
	return RNG.pick(["knotted", "canine-shaped", "canine"])
