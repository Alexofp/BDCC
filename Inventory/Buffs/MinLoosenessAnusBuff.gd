extends BuffBase

var amount = 0

func _init():
	id = Buff.MinLoosenessAnusBuff

func initBuff(_args):
	amount = _args[0]

func getVisibleDescription():
	if(amount >= 15.0):
		return "Stretches anus greatly"
	return "Keeps butt stretched"

func apply(_buffHolder):
	_buffHolder.orificeMinLooseness[OrificeType.Anus] += amount

func getBuffColor():
	return DamageType.getColor(DamageType.Lust)

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
