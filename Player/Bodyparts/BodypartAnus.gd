extends Bodypart
class_name BodypartAnus

func _init():
	limbSlot = null
	orifice = AnusOrifice.new()
	orifice.bodypart = weakref(self)

func getSlot():
	return BodypartSlot.Anus

func getCompatibleSpecies():
	return [Species.Any]
	
func getTooltipInfo():
	return "Gonna be stuff here"

func getOrificeName():
	return "anus"

func safeWhenExposed():
	return false
