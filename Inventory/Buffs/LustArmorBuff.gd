extends BuffBase

var amount = 0

func _init():
	id = Buff.LustArmorBuff

func initBuff(_args):
	amount = _args[0]

func getVisibleDescription():
	var text = str(amount)
	if(amount > 0):
		text = "+"+text
	return "Lust armor "+text

func apply(_buffHolder):
	_buffHolder.armor[DamageType.Lust] += amount

func getBuffColor():
	if(amount > 0):
		return DamageType.getColor(DamageType.Lust)
	return Color.red
