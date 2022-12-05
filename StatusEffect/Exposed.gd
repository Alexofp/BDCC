extends StatusEffectBase

func _init():
	id = StatusEffect.Exposed
	isBattleOnly = false
	
func initArgs(_args = []):
	pass
	
func processBattleTurn():
	pass
	
func processTime(_minutesPassed: int):
	pass

func getEffectName():
	return "Exposed"

func getEffectDesc():
	return "Your exposure is very high, someone might take advantage of you!\n\nYour exposure is "+str(Util.roundF(character.getExposure()*100.0))+"%"

func getEffectImage():
	return "res://Images/StatusEffects/mask.png"

func getIconColor():
	return IconColorRed

func combine(_args = []):
	pass

