extends Bodypart
class_name BodypartBody

func _init():
	limbSlot = LimbTypes.Body

func getSlot():
	return BodypartSlot.Body

func getCompatibleSpecies():
	return [Species.Any]
