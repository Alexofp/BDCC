extends Bodypart
class_name BodypartVagina

func _init():
	limbSlot = null

func getSlot():
	return BodypartSlot.Vagina

func getCompatibleSpecies():
	return [Species.Any]
	
func getTooltipInfo():
	return "Gonna be stuff here"
