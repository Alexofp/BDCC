extends Bodypart
class_name BodypartPenis

var lengthCM = 15

func _init():
	limbSlot = LimbTypes.Penis

func getSlot():
	return BodypartSlot.Penis

func getTooltipInfo():
	return "length: " + str(lengthCM) + " cm\n" + "Gonna be more stuff here"

func getExtraInfoCreation():
	return "length: " + str(lengthCM)+" cm"

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
