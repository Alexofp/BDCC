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
		var messLevel = Util.mini(int(_amount / 100), 10)
		
		if(messLevel > 0):
			return [
				buff(Buff.DodgeChanceBuff, [1 * messLevel]),
			]
