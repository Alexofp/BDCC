extends BuffBase

var amount = 0

func _init():
	id = Buff.RestraintForcingSuccessBuff

func initBuff(_args):
	amount = _args[0]

func getVisibleDescription():
	var text = str(amount)
	if(amount > 0):
		text = "+"+text
	return "Restraint forcing chance "+text+"%"

func apply(_buffHolder):
	_buffHolder.addCustom(BuffAttribute.RestraintForcingSuccess, amount/100.0)

func getBuffColor():
	if(amount < 0):
		return Color.red
	return DamageType.getColor(DamageType.Stamina)

func saveData():
	var data = .saveData()
	
	data["amount"] = amount

	return data
	
func loadData(_data):
	.loadData(_data)
	amount = SAVE.loadVar(_data, "amount", 0.0)

func combine(_otherBuff):
	if(_otherBuff.amount > amount):
		amount = _otherBuff.amount
