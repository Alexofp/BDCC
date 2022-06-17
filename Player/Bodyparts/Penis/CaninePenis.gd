extends BodypartPenis

func _init():
	visibleName = "knotted penis"
	id = "caninepenis"

func getCompatibleSpecies():
	return [Species.Any]

func getLewdAdjective():
	return RNG.pick(["knotted", "canine-shaped", "canine"])

func getDoll3DScene():
	return "res://Player/Player3D/Parts/Penis/CaninePenis/CaninePenis.tscn"
