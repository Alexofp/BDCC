extends Bodypart
class_name BodypartAnus

func _init():
	limbSlot = null
	orifice = AnusOrifice.new()
	orifice.bodypart = weakref(self)
	setupSensitiveZone()
	needsProcessing = true

func setupSensitiveZone():
	sensitiveZone = preload("res://Player/SensitiveZone/SensitiveAnus.gd").new()
	sensitiveZone.setBodypart(self)

func getSlot():
	return BodypartSlot.Anus

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
	return "anus"

func safeWhenExposed():
	return false

func getRevealMessage():
	if(orifice == null):
		return .getRevealMessage()
	
	return Util.capitalizeFirstLetter(orifice.getLoosenessString()) + " anus got revealed."

func supportsSkin():
	return false

func getTransformMorphMessage(_context:Dictionary) -> String:
	var theChar = getCharacter()
	var hasVag:bool = false
	if(theChar != null && theChar.hasVagina()):
		hasVag = true
	var hasWomb:bool = hasTrait(PartTrait.AnusWomb)
	if(hasWomb):
		if(hasVag):
			return "{npc.YouHe} {npc.youVerb('feel')} a tingling at {npc.yourHis} rear, and suddenly, {npc.yourHis} anus begins to change. The shape shifts, becoming more pronounced and adorned with new textures. The change is much bigger than it looks on the outside.. This new tailhole now shares a womb with {npc.yourHis} pussy, intertwining their functions."
		return "{npc.YouHe} {npc.youVerb('feel')} a tingling at {npc.yourHis} rear, and suddenly, {npc.yourHis} anus begins to change. The shape shifts, becoming more pronounced and adorned with new textures. The change is much bigger than it looks on the outside.. A womb forms inside {npc.youHim}, connected to your tailhole."
	return "{npc.YouHe} {npc.youVerb('feel')} a tingling at {npc.yourHis} rear, and suddenly, {npc.yourHis} anus begins to change. The shape shifts, becoming more pronounced and adorned with new textures. The change is significant, yet it kept {npc.yourHis} current tightness. {npc.YouHe} now {npc.youVerb('have', 'has')} "+getAVulgarName()+"."
