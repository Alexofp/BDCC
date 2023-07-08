extends BuffBase

var statusEffect = ""
var amount = 0

func _init():
	id = Buff.StatusEffectImmunityBuff

func initBuff(_args):
	statusEffect = _args[0]
	amount = _args[1]

func getVisibleDescription():
	var text = str(amount)
	if(amount > 0):
		text = "+"+text
	
	var statusEffectObj:StatusEffectBase = GlobalRegistry.getStatusEffectRef(statusEffect)
		
	return "'"+statusEffectObj.getEffectName()+"' immunity "+text+"%"

func apply(_buffHolder):
	if(!_buffHolder.statusEffectImmunity.has(statusEffect)):
		_buffHolder.statusEffectImmunity[statusEffect] = 0.0
	_buffHolder.statusEffectImmunity[statusEffect] += (amount/100.0)

func getBuffColor():
	if(amount < 0):
		return Color.red
	return Color.greenyellow

func saveData():
	var data = .saveData()
	
	data["statusEffect"] = statusEffect
	data["amount"] = amount

	return data
	
func loadData(_data):
	.loadData(_data)
	statusEffect = SAVE.loadVar(_data, "statusEffect", "")
	amount = SAVE.loadVar(_data, "amount", 0)

func canCombine(_otherBuff):
	if(_otherBuff.statusEffect != statusEffect):
		return false
	return true

func combine(_otherBuff):
	if(_otherBuff.amount > amount):
		amount = _otherBuff.amount
