extends StatusEffectBase

func _init():
	id = StatusEffect.ArmsBound
	isBattleOnly = false
	
func initArgs(_args = []):
	pass
	
func processBattleTurn():
	pass
	
func processTime(_minutesPassed: int):
	pass

func getEffectName():
	return "Bound arms"

func getEffectDesc():
	return "Your arms are bound, you can't punch"

func getEffectImage():
	return null

func getEffectVisibleType():
	return StatusEffectsPanel.EffectType.Red

func combine(_args = []):
	pass
