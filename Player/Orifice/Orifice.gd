extends Reference
class_name Orifice

# Everything is in milliliters

var contents = []
var dirtyFlag = true
var cachedFluidsAmount: float = 0.0

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
	if(value <= 0.5):
		return "tight"
	if(value <= 1.1):
		return "nice and pretty"
	if(value <= 2.2):
		return "slightly loose"
	if(value <= 4.5):
		return "loose"
	if(value <= 7.5):
		return "very used"
	if(value <= 12.0):
		return "stretched wide"
	return "gaping wide"

func getLoosenessString():
	return loosenessToString(looseness)

func getComfortableInsertion() -> float:
	return 10.0 + pow(looseness, 2.0)

func handleInsertion(size: float, stretchMult = 1.0):
	var comfortable = getComfortableInsertion()
	
	var diff = size - comfortable
	if(diff <= -10.0):
		return
	
	var add = pow(diff + 10.0, 0.5) / getResistance() / 5.0
	if(diff > 0):
		add += pow(diff, 0.5) / getResistance() / 2.0
	
	looseness += add / 10.0 * stretchMult

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

# How much fluids get naturally obsorbed every hour
func getNaturalDrain() -> float:
	return 5.0

# How much leaks out naturally
func getNaturalSpill() -> float:
	return 1.0

func getOverstuffedSpill() -> float:
	return 20.0

func isClosedOff():
	if(bodypart == null || bodypart.get_ref().character == null):
		return false
	var character = bodypart.get_ref().getCharacter()
	if(character.getOrificeBlocked(orificeType)):
		return true
	return false

func getCurrentNaturalSpill() -> float:
	if(!isClosedOff()):
		return getNaturalDrain() + getNaturalSpill()
	
	return getNaturalDrain()
	
func addFluid(fluidType, amount: float, charID = null, virility = -100.0):
	if(amount <= 0.0):
		return
	
	if(charID != null && virility < -99.0):
		var character = GlobalRegistry.getCharacter(charID)
		if(character != null):
			virility = character.getVirility()
	else:
		virility = 1.0
	
	for contentData in contents:
		if(fluidType == contentData[0] && charID == contentData[2]):
			contentData[1] += amount
			contentData[3] = max(contentData[3], virility)
			dirtyFlag = true
			return
	
	contents.append([fluidType, amount, charID, virility])
	dirtyFlag = true

func transferTo(otherOrifice: Orifice, fraction = 0.5, minAmount = 0.0):
	if(minAmount > 0.0 && getFluidAmount() > 0.0):
		fraction = max(fraction, min(1.0, minAmount/getFluidAmount()))
	
	var result = false
	for contentData in contents:
		var amountToTransfer = contentData[1] * fraction
		contentData[1] -= amountToTransfer
		
		result = true
		otherOrifice.addFluid(contentData[0], amountToTransfer, contentData[2], contentData[3])
	removeEmptyInternalEntries()
	dirtyFlag = true
	return result

func shareFluids(otherOrifice: Orifice, fraction = 0.5):
	var result = false
	var ourFluids = []
	var theirFluids = []
	
	for contentData in contents:
		var amountToTransfer = contentData[1] * fraction
		contentData[1] -= amountToTransfer
		ourFluids.append([contentData[0], amountToTransfer, contentData[2], contentData[3]])
		result = true
	
	for contentData in otherOrifice.contents:
		var amountToTransfer = contentData[1] * fraction
		contentData[1] -= amountToTransfer
		theirFluids.append([contentData[0], amountToTransfer, contentData[2], contentData[3]])
		result = true
		
	for fluidsToAdd in ourFluids:
		otherOrifice.addFluid(fluidsToAdd[0], fluidsToAdd[1], fluidsToAdd[2], fluidsToAdd[3])
	for fluidsToAdd in theirFluids:
		addFluid(fluidsToAdd[0], fluidsToAdd[1], fluidsToAdd[2], fluidsToAdd[3])
	removeEmptyInternalEntries()
	otherOrifice.removeEmptyInternalEntries()
	dirtyFlag = true
	otherOrifice.dirtyFlag = true
	return result

