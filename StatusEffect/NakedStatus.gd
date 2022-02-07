extends StatusEffectBase

func _init():
	id = StatusEffect.Naked
	isBattleOnly = false
	
func initArgs(_args = []):
	pass
	
func processBattleTurn():
	pass
	
func processTime(_minutesPassed: int):
	pass

func getEffectName():
	return "Naked"

func getEffectDesc():
	return "You're naked, be ready for some extra attention\n[color=green]Lust damage +10%[/color]"

func getEffectImage():
	return null

func getEffectVisibleType():
	return StatusEffectsPanel.EffectType.Purple

func combine(_args = []):
	pass

func getDamageMultiplierMod(_damageType):
	if(_damageType == DamageType.Lust):
		return 1.1
	return 1
