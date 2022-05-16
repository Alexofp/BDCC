extends StatusEffectBase

func _init():
	id = StatusEffect.Pregnant
	isBattleOnly = false

func getEffectName():
	return "Pregnant"

func getEffectDesc():
	return "You're visible pregnant.."

func getEffectImage():
	return "res://UI/StatusEffectsPanel/images/womb3.png"

func getIconColor():
	return IconColorDarkPurple

func getBuffs():
	return [

	]
