extends Bodypart
class_name BodypartPenis

var lengthCM = 15
var ballsScale: float = 1.0

func _init():
	limbSlot = LimbTypes.Penis
	fluidProduction = CumProduction.new()
	fluidProduction.bodypart = weakref(self)
	needsProcessing = true

func getSlot():
	return BodypartSlot.Penis

func getTooltipInfo():
	var text = "length: " + str(lengthCM) + " cm\n"
	text += BodilyFluids.FluidType.getName(getFluidProduction().getFluidType())+": " + str(round(getFluidProduction().getFluidAmount() * 10.0)/10.0)+"/"+ str(round(getFluidProduction().getCapacity() * 10.0)/10.0)+" ml"
	return text

func saveData():
	var data = .saveData()
	data["lengthCM"] = lengthCM
	data["ballsScale"] = ballsScale
	
	return data

func loadData(_data):
	lengthCM = SAVE.loadVar(_data, "lengthCM", 15)
	ballsScale = SAVE.loadVar(_data, "ballsScale", 1.0)
	
	.loadData(_data)

func getLewdSizeAdjective():
	if(lengthCM <= 5.0):
		return RNG.pick(["tiny", "minuscule"])
	if(lengthCM <= 9.0):
		return RNG.pick(["small", "little", "short"])
	if(lengthCM <= 14.0):
		return RNG.pick(["average", "average-sized", "fair-sized"])
	if(lengthCM <= 21.0):
		return RNG.pick(["impressive", "lengthy", "large"])
	if(lengthCM <= 31.0):
		return RNG.pick(["massive", "enormous", "giant"])
	if(lengthCM <= 51.0):
		return RNG.pick(["hyper-sized", "monstrous", "colossal", "massive"])
	
	return RNG.pick(["hyper-sized", "gigantic", "monumental", "colossal", "massive"])

func getLewdAdjective():
	return RNG.pick(["human"])
	
func getLewdName():
	return RNG.pick(["cock", "cock", "dick", "dick", "member", "shaft"])

func getPickableAttributes():
	return {
		"cocksize": {
			"text": "Pick your cock's length",
			"textButton": "Length",
			"buttonDesc": "Pick the cock's length",
			"options": [
				[5, "5 cm", "Pick this length"],
				[8, "8 cm", "Pick this length"],
				[10, "10 cm", "Pick this length"],
				[13, "13 cm", "Pick this length"],
				[15, "15 cm", "Pick this length"],
				[18, "18 cm", "Pick this length"],
				[22, "22 cm", "Pick this length"],
				[25, "25 cm", "Pick this length"],
				[30, "30 cm", "Pick this length"],
				[40, "40 cm", "Pick this length"],
				[50, "50 cm", "Pick this length"],
			]
		},
		"ballsscale": {
			"text": "Pick your balls scale",
			"textButton": "Balls",
			"buttonDesc": "Pick the cock's balls scale",
			"options": [
				[0.0, "0%", "Pick this scale"],
				[0.3, "20%", "Pick this scale"],
				[0.5, "50%", "Pick this scale"],
				[0.8, "80%", "Pick this scale"],
				[1.0, "100%", "Pick this scale"],
				[1.2, "120%", "Pick this scale"],
				[1.5, "150%", "Pick this scale"],
				[1.8, "180%", "Pick this scale"],
				[2.0, "200%", "Pick this scale"],
				[2.5, "250%", "Pick this scale"],
				[3.0, "300%", "Pick this scale"],
				[4.0, "400%", "Pick this scale"],
				[5.0, "500%", "Pick this scale"],
			]
		}
	}
	
func applyAttribute(_attrID: String, _attrValue):
	if(_attrID == "cocksize"):
		lengthCM = _attrValue
	if(_attrID == "ballsscale"):
		ballsScale = _attrValue

func getAttributesText():
	return [
		["Penis length", str(lengthCM)+" cm"],
		["Balls scale", str(Util.roundF(ballsScale*100.0, 1))+"%"],
	]

func getLength():
	return lengthCM

func safeWhenExposed():
	return false

func getPenisScale():
	return max(0.5 + (lengthCM - 5.0) / 26.0, 0.5)

func getBallsScale():
	return ballsScale
