extends Reference
class_name Orifice

# Everything is in milliliters

var contents = []
var dirtyFlag = true
var cachedFluidsAmount = 0

var looseness: float = 0.0

func getCapacity() -> float:
	return round(1000.0 + 500.0 * looseness)

func getElasticity() -> float:
	return 1.0

func getResistance() -> float:
	return 1.0

func getLooseness() -> float:
	return looseness

func getComfortableInsertion() -> float:
	return 10.0 + pow(looseness, 2.0)

func handleInsertion(size: float):
	var comfortable = getComfortableInsertion()
	
	if(size <= comfortable):
		return
	
	var diff = (size - comfortable)
	var add = pow(diff, 0.1) / getResistance()
	
	looseness += add

func hoursPassed(_howmuch):
	if(looseness <= 0.0):
		looseness = 0.0
		return
	
	var elast = getElasticity()
	for _i in range(_howmuch):
		var rem = pow(looseness, 0.1) * elast / 10.0
		if(rem < 0.05):
			rem = 0.05
		looseness -= rem
	if(looseness < 0.0):
		looseness = 0.0

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

func getUniqueCharactersAmount():
	var chars = {}
	
	for fluidData in contents:
		if(fluidData[2] != null):
			chars[fluidData[2]] = true
	
	return chars.keys().size()

func saveData():
	var data = {
		"contents": contents,
		"looseness": looseness,
	}
	
	return data

func loadData(data):
	contents = SAVE.loadVar(data, "contents", [])
	looseness = SAVE.loadVar(data, "looseness", 0.0)
	dirtyFlag = true
