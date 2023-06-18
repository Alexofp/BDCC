extends Bodypart
class_name BodypartHair

var maleWeight = 1.0
var femaleWeight = 1.0

func _init():
	limbSlot = LimbTypes.Hair

func getSlot():
	return BodypartSlot.Hair

func getCompatibleSpecies():
	return [Species.Any]

func npcGenerationWeight(_dynamicCharacter):
	if(_dynamicCharacter.getGender() == Gender.Male):
		return maleWeight
	if(_dynamicCharacter.getGender() in [Gender.Female, Gender.Androgynous]):
		return femaleWeight
	return 1.0

func hasCustomSkinPattern():
	return true
