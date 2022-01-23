extends Bodypart
class_name BodypartBody

func _init():
	pass

func getSlot():
	return BodypartSlot.Body

func getCompatibleSpecies():
	return [Species.Any]
