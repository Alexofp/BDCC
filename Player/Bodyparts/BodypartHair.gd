extends Bodypart
class_name BodypartHair

var maleWeight = 1.0
var femaleWeight = 1.0

func _init():
	limbSlot = LimbTypes.Hair
	pickedRColor = Color.white
	pickedGColor = Color.lightgray
	pickedBColor = Color.darkgray

func getSlot():
	return BodypartSlot.Hair

func getCompatibleSpecies():
	return [Species.AnyNPC]

func npcGenerationWeight(_dynamicCharacter):
	if(_dynamicCharacter.getGender() == Gender.Male):
		return maleWeight
	if(_dynamicCharacter.getGender() in [Gender.Female, Gender.Androgynous]):
		return femaleWeight
	return 1.0

func hasCustomSkinPattern():
	return true

func generateRandomColors(_dynamicCharacter):
	var randomColors
	
	if(RNG.chance(20) && _dynamicCharacter != null):
		randomColors = ColorUtils.generate3ColorsFromMainColor(RNG.pick([_dynamicCharacter.pickedSkinGColor.inverted(), _dynamicCharacter.pickedSkinGColor, _dynamicCharacter.pickedSkinBColor]))
	elif(RNG.chance(30)):
		randomColors = ColorUtils.generateUnrealisticHairColors()
	else:
		randomColors = ColorUtils.generateRealisticHairColors()
		
	pickedRColor = randomColors[0]
	pickedGColor = randomColors[1]
	pickedBColor = randomColors[2]
	
