extends CumProduction

var eggs:int = 0
var eggProgress:float = 0.0

var maxEggs:int = 10
var eggsPerHour:float = 1.0

var eggsSlowStart:int = 5 # if eggs > eggsSlowStart, the production of eggs will start slowing down
var eggsPerHourSlow:float = 0.1

# Eggs stuff
func getEggsAmount() -> int:
	return eggs

func getMaxEggsCapacity() -> int:
	return maxEggs

func canProduceEggs() -> bool:
	return true

func getEggProductionSpeed() -> float:
	var theSpeed:float = eggsPerHour
	if(eggs > eggsSlowStart):
		var ratio:float = float(eggs - eggsSlowStart)/float(maxEggs - eggsSlowStart)
		ratio = clamp(ratio, 0.0, 1.0)
		
		theSpeed = eggsPerHour * (1.0 - ratio) + eggsPerHourSlow * ratio
		
	return theSpeed / 3600.0

func getNextEggProgress() -> float:
	return eggProgress

func processTime(seconds: int):
	.processTime(seconds)
	
	if(eggs >= maxEggs):
		eggProgress = 0.0
		return
		
	eggProgress += float(seconds)*getEggProductionSpeed()
	
	while(eggProgress >= 1.0):
		eggProgress -= 1.0
		
		if(eggs < maxEggs):
			eggs += 1
	
func useEgg() -> bool:
	if(eggs < 0):
		return false
	eggs -= 1
	return true

func boostEggProduction():
	eggs = maxEggs

func saveData():
	var data:Dictionary = .saveData()
	data["eggs"] = eggs
	#data["maxEggs"] = maxEggs # Set by the penis
	data["eggProgress"] = eggProgress
	#data["eggsPerHour"] = eggsPerHour
	
	return data

func loadData(data):
	.loadData(data)
	
	eggs = SAVE.loadVar(data, "eggs", 0)
	eggProgress = SAVE.loadVar(data, "eggProgress", 0.0)
