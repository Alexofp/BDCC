extends Bodypart
class_name BodypartVagina

func _init():
	limbSlot = null
	orifice = VaginaOrifice.new()
	orifice.bodypart = weakref(self)
	needsProcessing = true

func getSlot():
	return BodypartSlot.Vagina

func getCompatibleSpecies():
	return [Species.Any]
	
func getTooltipInfo():
	var text = ""
	if(orifice != null):
		text += orifice.getTooltipInfo()
	return text

func getOrificeName():
	return "pussy"

func safeWhenExposed():
	return false

func hasWomb():
	return true

func getRevealMessage():
	if(orifice == null):
		return .getRevealMessage()
	
	return Util.capitalizeFirstLetter(orifice.getLoosenessString()) + " pussy got revealed."

func supportsSkin():
	return false
