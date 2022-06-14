extends BodypartTail

func _init():
	visibleName = "husky tail"
	id = "huskytail"
	dollType = "Husky"

func getCompatibleSpecies():
	return [Species.Canine, Species.Wolf]

func getLewdSizeAdjective():
	return RNG.pick(["curled-up"])

func getLewdAdjective():
	return RNG.pick(["fluffy", "husky"])

func getDoll3DScene():
	return "res://Player/Player3D/Parts/Tail/HuskyTail/HuskyTail.tscn"
