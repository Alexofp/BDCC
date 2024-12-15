extends BuffBase

var sensType = BuffAttribute.SensitivityGainAll
var amount = 0

func _init():
	id = Buff.SensitivityGainBuff

func initBuff(_args):
	if(_args.size() > 1):
		var bodypartSlot = _args[0]
		if(bodypartSlot == BodypartSlot.Penis):
			sensType = BuffAttribute.SensitivityGainPenis
		elif(bodypartSlot == BodypartSlot.Breasts):
			sensType = BuffAttribute.SensitivityGainNipples
		elif(bodypartSlot == BodypartSlot.Vagina):
			sensType = BuffAttribute.SensitivityGainVagina
		elif(bodypartSlot == BodypartSlot.Anus):
			sensType = BuffAttribute.SensitivityGainAnus
		else:
			sensType = BuffAttribute.SensitivityGainAll
		
		amount = _args[1]
	else:
		sensType = BuffAttribute.SensitivityGainAll
		amount = _args[0]

func getVisibleDescription():
	var text = str(amount)
	if(amount > 0):
		text = "+"+text
	
	var theText := "Sensitivity gain"
	if(sensType == BuffAttribute.SensitivityGainPenis):
		theText = "Penis sensitivity gain"
	elif(sensType == BuffAttribute.SensitivityGainNipples):
		theText = "Nipples sensitivity gain"
	elif(sensType == BuffAttribute.SensitivityGainVagina):
		theText = "Pussy sensitivity gain"
	elif(sensType == BuffAttribute.SensitivityGainAnus):
		theText = "Anus sensitivity gain"
		
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
	sensType = SAVE.loadVar(_data, "sensType", BuffAttribute.SensitivityGainAll)
	amount = SAVE.loadVar(_data, "amount", 0)

func canCombine(_otherBuff):
	if(_otherBuff.sensType != sensType):
		return false
	return true

func combine(_otherBuff):
	amount += _otherBuff.amount
