extends Bodypart
class_name BodypartHorns

func _init():
	pass

func getSlot():
	return BodypartSlot.Horns

func getCompatibleSpecies():
	return [Species.Any]
	
