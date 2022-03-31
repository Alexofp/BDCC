extends Reference
class_name Orifice

# Everything is in milliliters

var contents = []
var dirtyFlag = true
var cachedFluidsAmount = 0

var looseness: float = 0.0

var bodypart: WeakRef = null
var isGenital = true
var orificeType = OrificeType.Vagina

func getCapacity() -> float:
	return round(1000.0 + 500.0 * looseness)

func getBaseElasticity() -> float:
	return 1.0

func getBaseResistance() -> float:
	return 1.0

func getElasticity() -> float:
	var value = getBaseElasticity()
	if(isGenital && bodypart != null):
		var bodypartObject = bodypart.get_ref()
		var pc = bodypartObject.getCharacter()
		value += pc.getGenitalElasticity()
	
	if(value < 0.01):
		return 0.01
	return value

func getResistance() -> float:
	var value = getBaseResistance()
	
	if(isGenital && bodypart != null):
		var bodypartObject = bodypart.get_ref()
		var pc = bodypartObject.getCharacter()
		value += pc.getGenitalResistance()
	
	if(value < 0.01):
		return 0.01
	return value

func getLooseness() -> float:
	return looseness

func getMinLooseness() -> float:
	var value = 0.0
	
	if(bodypart != null):
		var bodypartObject = bodypart.get_ref()
		var pc = bodypartObject.getCharacter()
		value += pc.getOrificeMinLooseness(orificeType)
	
	return value
 
static func loosenessToString(value):
	if(value <= 0.1):
		return "very tight"
	if(value <= 1.1):
		return "tight"
	if(value <= 2.5):
		return "nice and pretty"
	if(value <= 5.5):
		return "slightly loose"
	if(value <= 9.5):
		return "loose"
	if(value <= 20.5):
		return "very used"
	if(value <= 50.5):
		return "stretched wide"
	return "gaping wide"

func getLoosenessString():
	return loosenessToString(looseness)

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
	var minLoose = getMinLooseness()
	
	if(abs(looseness - minLoose) <= 0.001):
		looseness = minLoose
		return
	
	var elast = getElasticity()
	for _i in range(_howmuch):
		var rem = pow(abs(looseness - minLoose), 0.1) / 50.0
		if(rem < 0.005):
			rem = 0.005
		if(rem > abs(looseness - minLoose)):
			rem = abs(looseness - minLoose)
			
		if(looseness > minLoose):
			looseness -= rem * elast
		elif(looseness < minLoose):
			looseness += rem / elast
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

func getAttributesText():
	return [
		["Capacity", str(round(getFluidAmount() * 10.0)/10.0)+"/"+ str(round(getCapacity() * 10.0)/10.0)+" ml"],		
		["Looseness level", str(round(getLooseness() * 10.0)/10.0)+", "+getLoosenessString()],
		["Looseness level minimal", str(round(getMinLooseness() * 10.0)/10.0)],
		["Elasticity", str(round(getElasticity() * 1000.0)/10.0)+"%"],
		["Tightness", str(round(getResistance() * 1000.0)/10.0)+"%"],
	]

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
