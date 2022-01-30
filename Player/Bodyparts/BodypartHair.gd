extends Bodypart
class_name BodypartHair

func _init():
	limbSlot = LimbTypes.Hair

func getSlot():
	return BodypartSlot.Hair

func getCompatibleSpecies():
	return [Species.Any]
