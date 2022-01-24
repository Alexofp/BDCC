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
	return "Something in your mouth prevents you from talking normally and biting"

func getEffectImage():
	return null

func getEffectVisibleType():
	return StatusEffectsPanel.EffectType.Purple

func combine(_args = []):
	pass

