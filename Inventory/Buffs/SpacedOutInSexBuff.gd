extends BuffBase

var amount = 0

func _init():
	id = Buff.SpacedOutInSexBuff

func initBuff(_args):
	amount = _args[0]

func getVisibleDescription():
	return "Unable to act or talk during sex"

func apply(_buffHolder):
	pass
	#_buffHolder.addCustom(BuffAttribute.ForcedObedience, amount/100.0)

func getBuffColor():
	return Color.red

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
