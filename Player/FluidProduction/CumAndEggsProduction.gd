extends CumProduction

var eggs:int = 0
var eggProgress:float = 0.0

var maxEggs:int = 5
var eggsPerHour:float = 1.0

# Eggs stuff
func getEggsAmount() -> int:
	return eggs

func getMaxEggsCapacity() -> int:
	return maxEggs

func canProduceEggs() -> bool:
	return true

func getEggProductionSpeed() -> float:
	return eggsPerHour / 3600.0

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
