extends StatusEffectBase

func _init():
	id = StatusEffect.Blindfolded
	isBattleOnly = false
	
func initArgs(_args = []):
	pass
	
func processBattleTurn():
	pass
	
func processTime(_minutesPassed: int):
	pass

func getEffectName():
	return "Blindfolded"

func getEffectDesc():
	return "You can't see. Hitting anything will be very hard"

func getEffectImage():
	return "res://UI/StatusEffectsPanel/images/blind.png"

func getIconColor():
	return IconColorPurple

func combine(_args = []):
	pass

func getBuffs():
	return [
		buff(Buff.AccuracyBuff, [-50])
	]
