extends FluidProduction
class_name Lactation

var lactationTimer = 0
var lactationProgress = 0.0

func induceLactation():
	if(lactationTimer <= 0.0):
		fillPercent(RNG.randf_range(0.3, 0.5))
	lactationTimer = Util.maxi(lactationTimer, 60*60*24*7)

func afterMilked():
	# if we're not lactating milking will make us lactate with 10% chance
	if(!shouldProduce()):
		if(RNG.chance(90)):
			return
	
	lactationTimer = Util.maxi(lactationTimer, 60*60*24*2)

func stimulate():
	lactationProgress += RNG.randf_range(0.03, 0.10)
	if(lactationProgress > 0.3 && RNG.chance(lactationProgress * 10.0)):
		if(!shouldProduce()):
			induceLactation()
			return true
		else:
			afterMilked()
	return false

func shouldProduce():
	if(lactationTimer > 0):
		return true
	var theChar = getCharacter()
	if(theChar != null && theChar.hasBuff(Buff.BreastsForcedLactationBuff)):
		return true
	
	return false

func getCapacity() -> float:
	var breasts = getBodypart()
	var size = breasts.getSize()
	
	return getCapacityForSize(size)

func getCapacityForSize(size):
	if(size == BreastsSize.FOREVER_FLAT):
		return 0.0
	
	return BreastsSize.breastSizeToMilkAmount(size)*100.0#round(0.0 + size*size*100.0)

func getOptimalBreastsSize():
	var baseSize = getBodypart().getBaseSize()
	if(baseSize == BreastsSize.FOREVER_FLAT):
		return baseSize
	var fluidAmount = getFluidAmount()
	
	var maxAdditionalSize = 0
	if(shouldProduce()):
		maxAdditionalSize += 1
	
	var pc = getCharacter()
	if(pc != null):
		baseSize += pc.getCustomAttribute(BuffAttribute.BreastsSize)
		maxAdditionalSize += pc.getCustomAttribute(BuffAttribute.BreastsMaxLactatingSize)
	
	if(maxAdditionalSize <= 0):
		return Util.maxi(baseSize + maxAdditionalSize, BreastsSize.FLAT)
		
	for _i in range(0, maxAdditionalSize):
		var capacity = getCapacityForSize(baseSize + _i)
		if(capacity <= 0.0):
			continue
		var level = clamp(fluidAmount/capacity, 0.0, 1.0)
		if(level < 0.9):
			return baseSize + _i
	return baseSize + maxAdditionalSize

func getFluidLevelForOptimalSize() -> float:
	var maxSize = getBodypart().getBaseSize()
	if(maxSize != BreastsSize.FOREVER_FLAT):
		var pc = getCharacter()
		if(pc != null):
			maxSize += pc.getCustomAttribute(BuffAttribute.BreastsSize)
			maxSize += pc.getCustomAttribute(BuffAttribute.BreastsMaxLactatingSize)
			maxSize += 1
	
		
	var capacity:float = getCapacityForSize(maxSize)
	if(capacity < 0.01):
		return 0.0
	
	return clamp(getFluidAmount() / capacity, 0.0, 1.0)

func processTime(seconds: int):
	.processTime(seconds)
	
	var pc = getCharacter()
	if(pc != null):
		if(pc.getPregnancyProgress() >= 0.33 && lactationTimer < 60*60*24*10):
			lactationTimer += seconds * 3
	
	if(lactationTimer > 0):
		lactationTimer -= seconds
	if(lactationTimer < 0):
		lactationTimer = 0
	if(lactationProgress > 0.0):
		lactationProgress -= float(seconds)/float(60*60*24*5)
		if(lactationProgress <= 0.0):
			lactationProgress = 0.0
		
func getProductionSpeedPerHour() -> float:
	if(!shouldProduce()):
		return -5.0
		
	var mult = 1.0
		
	var pc = getCharacter()
	if(pc != null):
		mult += pc.getCustomAttribute(BuffAttribute.BreastsMilkProduction)
		
	return getCapacity() / 30.0 * mult

func getFluidSource():
	return FluidSource.Breasts

func saveData():
	var data = .saveData()
	data["lactationTimer"] = lactationTimer
	data["lactationProgress"] = lactationProgress
	
	return data

func loadData(_data):
	lactationTimer = SAVE.loadVar(_data, "lactationTimer", 0)
	lactationProgress = SAVE.loadVar(_data, "lactationProgress", 0.0)
	
	.loadData(_data)
