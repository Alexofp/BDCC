extends StatusEffectBase

func _init():
	id = "DrugDenBoss1"
	#isBattleOnly = true
	
func initArgs(_args = []):
	pass
	
func processTime(_minutesPassed: int):
	pass

func getEffectName():
	return "Junkie Boss"

func getEffectDesc():
	var theText:String = "This junkie is high on something.."
	
	return theText

func getEffectImage():
	return "res://Images/StatusEffects/medicines.png"

func getIconColor():
	return IconColorGreen

func combine(_args = []):
	pass

func getBuffs():
	return [
		buff(Buff.StatusEffectImmunityBuff, [StatusEffect.Collapsed, 100.0]),
		buff(Buff.StatusEffectImmunityBuff, [StatusEffect.Stunned, 100.0]),
		buff(Buff.StatusEffectImmunityBuff, [StatusEffect.Bleeding, 100.0]),
	]
