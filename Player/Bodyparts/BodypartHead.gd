extends Bodypart
class_name BodypartHead

func _init():
	limbSlot = LimbTypes.Head
	orifice = ThroatOrifice.new()
	orifice.bodypart = weakref(self)

func getSlot():
	return BodypartSlot.Head

func getCompatibleSpecies():
	return [Species.Any]

func getOrificeName():
	return "throat"

func getTooltipInfo():
	var text = ""
	if(orifice != null):
		text += orifice.getTooltipInfo()
	return text
