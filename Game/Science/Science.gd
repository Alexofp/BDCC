extends Reference
class_name Science

var points:int = 0

var generatedTasks:bool = false
var nurseryTasks:Array = []

var storedFluids:Dictionary = {} # {FluidType = Amount}

func onNewDay():
	nurseryTasks.clear()
	generatedTasks = false

func generateNurseryTasks():
	nurseryTasks.clear()
	
	

func getNurseryTasks() -> Array:
	if(!generatedTasks):
		generateNurseryTasks()
		generatedTasks = true
		
	return nurseryTasks

func peekNurseryTasks() -> Array:
	return nurseryTasks

func removeNurseryTask(_task):
	if(nurseryTasks.has(_task)):
		nurseryTasks.erase(_task)

func addFluid(fluidID:String, amount:float):
	if(!storedFluids.has(fluidID)):
		storedFluids[fluidID] = 0.0

	storedFluids[fluidID] += amount

	if(storedFluids[fluidID] <= 0.0):
		storedFluids.erase(fluidID)

func getFluidAmount(fluidID:String) -> float:
	if(!storedFluids.has(fluidID)):
		return 0.0
	return storedFluids[fluidID]

func handleBountyFluid(_fluidType:String, _amount:float):
	pass

func addPoints(howMuch:int):
	points += howMuch

func getPoints() -> int:
	return points

func saveData() -> Dictionary:
	return {}

func loadData(_data:Dictionary):
	pass
