extends BodypartPenis

func _init():
	visibleName = "flared penis"
	id = "equinepenis"
	lengthCM = 22

func getCompatibleSpecies():
	return [Species.Any]

func getLewdAdjective():
	return RNG.pick(["flared", "horse-shaped", "horse"])

func getDoll3DScene():
	return "res://Player/Player3D/Parts/Penis/EquinePenis/EquinePenis.tscn"

func getPenisScale():
	return max(0.1 + (lengthCM - 5.0) / 21.0, 0.3)

func getTraits():
	return {
		PartTrait.PenisFlare: true,
	}

func generateDataFor(_dynamicCharacter):
	lengthCM = RNG.randf_range(20.0, 30.0)
	if(RNG.chance(5)):
		lengthCM = RNG.randf_range(10.0, 20.0)
	if(RNG.chance(5)):
		lengthCM = RNG.randf_range(30.0, 40.0)
	lengthCM = Util.roundF(lengthCM, 1)

	if(fluidProduction != null):
		fluidProduction.fillPercent(min(1.0, RNG.randf_range(0.8, 1.2)))
