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
	return null

func getEffectVisibleType():
	return StatusEffectsPanel.EffectType.Purple

func combine(_args = []):
	pass

func getAccuracyMod(_damageType):
	if(_damageType == DamageType.Physical):
		return 0.5
	return 1
