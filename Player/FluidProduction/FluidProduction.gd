extends Reference
class_name FluidProduction

var bodypart: WeakRef = null
var fluidAmount = 0.0

func getCapacity() -> float:
	return round(1000.0)

func getFluidAmount() -> float:
	return fluidAmount

func getFluidLevel() -> float:
	var capacity:float = getCapacity()
	if(capacity < 0.01):
		return 0.0
	
	return clamp(getFluidAmount() / capacity, 0.0, 1.0)

func drain(howmuch = 1.0) -> float:
	var result = getCapacity() * howmuch
	if(result > fluidAmount):
		result = fluidAmount
		
	fluidAmount -= result
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

	var maxCapacity = getCapacity()
	fluidAmount += getProductionSpeedPerHour() * hoursPassed
	if(fluidAmount > maxCapacity):
		fluidAmount = maxCapacity
	if(fluidAmount < 0.0):
		fluidAmount = 0.0

func fillPercent(howMuch:float):
	var maxCapacity = getCapacity()
	fluidAmount += maxCapacity * howMuch
	if(fluidAmount > maxCapacity):
		fluidAmount = maxCapacity
	if(fluidAmount < 0.0):
		fluidAmount = 0.0

func getBodypart():
	return bodypart.get_ref()

func getCharacter():
	if(bodypart == null):
		return null
	var bodypartObject = getBodypart()
	return bodypartObject.getCharacter()

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
