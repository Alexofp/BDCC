extends StatusEffectBase

func _init():
	id = StatusEffect.Exhausted
	isBattleOnly = false
	
func initArgs(_args = []):
	pass
	
func processBattleTurn():
	pass
	
func processTime(_minutesPassed: int):
	pass

func getEffectName():
	return "Exhausted"

func getEffectDesc():
	return "You are completely out of energy\n[color=red]Physical damage -20%[/color]"

func getEffectImage():
	return null

func getIconColor():
	return IconColorRed

func combine(_args = []):
	pass

func getDamageMultiplierMod(_damageType):
	if(_damageType == DamageType.Physical):
		return 0.8
	return 1
