extends Bodypart
class_name BodypartHead

func _init():
	limbSlot = LimbTypes.Head
	orifice = ThroatOrifice.new()
	orifice.bodypart = weakref(self)
	needsProcessing = true

func getSlot():
	return BodypartSlot.Head

func getCompatibleSpecies():
	return [Species.Any]

func getOrificeName():
	return "throat"

func getTooltipInfo():
	var text = ""
	if(orifice != null):
		text += orifice.getTooltipInfo()
	return text

# Used to adjust the kissing animation
# 0 = Human (flat head)
# 1 = Dragon/canine (very long muzzle)
func getHeadLength():
	return 0.25

func getTransformMorphMessage(_context:Dictionary) -> String:
	return "The shape of {npc.yourHis} head begins to shift! Features morph and change, contours of {npc.yourHis} skull elongate and reshape into a different form. But somehow, {npc.yourHis} new face retains a hint of the old one. By the end of the process, {npc.youHe} now {npc.youVerb('have', 'has')} "+getAVulgarName()+"."
