extends FluidBase

func _init():
	id = "GirlCum"

func getVisibleName():
	return "Girlcum"

func getMessyDescription(_pc, _amount):
	if(_amount >= 500.0):
		return "You're drenched in girlcum, so lewd!"
	
	return null

func getMessyBuffs(_pc, _amount):
	if(_pc.hasPerk(Perk.CumSlut)):
		var messLevel = Util.mini(int(_amount / 40), 10)
		
		if(messLevel > 0):
			return [
				buff(Buff.DodgeChanceBuff, [1 * messLevel]),
			]

func getBellyBuffs(_pc, _amount):
	if(_pc.hasPerk(Perk.CumBreathV1)):
		var messLevel = Util.mini(int(_amount / 40), 10)
		
		if(messLevel > 0):
			return [
				buff(Buff.MaxLustBuff, [5 * messLevel]),
			]

func onSwallow(_pc, _amount):
	var toHeal = Util.mini(int(_amount / 20), 1000)
	
	if(toHeal > 0):
		_pc.addPain(-toHeal)
		return "Drinking girlcum relieved you of "+DamageType.getDamageColoredString(DamageType.Physical, toHeal)+"."
	
	return null

func getCost(_amount) -> int:
	return int(_amount / 250.0) * 1
