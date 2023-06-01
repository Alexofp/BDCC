extends BuffBase

var amount = 0
var startAmount = 0

func _init():
	id = Buff.FertilityBuff

func initBuff(_args):
	startAmount = _args[0]
	amount = startAmount
	
func getVisibleDescription():
	var text = str(amount)
	if(amount > 0):
		text = "+"+text
	return "Fertility "+text+"%"

func apply(_buffHolder):
	if(_buffHolder.getCharacter().hasPerk(Perk.FertilityBroodmother) && amount < 0):
		amount = startAmount * 0.3

	_buffHolder.extraFertility += (amount/100.0)
	
#	print("Character: ", _buffHolder.getCharacter(), " FinalFertility: ", _buffHolder.extraFertility)

func getBuffColor():
	if(amount < 0):
		return Color.red
	return DamageType.getColor(DamageType.Lust)

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
