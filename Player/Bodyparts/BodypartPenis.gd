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
	var result = []
	result.append("length: " + Util.cmToString(lengthCM))
	if(getFluidProduction() != null):
		result.append("Capacity: " + str(round(getFluidProduction().getFluidAmount() * 10.0)/10.0)+"/"+ str(round(getFluidProduction().getCapacity() * 10.0)/10.0)+" ml")
		result.append_array(getFluidProduction().getTooltipInfo())
	var theChar = getCharacter()
	if(GM.pc != null && GM.pc.hasPerk(Perk.BreedExtraTooltipInfo) && theChar != null):
		result.append("Virility: "+str(Util.roundF(theChar.getVirility()*100.0, 1))+"%")
	
	return Util.join(result, "\n")

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
	var theCharacter = getCharacter()
	if(theCharacter != null && theCharacter.isWearingChastityCage()):
		return RNG.pick(["caged up", "locked away"])
	
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
	var result = .getPickableAttributes()
	result["cocksize"] = {
		"text": "Pick your cock's length",
		"textButton": "Length",
		"buttonDesc": "Pick the cock's length",
		"options": [
			[5, Util.cmToString(5), "Pick this length"],
			[8, Util.cmToString(8), "Pick this length"],
			[10, Util.cmToString(10), "Pick this length"],
			[13, Util.cmToString(13), "Pick this length"],
			[15, Util.cmToString(15), "Pick this length"],
			[18, Util.cmToString(18), "Pick this length"],
			[22, Util.cmToString(22), "Pick this length"],
			[25, Util.cmToString(25), "Pick this length"],
			[30, Util.cmToString(30), "Pick this length"],
			[40, Util.cmToString(40), "Pick this length"],
			[50, Util.cmToString(50), "Pick this length"],
		]
	}
	result["ballsscale"] = {
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
	return result
	
func applyAttribute(_attrID: String, _attrValue):
	.applyAttribute(_attrID, _attrValue)
	if(_attrID == "cocksize"):
		lengthCM = _attrValue
	if(_attrID == "ballsscale"):
		ballsScale = _attrValue

func getAttributesText():
	return [
		["Penis length", Util.cmToString(lengthCM)],
		["Balls scale", str(Util.roundF(ballsScale*100.0, 1))+"%"],
	]
	
func getCharCreatorData():
	return [
		["lengthCM", lengthCM],
		["ballsScale", ballsScale],
	]

func getLength():
	return lengthCM

func safeWhenExposed():
	return false

func getPenisScale():
	return max(0.5 + (lengthCM - 5.0) / 26.0, 0.5)

func getBallsScale():
	return ballsScale

func getRevealMessage():
	return Util.capitalizeFirstLetter(getLewdDescriptionAndName()) + " got revealed."

func generateDataFor(_dynamicCharacter):
	lengthCM = RNG.randf_range(10.0, 25.0)
	if(RNG.chance(5)):
		lengthCM = RNG.randf_range(5.0, 10.0)
	if(RNG.chance(5)):
		lengthCM = RNG.randf_range(25.0, 30.0)
	lengthCM = Util.roundF(lengthCM, 1)
	
	if(fluidProduction != null):
		fluidProduction.fillPercent(min(1.0, RNG.randf_range(0.8, 1.2)))
	generateRandomColors(_dynamicCharacter)

func hasCustomSkinPattern():
	return true

func generateRandomColors(_dynamicCharacter):
	var theHue = RNG.randf_range(0.0, 0.1)
	if(_dynamicCharacter != null):
		theHue = _dynamicCharacter.pickedSkinRColor.h
	if(RNG.chance(30)):
		pickedGColor = Color.from_hsv(RNG.randf_rangeX2(-0.1, 0.1), RNG.randf_range(0.7, 0.9), RNG.randf_range(0.5, 0.9))
		pickedBColor = pickedGColor
		pickedBColor.v = RNG.randf_rangeX2(0.3, 0.6)
	elif(RNG.chance(30) && _dynamicCharacter!=null):
		pickedGColor = RNG.pick([_dynamicCharacter.pickedSkinRColor, _dynamicCharacter.pickedSkinGColor, _dynamicCharacter.pickedSkinBColor])
		pickedGColor.h += RNG.randf_rangeX2(-0.1, 0.1)
		pickedGColor.s = RNG.randf_range(0.7, 0.9)
		pickedGColor.v = RNG.randf_range(0.7, 0.9)
		pickedBColor = pickedGColor
		pickedBColor.v = RNG.randf_rangeX2(0.3, 0.6)
	else:
		pickedGColor = ColorUtils.generateRandomVibrantColor()
		pickedBColor = pickedGColor
		pickedBColor.v = RNG.randf_rangeX2(0.3, 0.6)

	if(RNG.chance(30)):
		pickedGColor = Color.from_hsv(theHue, RNG.randf_range(0.3, 0.6), RNG.randf_rangeX2(0.1, 0.3))
		pickedBColor.v = RNG.randf_rangeX2(0.7, 0.95)
		pickedBColor.s = RNG.randf_rangeX2(0.7, 0.95)
