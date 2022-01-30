extends Bodypart
class_name BodypartHorns

func _init():
	limbSlot = LimbTypes.Horns

func getSlot():
	return BodypartSlot.Horns

func getCompatibleSpecies():
	return [Species.Any]
	
