extends FluidBase

func _init():
	id = "Milk"

func getVisibleName():
	return "Milk"

func getMessyDescription(_pc, _amount):
	if(_amount >= 500.0):
		return "You're drenched in milk! Moo!"
	
	return null

func getMessyBuffs(_pc, _amount):
	if(_pc.hasPerk(Perk.CumSlut)):
		var messLevel = Util.mini(int(_amount / 200), 10)
		
		if(messLevel > 0):
			return [
				buff(Buff.PhysicalArmorBuff, [5 * messLevel]),
			]

func getBellyBuffs(_pc, _amount):
	if(_pc.hasPerk(Perk.CumBreathV1)):
		var messLevel = Util.mini(int(_amount / 100), 100)
		
		if(messLevel > 0):
			return [
				buff(Buff.MaxPainBuff, [2 * messLevel]),
			]

func onSwallow(_pc, _amount):
	var toHeal = Util.mini(int(_amount / 20), 1000)
	
	if(toHeal > 0):
		_pc.addPain(-toHeal)
		return "Drinking milk relieved you of "+DamageType.getDamageColoredString(DamageType.Physical, toHeal)+"."
	
	return null
