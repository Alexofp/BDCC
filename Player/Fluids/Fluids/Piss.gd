extends FluidBase

func _init():
	id = "Piss"

func getVisibleName():
	return "Piss"

func getStatusEffectColor():
	return Color.yellow

func getStatusEffectPicture():
	return "res://Images/StatusEffects/puddle.png"

func getMessyDescription(_pc, _amount):
	if(_amount >= 300.0):
		return "You have a strong scent of piss attached to you!"
	if(_amount >= 100.0):
		return "You smell gross! Better not let others near you."
	
	return "You have a faint gross scent attached to you."

func getMessyBuffs(_pc, _amount):
	if(_amount >= 500.0):
		return [
			buff(Buff.LustDamageBuff, [-80]),
			buff(Buff.LustArmorBuff, [50]),
		]
	if(_amount >= 100.0):
		return [
			buff(Buff.LustDamageBuff, [-60]),
			buff(Buff.LustArmorBuff, [20]),
		]
	return [
		buff(Buff.LustDamageBuff, [-30]),
		buff(Buff.LustArmorBuff, [10]),
	]
