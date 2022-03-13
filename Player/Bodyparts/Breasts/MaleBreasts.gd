extends "res://Player/Bodyparts/Breasts/HumanBreasts.gd"

func _init():
	visibleName = "male breasts"
	id = "malebreasts"
	size = BreastsSize.FOREVER_FLAT

func getLewdAdjective():
	return RNG.pick(["firm", "strong"])

func getLewdName():
	if(size <= BreastsSize.A):
		return "pecs"

	return RNG.pick(["manbreasts", "manboobs", "mantits", "jugs", "orbs"])
