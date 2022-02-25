extends Reference
class_name Orifice

# Everything is in milliliters

var contents = []
var dirtyFlag = true
var cachedFluidsAmount = 0

func getCapacity() -> float:
	return 2000.0

# How much fluids get naturally obsorbed every minute
func getNaturalDrain() -> float:
	return 1.0

func getOverstuffedSpill() -> float:
	return 10.0
	
func addFluid(fluidType, amount: float, charID = null):
	contents.append([fluidType, amount, charID])
	dirtyFlag = true

func hasFluidType(fluidType):
	for fluidData in contents:
		if(fluidData[0] == fluidType):
			return true
	return false

func clear():
	contents.clear()
	dirtyFlag = true

func isEmpty():
	return contents.empty()

func getFluidAmount() -> float:
	if(!dirtyFlag):
		return cachedFluidsAmount
	
	var res = 0.0
	for fluidData in contents:
		res += fluidData[1]
	
	cachedFluidsAmount = res
	dirtyFlag = false
	
	return res

func getStuffedLevel() -> float:
	var fluidAmount = getFluidAmount()
	var capacity = getCapacity()
	if(capacity <= 0):
		return 0.0
	
	return fluidAmount / capacity

func processTime(seconds: int):
	if(isEmpty()):
		return
	
	var minutesPassed: float = seconds / 60.0
	var howMuchToDrain = 0.0

	var fluidAmount = getFluidAmount()
	var capacity = getCapacity()
	
	var overspill = fluidAmount - capacity
	if(overspill <= 0):
		howMuchToDrain = getNaturalDrain() * minutesPassed
	else:
		var howMuchMinutesToSpillAll = overspill / getOverstuffedSpill()
		if(minutesPassed <= howMuchMinutesToSpillAll):
			howMuchToDrain = getOverstuffedSpill() * minutesPassed
		else:
			howMuchToDrain = overspill + getNaturalDrain() * (minutesPassed - howMuchMinutesToSpillAll)
	
	var newContents = []
	for fluidData in contents:
		var share = fluidData[1] / fluidAmount
		var toRemove = share * howMuchToDrain
		
		fluidData[1] -= toRemove
		if(fluidData[1] > 0):
			newContents.append(fluidData)

	contents = newContents
	dirtyFlag = true

func getFluidList():
	var myfluids = []
	for fluidData in contents:
		if(!myfluids.has(fluidData[0])):
			myfluids.append(fluidData[0])
	return myfluids

func saveData():
	var data = {
		"contents": contents,
	}
	
	return data

func loadData(data):
	contents = SAVE.loadVar(data, "contents", [])
	dirtyFlag = true
