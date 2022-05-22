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
	return "You are completely out of energy"

func getEffectImage():
	return "res://Images/StatusEffects/noenergy.png"

func getIconColor():
	return IconColorRed

func combine(_args = []):
	pass

func getBuffs():
	return [
		buff(Buff.PhysicalDamageBuff, [-20])
	]
