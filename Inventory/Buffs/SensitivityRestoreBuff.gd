extends BuffBase

var sensType = BuffAttribute.SensitivityRestoreAll
var amount = 0

func _init():
	id = Buff.SensitivityRestoreBuff

func initBuff(_args):
	if(_args.size() > 1):
		var bodypartSlot = _args[0]
		if(bodypartSlot == BodypartSlot.Penis):
			sensType = BuffAttribute.SensitivityRestorePenis
		elif(bodypartSlot == BodypartSlot.Breasts):
			sensType = BuffAttribute.SensitivityRestoreNipples
		elif(bodypartSlot == BodypartSlot.Vagina):
			sensType = BuffAttribute.SensitivityRestoreVagina
		elif(bodypartSlot == BodypartSlot.Anus):
			sensType = BuffAttribute.SensitivityRestoreAnus
		else:
			sensType = BuffAttribute.SensitivityRestoreAll
		
		amount = _args[1]
	else:
		sensType = BuffAttribute.SensitivityRestoreAll
		amount = _args[0]

func getVisibleDescription():
	var text = str(amount)
	if(amount > 0):
		text = "+"+text
	
	var theText := "Sensitivity restore"
	if(sensType == BuffAttribute.SensitivityRestorePenis):
		theText = "Penis sensitivity restore"
	elif(sensType == BuffAttribute.SensitivityRestoreNipples):
		theText = "Nipples sensitivity restore"
	elif(sensType == BuffAttribute.SensitivityRestoreVagina):
		theText = "Pussy sensitivity restore"
	elif(sensType == BuffAttribute.SensitivityRestoreAnus):
		theText = "Anus sensitivity restore"
		
	return theText+" "+text+"%"

func apply(_buffHolder):
	_buffHolder.addCustom(sensType, amount/100.0)

func getBuffColor():
	if(amount < 0):
		return Color.red
	return Color.greenyellow

func saveData():
	var data = .saveData()
	
	data["sensType"] = sensType
	data["amount"] = amount

	return data
	
func loadData(_data):
	.loadData(_data)
	sensType = SAVE.loadVar(_data, "sensType", BuffAttribute.SensitivityRestoreAll)
	amount = SAVE.loadVar(_data, "amount", 0)

func canCombine(_otherBuff):
	if(_otherBuff.sensType != sensType):
		return false
	return true

func combine(_otherBuff):
	amount += _otherBuff.amount
