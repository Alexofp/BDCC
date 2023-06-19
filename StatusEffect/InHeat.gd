extends StatusEffectBase

var toCheck = [
	character.hasBodypart(BodypartSlot.Penis),
	character.hasBodypart(BodypartSlot.Vagina)
]

func _init():
	id = StatusEffect.InHeat
	isBattleOnly = false

func getEffectName():
	match toCheck:
		[false, true]:
			return "In Heat"
		[true, false]:
			return "In Rut"
		[true, true]:
			return "In Heat and In Rut"

func getEffectDesc():
	return "You have a huge urge to mate with someone.."

func getEffectImage():
	return "res://Images/StatusEffects/heartburn.png"

func getIconColor():
	return IconColorDarkPurple

func getBuffs():
	return [
		buff(Buff.ReceivedLustDamageBuff, [30]),
		buff(Buff.AmbientLustBuff, [50]),
		buff(Buff.ExposureBuff, [50]),
	]
