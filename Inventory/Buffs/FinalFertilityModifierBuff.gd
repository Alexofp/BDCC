extends BuffBase

var amount = 0
var displayAmount = 0

func _init():
	id = Buff.FinalFertilityModifierBuff

func initBuff(_args):
	amount = _args[0]
	displayAmount = amount
	
func getVisibleDescription():
	var text = str(Util.roundF(displayAmount, 1))
	if(amount > 0):
		text = "+"+text
	return "Fertility Modifier "+text+"%"

func apply(_buffHolder):
	var modifier = 1.0
	if(_buffHolder.getCharacter().hasPerk(Perk.FertilityBroodmother) && amount < 0):
		modifier = 0.3
	_buffHolder.addCustom(BuffAttribute.FinalFertilityModifier, amount/100.0 * modifier)
	displayAmount = amount * modifier

func getBuffColor():
	if(amount < 0):
		return Color.red
	return DamageType.getColor(DamageType.Lust)

func saveData():
	var data = .saveData()
	data = {
		"amount": amount,
		}
	
	return data

func loadData(_data):
	.loadData(_data)
	amount = SAVE.loadVar(_data, "amount", 0)
	displayAmount = amount

func combine(_otherBuff):
	if(_otherBuff.amount > amount):
		amount = _otherBuff.amount
		displayAmount = amount
