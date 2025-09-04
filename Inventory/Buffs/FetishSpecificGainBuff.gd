extends BuffBase

var fetishID:String = ""
var amount = 0

func _init():
	id = Buff.FetishSpecificGainBuff

func initBuff(_args):
	fetishID = _args[0]
	amount = _args[1]

func getVisibleDescription():
	var text = str(amount)
	if(amount > 0):
		text = "+"+text
	
	var fetishObj:FetishBase = GlobalRegistry.getFetish(fetishID)
	if(!fetishObj):
		return "Error: "+str(fetishID)
	
	return "'"+fetishObj.getVisibleName()+"' gain "+text+"%"

func apply(_buffHolder):
	if(!_buffHolder.fetishGain.has(fetishID)):
		_buffHolder.fetishGain[fetishID] = 0.0
	_buffHolder.fetishGain[fetishID] += (amount/100.0)

func getBuffColor():
	if(amount < 0):
		return Color.red
	return Color.purple

func saveData():
	var data = .saveData()
	
	data["fetishID"] = fetishID
	data["amount"] = amount

	return data
	
func loadData(_data):
	.loadData(_data)
	fetishID = SAVE.loadVar(_data, "fetishID", "")
	amount = SAVE.loadVar(_data, "amount", 0)

func canCombine(_otherBuff):
	if(_otherBuff.fetishID != fetishID):
		return false
	return true

func combine(_otherBuff):
	if(_otherBuff.amount > amount):
		amount = _otherBuff.amount
