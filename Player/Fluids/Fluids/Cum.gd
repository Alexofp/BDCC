extends FluidBase

func _init():
	id = "Cum"

func getVisibleName():
	return "Cum"

func canImpregnate():
	return true

func getMessyDescription(_pc, _amount):
	if(_amount >= 1000.0):
		return "You look like a complete cum dump and feel like one too!"
	if(_amount >= 500.0):
		return "You're such a cum rag!"
	
	return null

func getMessyBuffs(_pc, _amount):
	if(_pc.hasPerk(Perk.CumSlut)):
		var messLevel = Util.mini(int(_amount / 100), 10)
		
		if(messLevel > 0):
			return [
				buff(Buff.LustDamageBuff, [5 * messLevel]),
			]

func getBellyBuffs(_pc, _amount):
	if(_pc.hasPerk(Perk.CumBreathV1)):
		var messLevel = Util.mini(int(_amount / 200), 10)
		
		if(messLevel > 0):
			return [
				buff(Buff.PhysicalDamageBuff, [5 * messLevel]),
			]

func onSwallow(_pc, _amount):
	var toHeal = Util.mini(int(_amount / 10), 1000)
	
	if(toHeal > 0):
		_pc.addStamina(toHeal)
		return "Drinking cum provided you with an energy boost, giving you "+DamageType.getDamageColoredString(DamageType.Stamina, toHeal)+" back."
	
	return null
