extends BodypartTail

func _init():
	name = "dragon tail"
	id = "dragontail"
	dollType = "Dragon"

func getCompatibleSpecies():
	return [Species.Dragon]

func getLewdSizeAdjective():
	return RNG.pick(["long"])

func getLewdAdjective():
	return RNG.pick(["scaly", "dragon"])
