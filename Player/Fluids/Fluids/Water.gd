extends FluidBase

func _init():
	id = "Water"

func getVisibleName():
	return "Water"

func getMessyDescription(_pc, _amount):
	if(_amount >= 100.0):
		return "You're drenched!"
	
	return null

#func getMessyBuffs(_pc, _amount):
#	if(_pc.hasPerk(Perk.CumSlut)):
#		var messLevel = Util.mini(int(_amount / 40), 10)
#
#		if(messLevel > 0):
#			return [
#				buff(Buff.DodgeChanceBuff, [1 * messLevel]),
#			]
#
#func getBellyBuffs(_pc, _amount):
#	if(_pc.hasPerk(Perk.CumBreathV1)):
#		var messLevel = Util.mini(int(_amount / 40), 10)
#
#		if(messLevel > 0):
#			return [
#				buff(Buff.MaxLustBuff, [5 * messLevel]),
#			]

func onSwallow(_pc, _amount):
	var toHeal = Util.mini(int(_amount / 100), 1000)
	
	if(toHeal > 0):
		_pc.addStamina(toHeal)
		return "Drinking water gave "+_pc.getName()+" "+DamageType.getDamageColoredString(DamageType.Stamina, toHeal)+" back."
	
	return null

func getCost(_amount) -> int:
	return 0

func getCumOverlayColor():
	return Color(1.0, 1.0, 1.0, 0.2)
