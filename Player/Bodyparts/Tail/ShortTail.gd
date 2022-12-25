extends BodypartTail

func _init():
	visibleName = "short tail"
	id = "shorttail"

func getCompatibleSpecies():
	return [Species.Canine, Species.Feline, Species.Equine]

func getLewdSizeAdjective():
	return RNG.pick(["short"])

func getLewdAdjective():
	return RNG.pick(["fluffy"])

func getDoll3DScene():
	return "res://Player/Player3D/Parts/Tail/ShortTail/ShortTail.tscn"
