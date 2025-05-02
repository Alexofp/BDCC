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
	
func getTransformAwayMessage(_context:Dictionary) -> String:
	var isSingular:bool = hasTrait(PartTrait.HornsSingle)
	return "{npc.YouHe} {npc.youAre} suddenly overwhelmed by a sharp, searing pain that radiates from {npc.yourHis} forehead as {npc.yourHis} horn"+("s" if !isSingular else "")+" begin to dissolve into {npc.yourHis} skin. The sensation is excruciating, like a fire coursing through {npc.yourHis} veins, and {npc.youHe} can feel the horn"+("s" if !isSingular else "")+" shrinking agonizingly slowly. Each inch lost is accompanied with a throbbing wave of pain. Finally, with one last pulse of pain, {npc.yourHis} horn"+("s" if !isSingular else "")+" vanish completely, leaving {npc.youHim} with nothing but a smooth forehead."

func getTransformGrowMessage(_context:Dictionary) -> String:
	var isSingular:bool = hasTrait(PartTrait.HornsSingle)
	return "{npc.YouHe} {npc.youVerb('feel')} a sudden pressure building at {npc.yourHis} forehead, and with a sharp pang, "+("two majestic horns begin" if !isSingular else "a magestic new horn begins")+" to push through {npc.yourHis} skin. "+("They curl" if !isSingular else "It curls")+" upwards with fierce elegance, the sensation a mix of pain and discomfort, {npc.yourHis} mouth letting various grunts and huffs during this long process. Only when "+("they finish" if !isSingular else "it finishes")+" growing, {npc.youHe} can finally breathe out."

func getTransformMorphMessage(_context:Dictionary) -> String:
	var oldTraits:Dictionary = _context["oldTraits"] if _context.has("oldTraits") else {}
	var wasSingle:bool = (oldTraits.has(PartTrait.HornsSingle) && oldTraits[PartTrait.HornsSingle])
	return "{npc.YourHis} horn"+("s begin to change their shape. They twist and curl" if !wasSingle else " begins to change its shape. It twists and curls")+", taking a new, different form. {npc.YouHe} now {npc.youVerb('have', 'has')} "+getAVulgarName()+"."
