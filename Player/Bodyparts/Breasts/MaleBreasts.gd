extends "res://Player/Bodyparts/Breasts/HumanBreasts.gd"

func _init():
	visibleName = "male breasts"
	id = "malebreasts"
	size = BreastsSize.FLAT

func getTraits():
	return {
		PartTrait.BreastsMale: true,
	}

func getLewdAdjective():
	return RNG.pick(["firm", "strong"])

func getLewdName():
	if(size <= BreastsSize.A):
		return "pecs"

	return RNG.pick(["manbreasts", "manboobs", "mantits", "jugs", "orbs"])

func safeWhenExposed():
	if(size <= BreastsSize.A):
		return true
	
	return false

func generateDataFor(_dynamicCharacter):
	pass

func getVulgarName() -> String:
	return "male pecs"

func getAVulgarName() -> String:
	return getVulgarName()
