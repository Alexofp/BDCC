extends Bodypart
class_name BodypartAnus

func _init():
	limbSlot = null
	orifice = AnusOrifice.new()
	orifice.bodypart = weakref(self)
	needsProcessing = true

func getSlot():
	return BodypartSlot.Anus

func getCompatibleSpecies():
	return [Species.Any]
	
func getTooltipInfo():
	var text = ""
	if(orifice != null):
		text += orifice.getTooltipInfo()
	return text

func getOrificeName():
	return "anus"

func safeWhenExposed():
	return false

func getRevealMessage():
	if(orifice == null):
		return .getRevealMessage()
	
	return Util.capitalizeFirstLetter(orifice.getLoosenessString()) + " anus got revealed."

func supportsSkin():
	return false
