extends Bodypart
class_name BodypartHair

func _init():
	pass

func getSlot():
	return BodypartSlot.Hair

func getCompatibleSpecies():
	return [Species.Any]
