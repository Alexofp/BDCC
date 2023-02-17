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
