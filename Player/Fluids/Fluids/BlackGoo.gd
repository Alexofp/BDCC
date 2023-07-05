extends FluidBase

func _init():
	id = "BlackGoo"

func getVisibleName():
	return "Black Goo"

func getCost(_amount) -> int:
	return int(_amount / 100.0) * 3

func getCumOverlayColor():
	return Color.black

func getMessyBuffs(_pc, _amount):
	var messLevel = Util.mini(int(_amount / 100), 10)
	
	if(messLevel > 0):
		return [
			buff(Buff.DodgeChanceBuff, [-5 * messLevel]),
		]
