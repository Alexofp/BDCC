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
	
func getTransformAwayMessage(_context:Dictionary) -> String:
	return "{npc.YouHe} {npc.youVerb('feel')} a tingling sensation on {npc.yourHis} scalp as {npc.yourHis} hair begins to shift and change. Suddenly, all the hairs start to retract into {npc.yourHis} scalp, leaving {npc.youHim} with a smooth, bald head."

func getTransformGrowMessage(_context:Dictionary) -> String:
	var isPonytailHair:bool = hasTrait(PartTrait.HairPonytail)
	var isShortHair:bool = hasTrait(PartTrait.HairShort)
	var isLongHair:bool = hasTrait(PartTrait.HairLong)
	var isOvereyeHair:bool = hasTrait(PartTrait.HairOvereye)
	
	if(isPonytailHair):
		return "{npc.YouHe} {npc.youVerb('feel')} a tingling sensation at the crown of {npc.yourHis} head, and suddenly, hair begins to sprout rapidly. Strands of hair gather together, pulling back into a sleek ponytail that sways with every movement. The ponytail is thick and lustrous, radiating energy as it bounces playfully behind {npc.yourHis} head."
	if(isShortHair):
		return "{npc.YouHe} {npc.youVerb('feel')} a tingling sensation at the crown of {npc.yourHis} head, and suddenly, hair begins to sprout rapidly. The strands grow in a short, stylish cut, hugging {npc.yourHis} head closely. Each hair is thick and vibrant, playing in the light."
	if(isLongHair):
		return "{npc.YouHe} {npc.youVerb('feel')} a tingling sensation at the crown of {npc.yourHis} head, and suddenly, hair begins to sprout rapidly. Long, flowing strands cascade down from {npc.yourHis} head, thick and lustrous, as if each hair is alive with energy. The hair tumbles gracefully past {npc.yourHis} shoulders, creating an enchanting aura that draws attention with every movement."
	if(isOvereyeHair):
		return "{npc.YouHe} {npc.youVerb('feel')} a tingling sensation at the crown of {npc.yourHis} head, and suddenly, hair begins to sprout rapidly. Strands of hair grow long and sweep down, falling dramatically over {npc.yourHis} eyes. The hair is thick and vibrant, creating a mysterious allure as it partially obscures {npc.yourHis} gaze, inviting curiosity and intrigue from those who look upon {npc.youHim}."
	return "{npc.YouHe} {npc.youVerb('feel')} a tingling sensation at the crown of {npc.yourHis} head, and suddenly, hair begins to sprout rapidly. Fresh new hair strands cascade down from {npc.yourHis} head, thick and lustrous, as if each hair is alive with energy."
