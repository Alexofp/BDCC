extends StatusEffectBase

func _init():
	id = StatusEffect.Muzzled
	isBattleOnly = false
	
func initArgs(_args = []):
	pass
	
func processBattleTurn():
	pass
	
func processTime(_minutesPassed: int):
	pass

func getEffectName():
	return "Muzzled"

func getEffectDesc():
	return "You have a dog muzzle on your face!"

func getEffectImage():
	return "res://UI/StatusEffectsPanel/images/gag.png"

func getIconColor():
	return IconColorPurple

func combine(_args = []):
	pass

