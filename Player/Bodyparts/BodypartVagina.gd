extends Bodypart
class_name BodypartVagina

func _init():
	limbSlot = null
	orifice = VaginaOrifice.new()
	orifice.bodypart = weakref(self)

func getSlot():
	return BodypartSlot.Vagina

func getCompatibleSpecies():
	return [Species.Any]
	
func getTooltipInfo():
	return "Gonna be stuff here"

func getOrificeName():
	return "pussy"

func safeWhenExposed():
	return false
