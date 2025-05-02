extends Bodypart
class_name BodypartBody

func _init():
	limbSlot = LimbTypes.Body

func getSlot():
	return BodypartSlot.Body

func getCompatibleSpecies():
	return [Species.Any]

func getTransformMorphMessage(_context:Dictionary) -> String:
	return "{npc.YouHe} {npc.youVerb('feel')} a warm wave wash over {npc.yourHis} body, and suddenly, the very structure begins to change. Muscles ripple and shift, {npc.yourHis} silhouette changing rapidly. But sitll, the new form is still holding traces of {npc.yourHis} previous physique. {npc.YouHe} now {npc.youVerb('have', 'has')} "+getAVulgarName()+"."
