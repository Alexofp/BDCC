extends FluidProduction
class_name Lactation

var lactationTimer = 0

func induceLactation():
	lactationTimer = Util.maxi(lactationTimer, 60*60*24*7)

func afterMilked():
	# if we're not lactating milking will make us lactate with 10% chance
	if(!shouldProduce()):
		if(RNG.chance(90)):
			return
	
	lactationTimer = Util.maxi(lactationTimer, 60*60*24*2)

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
	
	if(lactationTimer > 0):
		lactationTimer -= seconds
	if(lactationTimer < 0):
		lactationTimer = 0
		
func getProductionSpeedPerHour() -> float:
	if(!shouldProduce()):
		return -5.0
	return getCapacity() / 30.0

func saveData():
	var data = .saveData()
	data["lactationTimer"] = lactationTimer
	
	return data

func loadData(_data):
	lactationTimer = SAVE.loadVar(_data, "lactationTimer", 1000)
	
	.loadData(_data)
