extends StatusEffectBase

func _init():
	id = StatusEffect.HasCumInsideVagina
	isBattleOnly = false
	
func initArgs(_args = []):
	pass
	
func processBattleTurn():
	pass
	
func processTime(_secondsPassed: int):
	pass

func getEffectName():
	return "Creampie"

func getEffectDesc():
	if(!character.isPlayer()):
		return character.getName()+" has cum inside their womb"
	
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
		message += ". Your womb is completely filled"
	
	return message

func getEffectImage():
	return "res://UI/StatusEffectsPanel/images/mess.png"

func getIconColor():
	return IconColorPurple

func combine(_args = []):
	pass
