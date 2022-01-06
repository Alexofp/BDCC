extends StatusEffectBase

func _init():
	id = StatusEffect.Collapsed
	isBattleOnly = true
	
func initArgs(_args = []):
	pass
	
func processBattleTurn():
	pass
	
func processTime(_minutesPassed: int):
	pass

func getEffectName():
	return "Collapsed"

func getEffectDesc():
	return "You're on the ground. Can still fight\nbut it's impossible to dodge attacks"

func getEffectImage():
	return null

func getEffectVisibleType():
	return StatusEffectsPanel.EffectType.Normal

func combine(_args = []):
	pass
