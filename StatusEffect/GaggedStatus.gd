extends StatusEffectBase

func _init():
	id = StatusEffect.Gagged
	isBattleOnly = false
	
func initArgs(_args = []):
	pass
	
func processBattleTurn():
	pass
	
func processTime(_minutesPassed: int):
	pass

func getEffectName():
	return "Gagged"

func getEffectDesc():
	return "Something in your mouth prevents you from biting and also garbles your speech"

func getEffectImage():
	return "res://UI/StatusEffectsPanel/images/gag.png"

func getIconColor():
	return IconColorPurple

func combine(_args = []):
	pass

