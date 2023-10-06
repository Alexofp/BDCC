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

func isEligibleForProlongedPregnancy() -> bool:
	if(!getCharacter().hasPerk(Perk.FertilityBetterOvulationV3)):
		return false

	for egg in impregnatedEggCells: #to prevent perpetual pregnancy. If any egg reaches 2.5 progress
		if(egg.getProgress() >= 2.5): # no further ovulations allowed
			return false
	return true

func isInHeat():
	return getCurrentStage() == CycleStage.Ovulation && hasAnyWomb() && (!isPregnant() || isEligibleForProlongedPregnancy())

func forceIntoHeat():
	newCycle(false) # so eggs from the previous cycle are not cleared
	cycleProgress = 0.36

func forceOvulate():
	if(ovulatedThisCycle || isPregnant()):
		return false
	ovulate()
	return true

func shouldOvulate():
	if(!ovulatedThisCycle && cycleProgress >= willOvulateAt && (!isPregnant() || isEligibleForProlongedPregnancy())):
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
	
func newCycle(shouldClearNonPregEggs: = true):
#	print(getCharacter().getName(), " Entered new cycle" )
	if(shouldClearNonPregEggs):
		for orificeType in OrificeType.getAll():
			eggCells[orificeType] = []
	willOvulateAt = RNG.randf_range(0.3, 0.6)
	ovulatedThisCycle = false
	
# in seconds
func getCycleLength() -> int:
	#return 60*60*24*10
	var settingValue:int = OPTIONS.getMenstrualCycleLengthDays()
	settingValue = Util.maxi(1, settingValue)
	
	return 60*60*24*settingValue

func getPregnancySpeed():
	var theCharacter = getCharacter()
	var pregnancySpeed = 1.0
	if(theCharacter != null):
		pregnancySpeed += theCharacter.getCustomAttribute(BuffAttribute.PregnancySpeed)
	pregnancySpeed = clamp(pregnancySpeed, 0.1, 100.0)
	return pregnancySpeed

func processTime(seconds):
	var theCharacter = getCharacter()
	
	if(isPregnant()):
		if(theCharacter != null && !theCharacter.hasPerk(Perk.FertilityBetterOvulationV3)):
			cycleProgress = 1.0
		
		if(!noticedVisiblyPregnant && isVisiblyPregnant()):
			noticedVisiblyPregnant = true
			emit_signal("visiblyPregnant")
			
		if(!noticedHeavyIntoPregnancy && getPregnancyProgress() > 0.66):
			noticedHeavyIntoPregnancy = true
			emit_signal("heavyIntoPregnancy")

	if(!hasAnyWomb()):
		cycleProgress = 0.0	
	elif(!isPregnant() || (theCharacter != null && theCharacter.hasPerk(Perk.FertilityBetterOvulationV3))):
		var add = float(seconds)/float(getCycleLength())
		
		cycleProgress += add
		while(cycleProgress >= 1.0):
			cycleProgress -= 1.0
			newCycle()
		
		if(shouldOvulate()):
			ovulate()
	
	if(impregnatedEggCells.size() > 0):
		var pregnancySpeed = getPregnancySpeed()
		
		var readyFetusAmount: = 0
		for egg in impregnatedEggCells:
			egg.processTime(seconds * pregnancySpeed)
			if(egg.fetusIsReadyForBirth()):
				readyFetusAmount += 1
	
		if(readyFetusAmount == impregnatedEggCells.size() && !noticedReadyToGiveBirth):
			noticedReadyToGiveBirth = true
			emit_signal("readyToGiveBirthOnce")
	
	for orificeType in eggCells:
		for egg in eggCells[orificeType]:
			egg.processTime(seconds)

func forceImpregnateBy(npcID):
	var otherCharacter = GlobalRegistry.getCharacter(npcID)
	if(otherCharacter == null):
		return false
	
	if(!hasAnyWomb()):
		return false
	
	var fluidDNA = otherCharacter.getFluidDNA(FluidSource.Penis)
	if(fluidDNA == null):
		return false
	
	var howMuchImpregnated = 0
	for orificeType in eggCells:
		for egg in eggCells[orificeType]:
			egg.impregnatedBy(fluidDNA)
			howMuchImpregnated += 1
	
	if(howMuchImpregnated <= 0):
		ovulate()
		for orificeType in eggCells:
			for egg in eggCells[orificeType]:
				egg.impregnatedBy(fluidDNA)
				howMuchImpregnated += 1
	
	for orificeType in eggCells:
		for egg in eggCells[orificeType]:
			impregnatedEggCells.append(egg)
		eggCells[orificeType].clear()
	
	if(howMuchImpregnated <= 0):
		return false
	return true

