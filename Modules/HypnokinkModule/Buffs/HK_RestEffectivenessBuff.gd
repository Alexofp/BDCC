extends BuffBase

var amount = 0

func _init():
	id = HK_Buff.RestEffectivenessBuff

func initBuff(_args):
	amount = _args[0]

func getVisibleDescription():
	var text = str(amount * 100)
	if(amount > 0):
		text = "+"+text
	return "Rest effectiveness "+text+"%"

func apply(_buffHolder: BuffsHolder):
	_buffHolder.addCustom(HK_Buff.RestEffectivenessBuff, amount)

func getBuffColor():
	if(amount < 0):
		return Color.red
	return Color.darkgray

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
