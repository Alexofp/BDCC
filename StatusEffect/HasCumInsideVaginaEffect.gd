extends StatusEffectBase

func _init():
	id = StatusEffect.HasCumInsideVagina
	isBattleOnly = false
	
	alwaysCheckedForNPCs = true
	alwaysCheckedForPlayer = true
	priorityDuringChecking = 92
	
func shouldApplyTo(_npc):
	if(_npc.hasBodypart(BodypartSlot.Vagina) && !_npc.getBodypart(BodypartSlot.Vagina).isOrificeEmpty()):
		return true
	return false
	
func initArgs(_args = []):
	pass
	
func processBattleTurn():
	pass
	
func processTime(_secondsPassed: int):
	pass

func getEffectName():
	return "Creampie"

func getEffectDesc():
	if(!character.hasBodypart(BodypartSlot.Vagina)):
		return "Something is wrong"
	var vagina = character.getBodypart(BodypartSlot.Vagina)
	var womb: Orifice = vagina.getOrifice()
	var stuffLevel = womb.getStuffedLevel()
	var fluidAmount = womb.getFluidAmount()
	var fluidAmountRounded = ceil(fluidAmount)
	
	var messFluids = womb.getFluidList()
	var humanReadableString = Util.humanReadableList(messFluids)
	
	var message = "You got fucked and now your womb is stuffed with " + str(fluidAmountRounded) + " ml of "+humanReadableString
	if(stuffLevel > 1.0):
		message += ". Your womb is filled to the brim"
	
	var uniqueUsers = womb.getUniqueCharactersAmount()
	if(uniqueUsers > 1):
		message += " from "+str(uniqueUsers)+" lovers"
	
	return message

func getEffectImage():
	if(!character.isPlayer()):
		return "res://Images/StatusEffects/womb2.png"
	
	if(!character.hasBodypart(BodypartSlot.Vagina)):
		return null
	var vagina = character.getBodypart(BodypartSlot.Vagina)
	var womb: Orifice = vagina.getOrifice()
	var stuffLevel = womb.getStuffedLevel()
	
	if(stuffLevel < 0.3):
		return "res://Images/StatusEffects/womb1.png"
	if(stuffLevel < 0.7):
		return "res://Images/StatusEffects/womb2.png"
	return "res://Images/StatusEffects/womb3.png"

func getIconColor():
	return IconColorPurple

func combine(_args = []):
	pass
