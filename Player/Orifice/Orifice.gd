extends Reference
class_name Orifice

var fluids: Fluids = Fluids.new()

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

func setLooseness(newlooseness:float):
	looseness = newlooseness

func getLooseness() -> float:
	return looseness

func isOrificeBlockedFromRecovering() -> bool:
	if(bodypart != null):
		var bodypartObject = bodypart.get_ref()
		var pc = bodypartObject.getCharacter()
		return pc.getOrificePreventedFromRecovering(orificeType)
	
	return false

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
			if(!isOrificeBlockedFromRecovering()):
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

func getFluids():
	return fluids

func addFluid(fluidType, amount: float, fluidDNA = null, causerID:String = ""):
	fluids.addFluid(fluidType, amount, fluidDNA, causerID)

func transferTo(otherOrifice, fraction = 0.5, minAmount = 0.0, causerID:String = ""):
	return fluids.transferTo(otherOrifice, fraction, minAmount, causerID)

func shareFluids(otherOrifice, fraction = 0.5, causerID:String = ""):
	return fluids.shareFluids(otherOrifice, fraction, causerID)

func hasFluidType(fluidType):
	return fluids.hasFluidType(fluidType)

func clear():
	fluids.clear()

func isEmpty():
	return fluids.isEmpty()

func getFluidAmount() -> float:
	return fluids.getFluidAmount()

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
	
	var obsorbResult = fluids.doDrainObsorb(howMuchToDrain, howMuchGotObsorbed)
	for obsorbEntry in obsorbResult:
		onObsorb(obsorbEntry)

func onObsorb(obsorbEntry):
	if(bodypart != null):
		var bodypartObject = bodypart.get_ref()
		var pc = bodypartObject.getCharacter()
		if(pc != null && pc.has_method("onFluidObsorb")):
			var fluidType = obsorbEntry["fluidType"]
			var amount = obsorbEntry["amount"]
			var fluidDNA = obsorbEntry["fluidDNA"]
			
			pc.onFluidObsorb(orificeType, fluidType, amount, fluidDNA)

func getFluidList():
	return fluids.getFluidList()

func getUniqueCharactersAmount():
	return fluids.getUniqueCharactersAmount()

func getContentsHumanReadableArray():
	return fluids.getContentsHumanReadableArray()

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
	var result = []
	
	result.append("capacity: " + str(round(getFluidAmount() * 10.0)/10.0)+"/"+ str(round(getCapacity() * 10.0)/10.0)+" ml")
	result.append("looseness level: " + str(round(getLooseness() * 10.0)/10.0)+", "+getLoosenessString())
	result.append("comfortable insertion: " + Util.cmToString(round(getComfortableInsertion() * 10.0)/10.0))
	if(!isEmpty()):
		result.append("Contents:")
		result.append_array(getContentsHumanReadableArray())
	return Util.join(result, "\n")

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

func setCauserID(_charID:String):
	fluids.setCauserID(_charID)

func saveData():
	var data = {
		"fluids": fluids.saveData(),
		"looseness": looseness,
	}
	
	return data

func loadData(data):
	fluids.loadData(SAVE.loadVar(data, "fluids", {}))
	looseness = SAVE.loadVar(data, "looseness", 0.0)
