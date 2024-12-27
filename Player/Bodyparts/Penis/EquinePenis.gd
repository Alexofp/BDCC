extends BodypartPenis

func _init():
	visibleName = "flared penis"
	id = "equinepenis"
	lengthCM = 22
	pickedGColor = Color.red
	pickedBColor = Color.darkred

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
	generateRandomColors(_dynamicCharacter)
	
func generateRandomColors(_dynamicCharacter):
	var theHue = RNG.randf_range(0.0, 0.1)
	if(_dynamicCharacter != null):
		theHue = _dynamicCharacter.pickedSkinRColor.h
	if(RNG.chance(30)):
		pickedGColor = Color.from_hsv(RNG.randf_rangeX2(-0.1, 0.1), RNG.randf_range(0.7, 0.9), RNG.randf_range(0.5, 0.9))
		pickedBColor = pickedGColor
		pickedBColor.v = RNG.randf_rangeX2(0.3, 0.6)
	elif(RNG.chance(30) && _dynamicCharacter!=null):
		pickedGColor = RNG.pick([_dynamicCharacter.pickedSkinRColor, _dynamicCharacter.pickedSkinGColor, _dynamicCharacter.pickedSkinBColor])
		pickedGColor.h += RNG.randf_rangeX2(-0.1, 0.1)
		pickedGColor.s = RNG.randf_range(0.7, 0.9)
		pickedGColor.v = RNG.randf_range(0.7, 0.9)
		pickedBColor = pickedGColor
		pickedBColor.v = RNG.randf_rangeX2(0.3, 0.6)
	else:
		pickedGColor = ColorUtils.generateRandomVibrantColor()
		pickedBColor = pickedGColor
		pickedBColor.v = RNG.randf_rangeX2(0.3, 0.6)
	
	if(RNG.chance(30)):
		pickedGColor = Color.from_hsv(theHue, RNG.randf_range(0.3, 0.6), RNG.randf_rangeX2(0.1, 0.3))
		pickedBColor.v = RNG.randf_rangeX2(0.7, 0.95)
		pickedBColor.s = RNG.randf_rangeX2(0.7, 0.95)

func shouldUseBigPump():
	return true

func getVulgarName() -> String:
	return "horsecock"
