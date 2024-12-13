extends Bodypart
class_name BodypartVagina

func _init():
	limbSlot = null
	orifice = VaginaOrifice.new()
	orifice.bodypart = weakref(self)
	sensitiveZone = SensitiveZone.new()
	sensitiveZone.setBodypart(self)
	sensitiveZone.zoneName = "Pussy"
	sensitiveZone.lowSensitivityRestoreRate = 0.4
	needsProcessing = true

func getSlot():
	return BodypartSlot.Vagina

func getCompatibleSpecies():
	return [Species.Any]
	
func getTooltipInfo():
	var text = ""
	if(orifice != null):
		text += orifice.getTooltipInfo()
	if(sensitiveZone != null):
		if(text != ""):
			text += "\n"
		text += sensitiveZone.getInfoString()
	var theChar = getCharacter()
	if(GM.pc != null && GM.pc.hasPerk(Perk.BreedExtraTooltipInfo) && theChar != null && theChar.hasWombIn(getSlot())):
		var menstrualCycle = theChar.getMenstrualCycle()
		if(menstrualCycle != null):
			if(text != ""):
				text += "\n"
			text += "Cycle phase: "+str(CycleStage.getVisibleActionName(menstrualCycle.getCurrentStage()))
			text += "\nBreed chance: "+str(Util.roundF(menstrualCycle.getRoughChanceOfBecomingPregnant(), 1))+"%"
			text += "\nFertility: "+str(Util.roundF(theChar.getFertility()*100.0, 1))+"%"
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
