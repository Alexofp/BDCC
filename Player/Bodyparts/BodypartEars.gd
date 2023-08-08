extends Bodypart
class_name BodypartEars

func _init():
	limbSlot = LimbTypes.Ears

func getSlot():
	return BodypartSlot.Ears

func hasCustomSkinPattern():
	return true
