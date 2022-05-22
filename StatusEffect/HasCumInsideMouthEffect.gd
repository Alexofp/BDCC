extends StatusEffectBase

func _init():
	id = StatusEffect.HasCumInsideMouth
	isBattleOnly = false
	
func initArgs(_args = []):
	pass
	
func processBattleTurn():
	pass
	
func processTime(_secondsPassed: int):
	pass

func getEffectName():
	return "Orally-filled"

func getEffectDesc():
	if(!character.hasBodypart(BodypartSlot.Head)):
		return "Something is wrong"
	var bodypart = character.getBodypart(BodypartSlot.Head)
	var orifice: Orifice = bodypart.getOrifice()
	var stuffLevel = orifice.getStuffedLevel()
	var fluidAmount = orifice.getFluidAmount()
	var fluidAmountRounded = ceil(fluidAmount)
	
	var messFluids = orifice.getFluidList()
	var humanReadableString = Util.humanReadableList(messFluids)
	
	var message = "Your last lover came down your throat and now your belly is stuffed with " + str(fluidAmountRounded) + " ml of "+humanReadableString
	if(stuffLevel > 1.0):
		message += ". Your belly is completely filled"
	
	var uniqueUsers = orifice.getUniqueCharactersAmount()
	if(uniqueUsers > 1):
		message += " from "+str(uniqueUsers)+" lovers"
	
	return message

func getEffectImage():
	return "res://Images/StatusEffects/mouth.png"

func getIconColor():
	return IconColorPurple

func combine(_args = []):
	pass
