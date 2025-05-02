extends Bodypart
class_name BodypartLeg

func _init():
	limbSlot = LimbTypes.Legs

func getSlot():
	return BodypartSlot.Legs

func getTransformMorphMessage(_context:Dictionary) -> String:
	var isDigi:bool = hasTrait(PartTrait.LegsDigi)
	var isHoofs:bool = hasTrait(PartTrait.LegsHoofs)
	#var isPlanti:bool = hasTrait(PartTrait.LegsPlanti)
	if(isHoofs):
		return "{npc.YouHe} {npc.youVerb('feel')} a powerful surge in {npc.yourHis} legs, and suddenly, they begin to change. The transformation is dramatic as {npc.yourHis} feet reshape into big, sturdy hoofs. Hoofs that make a noise each time {npc.youHe} {npc.youVerb('make')} a step."
	if(isDigi):
		return "{npc.YouHe} {npc.youVerb('feel')} a strange sensation in {npc.yourHis} legs, and suddenly, they begin to morph. The transformation is swift as {npc.yourHis} legs reshape into a digitigrade form, with the weight shifting to the toes. The new legs are sleek and agile, with muscles ripple beneath the skin, reflecting a more animalistic nature."
	
	return "{npc.YourHis} legs begin to morph! Their structure and silhouette changes dramatically, muscles and bones shifting inside. {npc.YouHe} now {npc.youVerb('have', 'has')} "+getAVulgarName()+"."
