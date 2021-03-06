extends FluidProduction
class_name Lactation

var lactationTimer = 0
var lactationProgress = 0.0

func induceLactation():
	lactationTimer = Util.maxi(lactationTimer, 60*60*24*7)

func afterMilked():
	# if we're not lactating milking will make us lactate with 10% chance
	if(!shouldProduce()):
		if(RNG.chance(90)):
			return
	
	lactationTimer = Util.maxi(lactationTimer, 60*60*24*2)

func stimulate():
	lactationProgress += RNG.randf_range(0.01, 0.02)
	if(lactationProgress > 0.5 && RNG.chance(lactationProgress * 10.0)):
		if(!shouldProduce()):
			induceLactation()
			return true
		else:
			afterMilked()
	return false

func shouldProduce():
	return lactationTimer > 0 # or isPregnant()

func getCapacity() -> float:
	var breasts = getBodypart()
	var size = breasts.getSize()
	if(size == BreastsSize.FOREVER_FLAT):
		return 0.0
	
	return round(0.0 + size*size*100.0)

func processTime(seconds: int):
	.processTime(seconds)
	
	var pc = getCharacter()
	if(pc != null):
		if(pc.getPregnancyProgress() >= 0.33):
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
	return getCapacity() / 30.0

func saveData():
	var data = .saveData()
	data["lactationTimer"] = lactationTimer
	data["lactationProgress"] = lactationProgress
	
	return data

func loadData(_data):
	lactationTimer = SAVE.loadVar(_data, "lactationTimer", 0)
	lactationProgress = SAVE.loadVar(_data, "lactationProgress", 0.0)
	
	.loadData(_data)
