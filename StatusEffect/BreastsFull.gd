extends StatusEffectBase

func _init():
	id = StatusEffect.BreastsFull
	isBattleOnly = false

func getEffectName():
	return "Breasts full"

func getEffectDesc():
	return "Your breasts feel so heavy, they're full of milk! They are itching to be milked"

func getEffectImage():
	return "res://Images/StatusEffects/lactation.png"

func getIconColor():
	return IconColorRed

func getBuffs():
	return [
		buff(Buff.AmbientLustBuff, [10]),
	]
