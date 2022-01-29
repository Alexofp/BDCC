extends BuffBase

var amount = 0

func _init():
	id = "lustDamageBuff"

func initBuff(_args):
	amount = _args[0]

func getVisibleDescription():
	var text = str(amount)
	if(amount > 0):
		text = "+"+text
	return "Lust damage "+text+"%"

func apply(_buffHolder):
	_buffHolder.dealDamageMult[DamageType.Lust] *= (1.0 + amount/100.0)
