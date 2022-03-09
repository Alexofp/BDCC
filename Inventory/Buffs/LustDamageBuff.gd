extends BuffBase

var amount = 0

func _init():
	id = Buff.LustDamageBuff

func initBuff(_args):
	amount = _args[0]

func getVisibleDescription():
	var text = str(amount)
	if(amount > 0):
		text = "+"+text
	return "Lust damage "+text+"%"

func apply(_buffHolder):
	_buffHolder.dealDamageMult[DamageType.Lust] += (amount/100.0)

func getBuffColor():
	if(amount < 0):
		return Color.red
	return Color.pink
