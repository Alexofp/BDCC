extends BodypartTail

func _init():
	visibleName = "husky tail"
	id = "huskytail"

func getCompatibleSpecies():
	return [Species.Canine]

func getLewdSizeAdjective():
	return RNG.pick(["curled-up"])

func getLewdAdjective():
	return RNG.pick(["fluffy", "husky"])

func getDoll3DScene():
	return "res://Player/Player3D/Parts/Tail/HuskyTail/HuskyTail.tscn"

func getTraits():
	# Can huskies unroll their tail? dunno
	return {
		#PartTrait.TailFlexible: true,
	}
