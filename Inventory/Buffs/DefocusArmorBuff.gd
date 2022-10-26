extends BuffBase

var amount:int = 0

func _init():
	id = Buff.DefocusArmorBuff

func initBuff(_args):
	amount = _args[0]

func getVisibleDescription():
	var text = str(amount)
	if(amount > 0):
		text = "+"+text
	return "Extra armor when defocusing "+text

func apply(_buffHolder):
	_buffHolder.addCustom(BuffAttribute.DefocusArmor, amount)

func getBuffColor():
	if(amount > 0):
		return DamageType.getColor(DamageType.Lust)
	return Color.red

func saveData():
	var data = .saveData()
	
	data["amount"] = amount

	return data
	
func loadData(_data):
	.loadData(_data)
	amount = SAVE.loadVar(_data, "amount", 0)

func combine(_otherBuff):
	if(_otherBuff.amount > amount):
		amount = _otherBuff.amount