func ovulate():
	ovulatedThisCycle = true
	
	#print(getCharacter().getName() + " OVULATED")
	
	var motherSpecies = getCharacter().getSpecies()
	var possibleEggAmounts = []
	for specie in motherSpecies:
		var speciesObject = GlobalRegistry.getSpecies(specie)
		possibleEggAmounts.append_array(speciesObject.getEggCellOvulationAmount())
	
	for orifice in OrificeType.getAll():
		if(!hasWombIn(orifice)):
			continue
		
		var ch = getCharacter()
		var amountOfEggs = RNG.pickWeightedPairs(possibleEggAmounts)
		amountOfEggs = max(ch.getMinEggsAmount(), int(ceil(amountOfEggs * ch.getEggsBonusMod())))
		if(ch.hasPerk(Perk.FertilityBetterOvulation) && amountOfEggs < 10):
			amountOfEggs += RNG.randi_range(0, 4) #otherwise species with low base eggs like humans, won't get much bonus
			
		print(ch.getName(), " OVULATED WITH "+str(amountOfEggs)+" AMOUNT OF EGGS")
		#print(ch.getName(), " Bonus eggs modifier: ", ch.getEggsBonusMod() *100, "%")
		#print(ch.getName(), " AMOUNT OF Min eggs: ", ch.getMinEggsAmount())
		
		for _i in range(amountOfEggs):
			var egg = createEggCell()
			egg.setOrifice(orifice)
			egg.setMother(getCharacter().getID(), motherSpecies)
			eggCells[orifice].append(egg)
	
func removeEgg(egg):
	eggCells[egg.getOrifice()].erase(egg)
	impregnatedEggCells.erase(egg)
	#print("EGG DIED")
	
func obsorbCum(_cumType, amountML, fluidDNA, orificeType = OrificeType.Vagina):
	if(!hasWombIn(orificeType)):
		return
	
	var fertility = getCharacter().getFertility()
	var crossSpeciesCompatibility = getCharacter().getCrossSpeciesCompatibility()
	
	if(eggCells.has(orificeType) && eggCells[orificeType].size() > 0):
		var eggAmountMult = sqrt(float(eggCells[orificeType].size()))
		
		var egg = RNG.pick(eggCells[orificeType])
		if(egg.tryImpregnate(fluidDNA, amountML, eggAmountMult, fertility, crossSpeciesCompatibility)):
			eggCells[orificeType].erase(egg)
			impregnatedEggCells.append(egg)

func isPregnant():
	if(impregnatedEggCells.size() > 0):
		return true
	return false

func isPregnantFromPlayer():
	if(!isPregnant()):
		return false
	
	for egg in impregnatedEggCells:
		if(egg.getFatherID() == "pc" || egg.getMotherID() == "pc"):
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

func isReadyToGiveBirth() -> bool:
	var readyFetusAmount: = 0
	for egg in impregnatedEggCells:
		if(egg.fetusIsReadyForBirth()):
			readyFetusAmount += 1
			
	if(impregnatedEggCells.size() > 0):
		return readyFetusAmount == impregnatedEggCells.size()
	else:
		return false

func getRoughLitterEstimateString():
	var trueValue = impregnatedEggCells.size()
	
	var fullProgress = 0.0
	for egg in impregnatedEggCells:
		fullProgress += clamp(egg.getProgress(), 0.0, 1.0)
	var averageProgress = 0.0
	if(impregnatedEggCells.size() > 0):
		averageProgress = fullProgress / impregnatedEggCells.size()
	
	var disp = 3 + int(trueValue/2)
	var minValue = RNG.randi_range(trueValue - int(disp * (1.0 - averageProgress)), trueValue)
	minValue = Util.maxi(0, minValue)
	var maxValue = RNG.randi_range(trueValue + int(disp * (1.0 - averageProgress)), trueValue)

	if(minValue == maxValue):
		if(maxValue == 1):
			return "1 kid"
		else:
			return str(minValue)+" kids"
	else:
		return str(minValue)+"-"+str(maxValue)+" kids"

func getTimeUntilReadyForBirth() -> int:
	if(impregnatedEggCells.size() == 0):
		return 0
	var maxTime = impregnatedEggCells[0].getTimeUntilReadyForBirth()
	for egg in impregnatedEggCells:
		var newMaxTime = egg.getTimeUntilReadyForBirth()
		if(newMaxTime > maxTime):
			maxTime = newMaxTime
	return maxTime / getPregnancySpeed()

func isVisiblyPregnant():
	if(getPregnancyProgress() >= 0.20):
		return true
	return false
	
func isVisiblyPregnantFromPlayer():
	if(!isVisiblyPregnant()):
		return false
	
	return isPregnantFromPlayer()
	
func createEggCell():
	var egg = EggCell.new()
	egg.cycle = weakref(self)
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
		
		for x in eggCell.monozygotic:
			var newChild: Child = Child.new()
			newChild.generateUniqueID()
			newChild.loadFromEggCell(eggCell)
			newChild.generateName()
			newChild.setBirthday(GM.main.getDays())
			newChild.setBornFromMonozygoticStatus(eggCell.monozygotic)
		
			result.append(newChild)
	
	if(getCharacter() != null):
		getCharacter().onGivingBirth(impregnatedEggCells, result)
	
	impregnatedEggCells.clear()
	cycleProgress = 1.0
	noticedVisiblyPregnant = false
	noticedHeavyIntoPregnancy = false
	noticedReadyToGiveBirth = false
	
	return result

