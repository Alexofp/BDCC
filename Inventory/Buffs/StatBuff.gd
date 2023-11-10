extends BuffBase

var stat = Stat.Strength
var amount = 0

func _init():
	id = Buff.StatBuff

func initBuff(_args):
	stat = _args[0]
	amount = _args[1]

func getVisibleDescription():
	var text = str(amount)
	if(amount > 0):
		text = "+"+text
	
	var statObj:StatBase = GlobalRegistry.getStat(stat)
		
	return ""+statObj.getVisibleName()+" "+text

func apply(_buffHolder):
	if(!_buffHolder.extraStats.has(stat)):
		_buffHolder.extraStats[stat] = 0
	_buffHolder.extraStats[stat] += int(amount)

func getBuffColor():
	if(amount < 0):
		return Color.red
	return Color.greenyellow

func saveData():
	var data = .saveData()
	
	data["stat"] = stat
	data["amount"] = amount

	return data
	
func loadData(_data):
	.loadData(_data)
	stat = SAVE.loadVar(_data, "stat", "")
	amount = SAVE.loadVar(_data, "amount", 0)

func canCombine(_otherBuff):
	if(_otherBuff.stat != stat):
		return false
	return true

func combine(_otherBuff):
	amount += _otherBuff.amount
