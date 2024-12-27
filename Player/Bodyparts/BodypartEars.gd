extends Bodypart
class_name BodypartEars

func _init():
	limbSlot = LimbTypes.Ears

func getSlot():
	return BodypartSlot.Ears

func hasCustomSkinPattern():
	return true

func getTransformAwayMessage(_context:Dictionary) -> String:
	return "{npc.YouHe} {npc.youVerb('feel')} a strange pressure as {npc.yourHis} ears shrink and flatten against {npc.yourHis} head, becoming mere nubs that are barely noticeable."
