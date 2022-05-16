extends StatusEffectBase

func _init():
	id = StatusEffect.InHeat
	isBattleOnly = false

func getEffectName():
	return "In Heat"

func getEffectDesc():
	return "You have a huge urge to mate with someone.."

func getEffectImage():
	return "res://UI/StatusEffectsPanel/images/butt.png"

func getIconColor():
	return IconColorDarkPurple

func getBuffs():
	return [
		buff(Buff.ReceivedLustDamageBuff, [30]),
		buff(Buff.AmbientLustBuff, [50]),
		buff(Buff.ExposureBuff, [50]),
	]
