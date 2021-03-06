extends Reference
class_name MenstrualCycle

var cycleProgress: float = 0.0
var character = null
var eggCells = {}
var impregnatedEggCells = []
var ovulatedThisCycle = false
var noticedVisiblyPregnant = false
var noticedHeavyIntoPregnancy = false
var noticedReadyToGiveBirth = false
var willOvulateAt: float = 0.5
signal readyToGiveBirth
signal readyToGiveBirthOnce
signal visiblyPregnant
signal heavyIntoPregnancy

func _init():
	initCycle()
	for orificeType in OrificeType.getAll():
		eggCells[orificeType] = []

func start():
	newCycle()

func hasWombIn(orificeType):
	if(character == null):
		return false
		
	if(orificeType == OrificeType.Vagina):
		if(getCharacter().hasBodypart(BodypartSlot.Vagina) && getCharacter().getBodypart(BodypartSlot.Vagina).hasWomb()):
			return true
	if(orificeType == OrificeType.Anus):
		if(getCharacter().hasBodypart(BodypartSlot.Anus) && getCharacter().getBodypart(BodypartSlot.Anus).hasWomb()):
			return true
	if(orificeType == OrificeType.Throat):
		if(getCharacter().hasBodypart(BodypartSlot.Head) && getCharacter().getBodypart(BodypartSlot.Head).hasWomb()):
			return true
	
	return false

func hasAnyWomb():
	for orificeType in OrificeType.getAll():
		if(hasWombIn(orificeType)):
			return true
	return false

func getCurrentStage():
	if(cycleProgress <= 0.18):
		return CycleStage.Menstruation
	if(cycleProgress <= 0.35):
		return CycleStage.FollicularPhase
	if(cycleProgress <= 0.57):
		return CycleStage.Ovulation
	return CycleStage.LutealPhase

func isInHeat():
	return getCurrentStage() == CycleStage.Ovulation && !isPregnant()

func forceIntoHeat():
	newCycle()
	cycleProgress = 0.36

func shouldOvulate():
	if(!ovulatedThisCycle && cycleProgress >= willOvulateAt && !isPregnant()):
		return true
	return false

func setCharacter(ch):
	character = weakref(ch)

func getCharacter():
	if(character == null):
		return null
	return character.get_ref()

func initCycle():
	cycleProgress = RNG.randf_range(0.0, 1.0)
	
func newCycle():
	willOvulateAt = RNG.randf_range(0.3, 0.6)
	ovulatedThisCycle = false
	
# in seconds
func getCycleLength() -> int:
	#return 60*60*24*10
	var settingValue:int = OPTIONS.getMenstrualCycleLengthDays()
	settingValue = Util.maxi(1, settingValue)
	
	return 60*60*24*settingValue

func processTime(seconds):
	if(isPregnant()):
		cycleProgress = 1.0
		
		if(!noticedVisiblyPregnant && isVisiblyPregnant()):
			noticedVisiblyPregnant = true
			emit_signal("visiblyPregnant")
			
		if(!noticedHeavyIntoPregnancy && getPregnancyProgress() > 0.66):
			noticedHeavyIntoPregnancy = true
			emit_signal("heavyIntoPregnancy")
	elif(!hasAnyWomb()):
		cycleProgress = 0.0	
	else:
		var add = float(seconds)/float(getCycleLength())
		
		cycleProgress += add
		while(cycleProgress >= 1.0):
			cycleProgress -= 1.0
			newCycle()
		
		if(shouldOvulate()):
			ovulate()
	
	for egg in impregnatedEggCells:
		egg.processTime(seconds)
	
	for orificeType in eggCells:
		for egg in eggCells[orificeType]:
			egg.processTime(seconds)

func ovulate():
	ovulatedThisCycle = true
	
	#print("OVULATED")
	
	var motherSpecies = getCharacter().getSpecies()
	var possibleEggAmounts = []
	for specie in motherSpecies:
		var speciesObject = GlobalRegistry.getSpecies(specie)
		possibleEggAmounts.append_array(speciesObject.getEggCellOvulationAmount())
	
	for orifice in OrificeType.getAll():
		if(!hasWombIn(orifice)):
			continue
			
		var amountOfEggs = RNG.pickWeightedPairs(possibleEggAmounts)
		if(amountOfEggs == null):
			amountOfEggs = 1
		#print("AMOUNT OF EGGS: "+str(amountOfEggs))
		
		for _i in range(amountOfEggs):
			var egg = createEggCell()
			egg.setOrifice(orifice)
			egg.setMother(getCharacter().getID(), motherSpecies)
			eggCells[orifice].append(egg)
	
func removeEgg(egg):
	eggCells[egg.getOrifice()].erase(egg)
	impregnatedEggCells.erase(egg)
	#print("EGG DIED")
	
func obsorbCum(cumType, amountML, whosCum, orificeType = OrificeType.Vagina, virility = 1.0):
	if(!hasWombIn(orificeType)):
		return
	
	if(!BodilyFluids.FluidType.canMakeYouPregnant(cumType)):
		return
	
	# Herms shouldn't get pregnant from their own cum
	# .. or should they?
	if(whosCum == getCharacter().getID()):
		return
		
	var fertility = getCharacter().getFertility()
	var crossSpeciesCompatibility = getCharacter().getCrossSpeciesCompatibility()
	
	if(eggCells.has(orificeType) && eggCells[orificeType].size() > 0):
		var eggAmountMult = sqrt(float(eggCells[orificeType].size()))
		
		var egg = RNG.pick(eggCells[orificeType])
		if(egg.tryImpregnate(whosCum, amountML, eggAmountMult, virility, fertility, crossSpeciesCompatibility)):
			eggCells[orificeType].erase(egg)
			impregnatedEggCells.append(egg)

