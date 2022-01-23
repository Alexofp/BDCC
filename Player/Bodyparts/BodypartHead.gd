extends Bodypart
class_name BodypartHead

func _init():
	pass

func getSlot():
	return BodypartSlot.Head

func getCompatibleSpecies():
	return [Species.Any]
