extends BuffBase

var amount = 0

func _init():
	id = Buff.ReceivedLustDamageBuff

func initBuff(_args):
	amount = _args[0]

func getVisibleDescription():
	var text = str(amount)
	if(amount > 0):
		text = "+"+text
	return "Received Lust "+text+"%"

func apply(_buffHolder):
	_buffHolder.recieveDamageMult[DamageType.Lust] += (amount/100.0)

func getBuffColor():
	if(amount < 0):
		return DamageType.getColor(DamageType.Lust)
	return Color.red
