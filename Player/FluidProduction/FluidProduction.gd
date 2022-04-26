extends Reference
class_name FluidProduction

var bodypart: WeakRef = null
var fluidAmount = 0.0

func getCapacity() -> float:
	return round(1000.0)

func getFluidAmount() -> float:
	return fluidAmount

func drain(howmuch = 1.0) -> float:
	var result = fluidAmount * howmuch
	fluidAmount = fluidAmount * (1.0 - howmuch)
	if(fluidAmount < 0.001):
		fluidAmount= 0.0
	return result

func afterMilked():
	pass

func getProductionSpeedPerHour() -> float:
	if(!shouldProduce()):
		return 0.0
	return getCapacity() / 10.0
	
func getFluidType():
	return BodilyFluids.FluidType.Milk

func shouldProduce():
	return true

func processTime(seconds: int):
	var minutesPassed: float = seconds / 60.0
	var hoursPassed: float = minutesPassed / 60.0

	fluidAmount += getProductionSpeedPerHour() * hoursPassed
	var maxCapacity = getCapacity()
	if(fluidAmount > maxCapacity):
		fluidAmount = maxCapacity
	if(fluidAmount < 0.0):
		fluidAmount = 0.0

func getBodypart():
	return bodypart.get_ref()

func saveData():
	var data = {
		"fluidAmount": fluidAmount,
	}
	
	return data

func loadData(data):
	fluidAmount = SAVE.loadVar(data, "fluidAmount", 0.0)

func getAttributesText():
	return [
		["Producing", BodilyFluids.FluidType.getName(getFluidType())],
		["Capacity", str(round(getFluidAmount() * 10.0)/10.0)+"/"+ str(round(getCapacity() * 10.0)/10.0)+" ml"],		
		["Production speed", str(round(getProductionSpeedPerHour() * 10.0)/10.0)+" ml/hour"],
		["Currently producing", str(shouldProduce())],
	]
