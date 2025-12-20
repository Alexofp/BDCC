extends Reference
class_name FluidProduction

var bodypart: WeakRef = null
var fluids: Fluids = Fluids.new()

func getFluids():
	return fluids

func transferAmountTo(otherFluids, howMuch):
	fluids.transferAmountTo(otherFluids, howMuch)

func getCapacity() -> float:
	return round(1000.0)

func getFluidAmount() -> float:
	return fluids.getFluidAmount()

func getFluidLevel() -> float:
	var capacity:float = getCapacity()
	if(capacity < 0.01):
		return 0.0
	
	return clamp(getFluidAmount() / capacity, 0.0, 1.0)

func drain(howmuch = 1.0) -> float:
	var fluidAmount = getFluidAmount()
	var result = getCapacity() * howmuch
	if(result > fluidAmount):
		result = fluidAmount
		
	return fluids.drain(result)

func afterMilked():
	pass

func getProductionSpeedPerHour() -> float:
	if(!shouldProduce()):
		return 0.0
	return getCapacity() / 10.0
	
func getFluidType():
	var character = getCharacter()
	if(character != null):
		var theFluidType:String = character.getCustomFluidType(getFluidSource())
		if(theFluidType != ""):
			return theFluidType
	
	var thebodypart = getBodypart()
	if(thebodypart != null && thebodypart.has_method("getFluidType")):
		return thebodypart.getFluidType(getFluidSource())
	return "Milk"

func getFluidSource():
	return FluidSource.Breasts

func shouldProduce():
	return true

func processTime(seconds: int):
	var character = getCharacter()
	if(character == null):
		return
	
	var minutesPassed: float = seconds / 60.0
	var hoursPassed: float = minutesPassed / 60.0

	var maxCapacity = getCapacity()
	var spaceLeft = maxCapacity - getFluidAmount()
	
	var productionSpeedPerHour = getProductionSpeedPerHour()
	var productionAdded = productionSpeedPerHour * hoursPassed
	
	if(productionAdded > 0.0):
		if(productionAdded > spaceLeft):
			productionAdded = spaceLeft
		fluids.addFluid(getFluidType(), productionAdded, character.getFluidDNA(getFluidSource()))
	
	if(productionAdded < 0.0):
		fluids.drain(abs(productionAdded))

func fillPercent(howMuch:float):
	var character = getCharacter()
	if(character == null):
		return
	var maxCapacity = getCapacity()
	var spaceLeft = maxCapacity - getFluidAmount()
	
	var toAdd = maxCapacity * howMuch
	
	if(toAdd > spaceLeft):
		toAdd = spaceLeft
	if(toAdd < 0.0):
		toAdd = 0.0
	fluids.addFluid(getFluidType(), toAdd, character.getFluidDNA(getFluidSource()))

func getBodypart():
	if(bodypart == null):
		return null
	return bodypart.get_ref()

func getCharacter():
	if(bodypart == null):
		return null
	var bodypartObject = getBodypart()
	return bodypartObject.getCharacter()

func setCauserID(_charID:String):
	fluids.setCauserID(_charID)

func saveData():
	var data = {
		"fluids": fluids.saveData(),
	}
	
	return data

func loadData(data):
	fluids.loadData(SAVE.loadVar(data, "fluids", {}))

func getTooltipInfo():
	var result = []
	result.append("Speed: "+ str(round(getProductionSpeedPerHour() * 10.0)/10.0)+" ml/hour")
	result.append("Contents:")
	
	if(!fluids.isEmpty()):
		result.append_array(fluids.getContentsHumanReadableArray())
	else:
		result.append("- Empty")
	return result

func getAttributesText():
	var result = [
		["Producing", BodilyFluids.getFluidName(getFluidType())],
		["Capacity", str(round(getFluidAmount() * 10.0)/10.0)+"/"+ str(round(getCapacity() * 10.0)/10.0)+" ml"],		
		["Production speed", str(round(getProductionSpeedPerHour() * 10.0)/10.0)+" ml/hour"],
		["Currently producing", str(shouldProduce())],
	]

	if(!fluids.isEmpty()):
		result.append(["Contents", ""])
		result.append_array(fluids.getContentsHumanReadablePairsArray())

	return result
