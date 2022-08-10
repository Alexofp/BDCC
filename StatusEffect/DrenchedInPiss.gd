extends StatusEffectBase

func _init():
	id = StatusEffect.DrenchedInPiss
	isBattleOnly = false
	
func initArgs(_args = []):
	pass
	
func processBattleTurn():
	pass
	
func processTime(_secondsPassed: int):
	pass

func getEffectName():
	return "Drenched in piss"

func getEffectDesc():
	return "Somebody pissed on you and now your carry their scent. So gross"

func getBuffs():
	return [
		buff(Buff.LustDamageBuff, [-80]),
		buff(Buff.LustArmorBuff, [50]),
	]
	
func getEffectImage():
	return "res://Images/StatusEffects/puddle.png"

func getIconColor():
	return IconColorYellow

func combine(_args = []):
	pass
