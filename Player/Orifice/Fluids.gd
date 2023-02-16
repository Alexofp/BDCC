extends Reference
class_name Fluids

# Everything is in milliliters
var contents = []
var dirtyFlag = false
var cachedFluidsAmount: float = 0.0

func addFluid(fluidType, amount: float, fluidDNA = null):
	if(amount <= 0.0):
		return
	
	if(fluidDNA == null):
		fluidDNA = FluidDNA.new()
	
	if(!(fluidDNA is FluidDNA)):
		assert(false, "Bad fluid dna")
	
	for contentData in contents:
		if(fluidType == contentData["fluidType"] && contentData["fluidDNA"].canCombineWith(fluidDNA)):
			contentData["amount"] += amount
			cachedFluidsAmount += amount
			return
	
	contents.append({
		"fluidType": fluidType,
		"amount": amount,
		"fluidDNA": fluidDNA,
	})
	cachedFluidsAmount += amount

func removeEmptyInternalEntries():
	cachedFluidsAmount = 0.0
	var newContents = []
	for fluidData in contents:
		if(fluidData["amount"] > 0):
			newContents.append(fluidData)
			cachedFluidsAmount += fluidData["amount"]

	contents = newContents

func hasFluidType(fluidType):
	for fluidData in contents:
		if(fluidData["fluidType"] == fluidType):
			return true
	return false

func clear():
	contents.clear()
	cachedFluidsAmount = 0.0
	dirtyFlag = false

func isEmpty():
	return contents.empty()

func getFluidAmount() -> float:
	if(!dirtyFlag):
		return cachedFluidsAmount
	
	var res = 0.0
	for fluidData in contents:
		res += fluidData["amount"]
	
	cachedFluidsAmount = res
	dirtyFlag = false
	
	return res

func isFluids():
	return true

func transferTo(otherFluids, fraction = 0.5, minAmount = 0.0):
	if(!otherFluids.has_method("isFluids")):
		if(otherFluids.has_method("getFluids")):
			otherFluids = otherFluids.getFluids()
		else:
			assert(false, "Bad fluids object")
	
	if(minAmount > 0.0 && getFluidAmount() > 0.0):
		fraction = max(fraction, min(1.0, minAmount/getFluidAmount()))
	
	var result = false
	for contentData in contents:
		var amountToTransfer = contentData["amount"] * fraction
		contentData["amount"] -= amountToTransfer
		
		result = true
		otherFluids.addFluid(contentData["fluidType"], amountToTransfer, contentData["fluidDNA"])
	removeEmptyInternalEntries()
	return result

func shareFluids(otherFluids, fraction = 0.5):
	if(!otherFluids.has_method("isFluids")):
		if(otherFluids.has_method("getFluids")):
			otherFluids = otherFluids.getFluids()
		else:
			assert(false, "Bad fluids object")
	
	var result = false
	var ourFluids = []
	var theirFluids = []
	
	for contentData in contents:
		var amountToTransfer = contentData["amount"] * fraction
		contentData["amount"] -= amountToTransfer
		ourFluids.append([contentData["fluidType"], amountToTransfer, contentData["fluidDNA"]])
		result = true
	
	for contentData in otherFluids.contents:
		var amountToTransfer = contentData["amount"] * fraction
		contentData["amount"] -= amountToTransfer
		theirFluids.append([contentData["fluidType"], amountToTransfer, contentData["fluidDNA"]])
		result = true
		
	for fluidsToAdd in ourFluids:
		otherFluids.addFluid(fluidsToAdd[0], fluidsToAdd[1], fluidsToAdd[2])
	for fluidsToAdd in theirFluids:
		addFluid(fluidsToAdd[0], fluidsToAdd[1], fluidsToAdd[2])
	removeEmptyInternalEntries()
	otherFluids.removeEmptyInternalEntries()
	return result

func doDrainObsorb(howMuchToDrain: float, howMuchGotObsorbed: float):
	var fluidAmount = getFluidAmount()
	
	var result = []
	var shouldRemoveInternal = false
	
	for fluidData in contents:
		var share: float = fluidData["amount"] / fluidAmount * RNG.randf_range(0.8, 1.1)
		var toRemove = share * howMuchToDrain
		var toObsorb = share * howMuchGotObsorbed
		if(fluidData["amount"] < 0.1):
			toRemove = fluidData["amount"]
		toRemove = clamp(toRemove, 0.0, fluidData["amount"])
		
		if(toObsorb > 0.0):
			result.append({
				"fluidType": fluidData["fluidType"],
				"amount": toObsorb,
				"fluidDNA": fluidData["fluidDNA"],
			})
		
		fluidData["amount"] -= toRemove
		cachedFluidsAmount -= toRemove
		if(fluidData["amount"] <= 0.0):
			shouldRemoveInternal = true
		
	if(shouldRemoveInternal):
		removeEmptyInternalEntries()
	return result

func drain(howMuchToDrain: float, randMin:float = 1.0, randMax:float = 1.0):
	var fluidAmount = getFluidAmount()
	
	var shouldRemoveInternal = false
	
	for fluidData in contents:
		var share: float = fluidData["amount"] / fluidAmount * RNG.randf_range(randMin, randMax)
		var toRemove = share * howMuchToDrain
		if(fluidData["amount"] < 0.1):
			toRemove = fluidData["amount"]
		toRemove = clamp(toRemove, 0.0, fluidData["amount"])

		fluidData["amount"] -= toRemove
		cachedFluidsAmount -= toRemove
		if(fluidData["amount"] <= 0.0):
			shouldRemoveInternal = true
		
	if(shouldRemoveInternal):
		removeEmptyInternalEntries()

func getFluidList():
	var myfluids = []
	for fluidData in contents:
		if(!myfluids.has(fluidData["fluidType"])):
			myfluids.append(fluidData["fluidType"])
	return myfluids

func getFluidListNames():
	var myfluids = []
	for fluidData in contents:
		var fluidName = BodilyFluids.FluidType.getName(fluidData["fluidType"])
		
		if(!myfluids.has(fluidName)):
			myfluids.append(fluidName)
	return myfluids

func getUniqueCharactersAmount():
	var chars = {}
	
	for fluidData in contents:
		var fluidDNA = fluidData["fluidDNA"]
		if(!fluidDNA.isBlank()):
			chars[fluidDNA.getCharacterID()] = true
	
	return chars.keys().size()

func saveData():
	var theContents = []
	for contentData in contents:
		theContents.append({
			"fluidType": contentData["fluidType"],
			"amount": contentData["amount"],
			"fluidDNA": contentData["fluidDNA"].saveData(),
		})
	
	var data = {
		"contents": theContents,
	}
	
	return data

func loadData(data):
	var theContents = SAVE.loadVar(data, "contents", [])
	contents.clear()
	cachedFluidsAmount = 0.0
	for contentData in theContents:
		var fluidType = SAVE.loadVar(contentData, "fluidType", "")
		if(fluidType == null || fluidType == ""):
			continue
		
		var amount = SAVE.loadVar(contentData, "amount", 10.0)
		var fluidDNA = FluidDNA.new()
		fluidDNA.loadData(SAVE.loadVar(contentData, "fluidDNA", {}))
		
		contents.append({
			"fluidType": fluidType,
			"amount": amount,
			"fluidDNA": fluidDNA,
		})
		cachedFluidsAmount += amount
	
