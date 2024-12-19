extends BuffBase

var sensType = BuffAttribute.OverstimulationThresholdAll
var amount = 0

func _init():
	id = Buff.OverstimulationThresholdBuff

func initBuff(_args):
	if(_args.size() > 1):
		var bodypartSlot = _args[0]
		if(bodypartSlot == BodypartSlot.Penis):
			sensType = BuffAttribute.OverstimulationThresholdPenis
		elif(bodypartSlot == BodypartSlot.Breasts):
			sensType = BuffAttribute.OverstimulationThresholdNipples
		elif(bodypartSlot == BodypartSlot.Vagina):
			sensType = BuffAttribute.OverstimulationThresholdVagina
		elif(bodypartSlot == BodypartSlot.Anus):
			sensType = BuffAttribute.OverstimulationThresholdAnus
		else:
			sensType = BuffAttribute.OverstimulationThresholdAll
		
		amount = _args[1]
	else:
		sensType = BuffAttribute.OverstimulationThresholdAll
		amount = _args[0]

func getVisibleDescription():
	var text = str(amount)
	if(amount > 0):
		text = "+"+text
	
	var theText := "Overstimulation threshold"
	if(sensType == BuffAttribute.OverstimulationThresholdPenis):
		theText = "Penis overstimulation threshold"
	elif(sensType == BuffAttribute.OverstimulationThresholdNipples):
		theText = "Nipples overstimulation threshold"
	elif(sensType == BuffAttribute.OverstimulationThresholdVagina):
		theText = "Pussy overstimulation threshold"
	elif(sensType == BuffAttribute.OverstimulationThresholdAnus):
		theText = "Anus overstimulation threshold"
		
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
	sensType = SAVE.loadVar(_data, "sensType", BuffAttribute.OverstimulationThresholdAll)
	amount = SAVE.loadVar(_data, "amount", 0)

func canCombine(_otherBuff):
	if(_otherBuff.sensType != sensType):
		return false
	return true

func combine(_otherBuff):
	amount += _otherBuff.amount
