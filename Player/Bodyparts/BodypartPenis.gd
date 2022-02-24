extends Bodypart
class_name BodypartPenis

var lengthCM = 15

func _init():
	limbSlot = LimbTypes.Penis

func getSlot():
	return BodypartSlot.Penis

func getTooltipInfo():
	return "length: " + str(lengthCM) + " cm\n" + "Gonna be more stuff here"

func saveData():
	return {
		"lengthCM": lengthCM,
	}

func loadData(_data):
	lengthCM = SAVE.loadVar(_data, "lengthCM", 15)

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
				[15, "15 cm", "Pick this length"],
				[18, "18 cm", "Pick this length"],
				[22, "22 cm", "Pick this length"],
				[25, "25 cm", "Pick this length"],
				[30, "30 cm", "Pick this length"],
				[40, "40 cm", "Pick this length"],
				[50, "50 cm", "Pick this length"],
			]
		}
	}
	
func applyAttribute(_attrID: String, _attrValue):
	if(_attrID == "cocksize"):
		lengthCM = _attrValue

func getAttributesText():
	return [
		["Penis length", str(lengthCM)+" cm"],
	]
