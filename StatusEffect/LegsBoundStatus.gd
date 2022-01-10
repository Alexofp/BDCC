extends StatusEffectBase

func _init():
	id = StatusEffect.LegsBound
	isBattleOnly = false
	
func initArgs(_args = []):
	pass
	
func processBattleTurn():
	pass
	
func processTime(_minutesPassed: int):
	pass

func getEffectName():
	return "Bound legs"

func getEffectDesc():
	return "Your legs are bound, it's harder to dodge attacks"

func getEffectImage():
	return null

func getEffectVisibleType():
	return StatusEffectsPanel.EffectType.Purple

func combine(_args = []):
	pass

func getDodgeMod(_damageType):
	if(_damageType == DamageType.Physical):
		return 0.5
	return 1
