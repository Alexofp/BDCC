extends StatusEffectBase

func _init():
	id = StatusEffect.HasCumInsideAnus
	isBattleOnly = false
	
	alwaysCheckedForNPCs = true
	alwaysCheckedForPlayer = true
	priorityDuringChecking = 92
	
func shouldApplyTo(_npc):
	if(_npc.hasBodypart(BodypartSlot.Anus) && !_npc.getBodypart(BodypartSlot.Anus).isOrificeEmpty()):
		return true
	return false
	
func initArgs(_args = []):
	pass
	
func processBattleTurn():
	pass
	
func processTime(_secondsPassed: int):
	pass

func getEffectName():
	return "Anal Creampie"

func getEffectDesc():
	if(!character.hasBodypart(BodypartSlot.Anus)):
		return "Something is wrong"
	var bodypart = character.getBodypart(BodypartSlot.Anus)
	var orifice: Orifice = bodypart.getOrifice()
	var stuffLevel = orifice.getStuffedLevel()
	var fluidAmount = orifice.getFluidAmount()
	var fluidAmountRounded = ceil(fluidAmount)
	
	var messFluids = orifice.getFluidList()
	var humanReadableString = Util.humanReadableList(messFluids)
	
	var message = "You got fucked in the ass and now your butt is stuffed with " + str(fluidAmountRounded) + " ml of "+humanReadableString
	if(stuffLevel > 1.0):
		message += ". Your anus is completely filled"
	
	var uniqueUsers = orifice.getUniqueCharactersAmount()
	if(uniqueUsers > 1):
		message += " from "+str(uniqueUsers)+" lovers"
	
	return message

func getEffectImage():
	return "res://Images/StatusEffects/butt.png"

func getIconColor():
	return IconColorPurple

func combine(_args = []):
	pass
