extends Bodypart
class_name BodypartHead

func _init():
	limbSlot = LimbTypes.Head

func getSlot():
	return BodypartSlot.Head

func getCompatibleSpecies():
	return [Species.Any]
