extends Bodypart
class_name BodypartAnus

func _init():
	limbSlot = null

func getSlot():
	return BodypartSlot.Anus

func getCompatibleSpecies():
	return [Species.Any]
	
func getTooltipInfo():
	return "Gonna be stuff here"
