extends StatusEffectBase

func _init():
	id = StatusEffect.CoveredInCum
	isBattleOnly = false
	
	alwaysCheckedForNPCs = true
	alwaysCheckedForPlayer = true
	priorityDuringChecking = 93
	
func shouldApplyTo(_npc):
	if(!_npc.bodyFluids.isEmpty()):
		return true
	return false
	
func initArgs(_args = []):
	pass
	
func processBattleTurn():
	pass
	
func processTime(_secondsPassed: int):
	pass

func getEffectName():
	return "Messy"

func getEffectDesc():
	var fluids = character.getFluids()
	
	var messLevel = character.getOutsideMessinessLevel()
	var messFluids = fluids.getFluidAmountByType()
	var message = BodilyFluids.getOutsideMessinessMessage(messLevel, messFluids.keys())
	
	var resultMessage = [message]
	
	for fluidID in messFluids:
		var fluidObject = GlobalRegistry.getFluid(fluidID)
		if(fluidObject == null):
			continue
		
		var messDesc = fluidObject.getMessyDescription(character, messFluids[fluidID])
		if(messDesc != null && messDesc != ""):
			resultMessage.append(messDesc)
	
	resultMessage.append("On your body:\n"+Util.join(fluids.getContentsHumanReadableArray(), "\n"))

	return Util.join(resultMessage, "\n\n")

func getBuffs():
	var fluids = character.getFluids()
	var messLevel = character.getOutsideMessinessLevel()
	var messFluids = fluids.getFluidAmountByType()
	
	var result = []
	if(messLevel > 1):
		if(!character.hasPerk(Perk.CumSlut)):
			result.append(buff(Buff.ReceivedLustDamageBuff, [10 * messLevel]))
		result.append(buff(Buff.ExposureBuff, [10 * messLevel]))
	
	for fluidID in messFluids:
		var fluidObject = GlobalRegistry.getFluid(fluidID)
		if(fluidObject == null):
			continue
		
		var messBuffs = fluidObject.getMessyBuffs(character, messFluids[fluidID])
		if(messBuffs != null):
			result.append_array(messBuffs)

	return result

func getEffectImage():
	var fluids = character.getFluids()
	var dominantFluidID = fluids.getDominantFluidID()
	if(dominantFluidID != null):
		var fluidObject = GlobalRegistry.getFluid(dominantFluidID)
		if(fluidObject != null):
			return fluidObject.getStatusEffectPicture()
	
	return "res://Images/StatusEffects/splurt.png"

func getIconColor():
	var fluids = character.getFluids()
	var dominantFluidID = fluids.getDominantFluidID()
	if(dominantFluidID != null):
		var fluidObject = GlobalRegistry.getFluid(dominantFluidID)
		if(fluidObject != null):
			return fluidObject.getStatusEffectColor()
	
	return IconColorPurple

func combine(_args = []):
	pass
