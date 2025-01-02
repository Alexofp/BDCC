extends Bodypart
class_name BodypartVagina

var fluidType:String = "GirlCum"

func _init():
	limbSlot = null
	orifice = VaginaOrifice.new()
	orifice.bodypart = weakref(self)
	setupSensitiveZone()
	needsProcessing = true

func setupSensitiveZone():
	sensitiveZone = preload("res://Player/SensitiveZone/SensitiveVagina.gd").new()
	sensitiveZone.setBodypart(self)

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

func saveData():
	var data = .saveData()
	data["fluidType"] = fluidType
	
	return data

func loadData(_data):
	fluidType = SAVE.loadVar(_data, "fluidType", "GirlCum")
	
	.loadData(_data)

func applyTFData(_data):
	.applyTFData(_data)
	
	fluidType = loadTFVar(_data, "fluidType", fluidType)

func getFluidType(_fluidSource) -> String:
	return fluidType

func getTransformAwayMessage(_context:Dictionary) -> String:
	return "A worrying warmth spreads through {npc.yourHis} lower abdomen, and {npc.youHe} {npc.youVerb('feel')} a soft pulsing sensation as {npc.yourHis} vagina begins to get smaller and smaller. The folds and curves are gradually flattening and receding, slick inner walls retracting back into {npc.yourHis} body. {npc.YouHe} {npc.youVerb('feel')} a rush of air against {npc.yourHis} skin as the last remnants of {npc.yourHis} pussy disappear, the hole closing up, leaving {npc.youHim} with a smooth, flat crotch."

func getTransformGrowMessage(_context:Dictionary) -> String:
	return "A tingling sensation spreads through {npc.yourHis} abdomen, and {npc.youHe} {npc.youVerb('sense')} something new beginning to form within {npc.youHim}. The delicate skin is stretching and reshaping, as if something is blossoming from deep inside. Each pulse sends waves of anticipation coursing through {npc.youHim}, heightening {npc.yourHis} awareness. The contours of {npc.yourHis} new anatomy begin to take shape until the last remnants of the transformation settle. {npc.YouHe} {npc.youVerb('feel')} the unmistakable opening of {npc.yourHis} new flower, the soft folds parting to reveal a slick, needy pussy."

func getTransformMorphMessage(_context:Dictionary) -> String:
	return "{npc.YouHe} {npc.youVerb('feel')} a warm sensation in {npc.yourHis} lower body, and suddenly, {npc.yourHis} pussy begins to transform. The shape shifts, becoming more pronounced and adorned with new textures. The change is significant, yet it kept {npc.yourHis} current tightness. {npc.YouHe} now {npc.youVerb('have', 'has')} "+getAVulgarName()+"."
