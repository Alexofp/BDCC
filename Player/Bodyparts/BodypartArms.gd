extends Bodypart
class_name BodypartArms

func _init():
	limbSlot = LimbTypes.Arms

func getSlot():
	return BodypartSlot.Arms

func getTransformMorphMessage(_context:Dictionary) -> String:
	var isBuff:bool = hasTrait(PartTrait.ArmsBuff)
	return "{npc.YourHis} arms begin to morph! The shape shifts, "+("growing much more muscular" if isBuff else "its silhouette changes drastically")+". {npc.YouHe} now {npc.youVerb('have', 'has')} "+getAVulgarName()+"."
