extends BuffBase

var amount = 0

func _init():
	id = Buff.MaxStaminaBuff

func initBuff(_args):
	amount = _args[0]

func getVisibleDescription():
	var text = str(amount)
	if(amount > 0):
		text = "+"+text
	return "Extra stamina "+text

func apply(_buffHolder):
	_buffHolder.extraStamina += amount

func getBuffColor():
	if(amount < 0):
		return Color.red
	return DamageType.getColor(DamageType.Stamina)
