extends Bodypart
class_name BodypartHorns

func _init():
	limbSlot = LimbTypes.Horns
	pickedRColor = Color.white
	pickedRColor = Color.lightgray
	pickedRColor = Color.darkgray

func getSlot():
	return BodypartSlot.Horns

func getCompatibleSpecies():
	return [Species.Any]
	
func getTraits():
	return {
		PartTrait.HornsGraspable: true,
	}

func hasCustomSkinPattern():
	return true

func generateRandomColors(_dynamicCharacter):
	var theHue = RNG.randf_range(0.0, 0.1)
	if(_dynamicCharacter != null):
		theHue = _dynamicCharacter.pickedSkinRColor.h
	
	pickedRColor = Color.from_hsv(theHue, RNG.randf_rangeX2(0.0, 0.3), RNG.randf_rangeX2(0.0, 0.5))
	pickedGColor = pickedRColor
	pickedGColor.v += RNG.randf_range(0.1, 0.2)
	if(_dynamicCharacter != null && (Species.Demon in _dynamicCharacter.getSpecies())):
		pickedBColor = ColorUtils.generateRandomVibrantColor()
	else:
		pickedBColor = pickedGColor
		pickedBColor.v += RNG.randf_range(-0.1, 0.2)
		pickedBColor.s += RNG.randf_range(-0.2, 0.2)
	