func isPregnant():
	if(impregnatedEggCells.size() > 0):
		return true
	return false

func getPregnancyProgress() -> float:
	var maxProgress = 0.0
	for egg in impregnatedEggCells:
		var newProgress = egg.getProgress()
		if(newProgress > maxProgress):
			maxProgress = newProgress
	#if(maxProgress > 0.0):
	#	print("PREGNANCY: "+str(maxProgress))
	return maxProgress

func isReadyToGiveBirth():
	return getPregnancyProgress() >= 1.0

func getTimeUntilReadyForBirth() -> int:
	if(impregnatedEggCells.size() == 0):
		return 0
	var minTime = impregnatedEggCells[0].getTimeUntilReadyForBirth()
	for egg in impregnatedEggCells:
		var newMinTime = egg.getTimeUntilReadyForBirth()
		if(newMinTime < minTime):
			newMinTime = minTime
	return minTime

func isVisiblyPregnant():
	if(getPregnancyProgress() >= 0.20):
		return true
	return false
	
func createEggCell():
	var egg = EggCell.new()
	egg.cycle = weakref(self)
	egg.connect("readyForBirth", self, "onEggCellReadyForBirth")
	return egg
	
func saveData():
	var data = {
		"cycleProgress": cycleProgress,
		"ovulatedThisCycle": ovulatedThisCycle,
		"willOvulateAt": willOvulateAt,
		"noticedVisiblyPregnant": noticedVisiblyPregnant,
		"noticedReadyToGiveBirth": noticedReadyToGiveBirth,
		"noticedHeavyIntoPregnancy": noticedHeavyIntoPregnancy,
	}
	var eggData = []
	for orificeType in eggCells:
		for egg in eggCells[orificeType]:
			eggData.append(egg.saveData())
	for egg in impregnatedEggCells:
		eggData.append(egg.saveData())
	data["eggCells"] = eggData
	
	return data

func loadData(data):
	cycleProgress = SAVE.loadVar(data, "cycleProgress", 0.0)
	ovulatedThisCycle = SAVE.loadVar(data, "ovulatedThisCycle", false)
	willOvulateAt = SAVE.loadVar(data, "willOvulateAt", 0.5)
	noticedVisiblyPregnant = SAVE.loadVar(data, "noticedVisiblyPregnant", false)
	noticedReadyToGiveBirth = SAVE.loadVar(data, "noticedReadyToGiveBirth", false)
	noticedHeavyIntoPregnancy = SAVE.loadVar(data, "noticedHeavyIntoPregnancy", false)

	impregnatedEggCells.clear()
	eggCells.clear()
	for orificeType in OrificeType.getAll():
		eggCells[orificeType] = []
		
	var eggData = SAVE.loadVar(data, "eggCells", [])
	for eggD in eggData:
		var egg = createEggCell()
		egg.loadData(eggD)
		
		if(egg.isImpregnated()):
			impregnatedEggCells.append(egg)
		else:
			var orifice:int = egg.getOrifice()
			if(eggCells.has(orifice)):
				eggCells[orifice].append(egg)
			
func getRoughChanceOfBecomingPregnant() -> float:
	if(isVisiblyPregnant()):
		return 0.0
	
	var roughChance = 0.0
	if(cycleProgress <= 0.45):
		roughChance = exp(-0.5 * pow(cycleProgress - 0.45, 2) * 40.0)
	else:
		roughChance = exp(-0.5 * pow(cycleProgress - 0.45, 2) * 60.0)
	roughChance = clamp(roughChance, 0.02, 0.95)
	return roughChance * 100.0

func onEggCellReadyForBirth(_egg):
	#print("EGG READY TO BIRTH")
	emit_signal("readyToGiveBirth")
	if(!noticedReadyToGiveBirth):
		noticedReadyToGiveBirth = true
		emit_signal("readyToGiveBirthOnce")

func speedUpPregnancy():
	for egg in impregnatedEggCells:
		var eggCell: EggCell = egg
		#eggCell.progress = 0.99
		#eggCell.processTime(60*60*24)
		eggCell.progress = 1.0

func giveBirth():
	if(impregnatedEggCells.size() <= 0):
		return []
	
	var result = []
	
	for egg in impregnatedEggCells:
		var eggCell: EggCell = egg
		
		var newChild: Child = Child.new()
		newChild.generateUniqueID()
		newChild.loadFromEggCell(eggCell)
		newChild.setBirthday(GM.main.getDays())
		
		result.append(newChild)
	
	if(getCharacter() != null):
		getCharacter().onGivingBirth(impregnatedEggCells, result)
	
	impregnatedEggCells.clear()
	cycleProgress = 1.0
	noticedVisiblyPregnant = false
	noticedHeavyIntoPregnancy = false
	noticedReadyToGiveBirth = false
	
	return result