func removeEmptyInternalEntries():
	var newContents = []
	for fluidData in contents:
		if(fluidData[1] > 0):
			newContents.append(fluidData)

	contents = newContents

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
	
	var hoursPassed: float = seconds / 60.0 / 60.0
	var howMuchToDrain: float = 0.0

	var fluidAmount = float(getFluidAmount())
	var capacity = float(getCapacity())
	
	var howMuchGotObsorbed = min(getNaturalDrain() * hoursPassed, fluidAmount)
	
	var overspill = fluidAmount - capacity
	if(overspill <= 0 || isClosedOff()):
		howMuchToDrain = getCurrentNaturalSpill() * hoursPassed
	else:
		var howMuchHoursToSpillAll = overspill / getOverstuffedSpill()
		if(hoursPassed <= howMuchHoursToSpillAll):
			howMuchToDrain = getOverstuffedSpill() * hoursPassed
		else:
			howMuchToDrain = overspill + getCurrentNaturalSpill() * (hoursPassed - howMuchHoursToSpillAll)
	
	var newContents = []
	for fluidData in contents:
		var share: float = fluidData[1] / fluidAmount * RNG.randf_range(0.8, 1.1)
		var toRemove = share * howMuchToDrain
		var toObsorb = share * howMuchGotObsorbed
		if(fluidData[1] < 0.1):
			toRemove = fluidData[1]
		toRemove = clamp(toRemove, 0.0, fluidData[1])
		
		if(toObsorb > 0.0):
			onObsorb(fluidData[0], toObsorb, fluidData[2], fluidData[3])
		
		fluidData[1] -= toRemove
		
		if(fluidData[1] > 0):
			newContents.append(fluidData)

	contents = newContents
	dirtyFlag = true

func onObsorb(cumType, howMuch, who, virility):
	if(bodypart != null):
		var bodypartObject = bodypart.get_ref()
		var pc = bodypartObject.getCharacter()
		if(pc != null && pc.has_method("onFluidObsorb")):
			pc.onFluidObsorb(orificeType, cumType, howMuch, who, virility)

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
		["Comfortable insertion", Util.cmToString(round(getComfortableInsertion() * 10.0)/10.0)],
		["Elasticity", str(round(getElasticity() * 1000.0)/10.0)+"%"],
		["Tightness", str(round(getResistance() * 1000.0)/10.0)+"%"],
	]

func getTooltipInfo():
	var text = "capacity: " + str(round(getFluidAmount() * 10.0)/10.0)+"/"+ str(round(getCapacity() * 10.0)/10.0)+" ml\n"
	text += "looseness level: " + str(round(getLooseness() * 10.0)/10.0)+", "+getLoosenessString() + "\n"
	text += "comfortable insertion: " + Util.cmToString(round(getComfortableInsertion() * 10.0)/10.0)
	return text

func generateDataFor(_dynamicCharacter):
	if(bodypart == null || bodypart.get_ref().character == null):
		return
	var character = bodypart.get_ref().getCharacter()
	var fetishHolder:FetishHolder = character.getFetishHolder()
	if(fetishHolder == null):
		return
	
	looseness = max(0.0, RNG.randf_range(-0.1, 0.3))
	
	if(orificeType == OrificeType.Vagina):
		var fetishValue = fetishHolder.getFetishValue(Fetish.VaginalSexReceiving)
		if(fetishValue > 0.0):
			looseness = RNG.randf_range(0.0, fetishValue*5.0)
	if(orificeType == OrificeType.Anus):
		var fetishValue = fetishHolder.getFetishValue(Fetish.AnalSexReceiving)
		if(fetishValue > 0.0):
			looseness = RNG.randf_range(0.0, fetishValue*5.0)
	if(orificeType == OrificeType.Throat):
		var fetishValue = fetishHolder.getFetishValue(Fetish.OralSexGiving)
		if(fetishValue > 0.0):
			looseness = RNG.randf_range(0.0, fetishValue*5.0)

func saveData():
	var data = {
		"contents": contents,
		"looseness": looseness,
	}
	
	return data

func loadData(data):
	contents = SAVE.loadVar(data, "contents", [])
	for conData in contents:
		# Adding virility if it's missing
		if(conData.size() == 3):
			conData.append(1.0)
	
	looseness = SAVE.loadVar(data, "looseness", 0.0)
	dirtyFlag = true
