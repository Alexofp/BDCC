extends Reference
class_name MenstrualCycle

var cycleProgress: float = 0.0
var character = null
var eggCells:Dictionary = {}
var impregnatedEggCells:Array = []
var bigEggs:Array = []
var ovulatedThisCycle:bool = false
var noticedVisiblyPregnant:bool = false
var noticedHeavyIntoPregnancy:bool = false
var noticedReadyToGiveBirth:bool = false
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

func hasWombIn(orificeType:int) -> bool:
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

func hasOrifice(orificeType:int) -> bool:
	if(character == null):
		return false
		
	if(orificeType == OrificeType.Vagina):
		if(getCharacter().hasBodypart(BodypartSlot.Vagina)):
			return true
	if(orificeType == OrificeType.Anus):
		if(getCharacter().hasBodypart(BodypartSlot.Anus)):
			return true
	if(orificeType == OrificeType.Throat):
		if(getCharacter().hasBodypart(BodypartSlot.Head)):
			return true
	
	return false

func isOrificeBlocked(orificeType:int) -> bool:
	if(character == null):
		return false
	
	if(orificeType == OrificeType.Vagina):
		if(getCharacter().buffsHolder.hasBuff(Buff.BlocksVaginaLeakingBuff)):
			return true
	if(orificeType == OrificeType.Anus):
		if(getCharacter().buffsHolder.hasBuff(Buff.BlocksAnusLeakingBuff)):
			return true
	if(orificeType == OrificeType.Throat):
		if(getCharacter().isOralBlocked()):
			return true
	
	return false

func hasAnyWomb() -> bool:
	for orificeType in OrificeType.getAll():
		if(hasWombIn(orificeType)):
			return true
	return false

func getCurrentStage() -> int:
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

func isInHeat() -> bool:
	if(getCurrentStage() != CycleStage.Ovulation):
		return false
	if(!hasAnyWomb()):
		return false
	if(getPregnancyProgress() > 0.05 && !isEligibleForProlongedPregnancy()):
		return false
	if(isEggStuffed()): # Feeling of fullness tricks your body into thinking that you're pregnant. So no heat
		return false
	
	return true

func forceIntoHeat():
	newCycle(false) # so eggs from the previous cycle are not cleared
	cycleProgress = 0.36

func forceOvulate() -> bool:
	if(ovulatedThisCycle || isPregnant() || isEggStuffed()):
		return false
	ovulate()
	return true

func shouldOvulate() -> bool:
	if(!ovulatedThisCycle && cycleProgress >= willOvulateAt && !isEggStuffed() && (!isPregnant() || isEligibleForProlongedPregnancy())):
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
	
func newCycle(shouldClearNonPregEggs:bool = true):
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

func getPregnancySpeed() -> float:
	var theCharacter = getCharacter()
	var pregnancySpeed:float = 1.0
	if(theCharacter != null):
		pregnancySpeed += theCharacter.getCustomAttribute(BuffAttribute.PregnancySpeed)
	pregnancySpeed = clamp(pregnancySpeed, 0.1, 100.0)
	return pregnancySpeed

func processTime(seconds:int):
	var theCharacter = getCharacter()
	
	if(isPregnant()):
		var thePregnancyProgress := getPregnancyProgress()
		
		if(theCharacter != null && thePregnancyProgress > 0.05 && !theCharacter.hasPerk(Perk.FertilityBetterOvulationV3)):
			cycleProgress = 1.0
		
		if(!noticedVisiblyPregnant && isVisiblyPregnant()):
			noticedVisiblyPregnant = true
			emit_signal("visiblyPregnant")
			
		if(!noticedHeavyIntoPregnancy && thePregnancyProgress > 0.66):
			noticedHeavyIntoPregnancy = true
			emit_signal("heavyIntoPregnancy")

	if(!hasAnyWomb()):
		cycleProgress = 0.0	
	elif(!isPregnant() || (theCharacter != null && theCharacter.hasPerk(Perk.FertilityBetterOvulationV3))):
		var add:float = float(seconds)/float(getCycleLength())
		
		cycleProgress += add
		while(cycleProgress >= 1.0):
			cycleProgress -= 1.0
			newCycle()
		
		if(shouldOvulate()):
			ovulate()
	
	var pregnancySpeed:float = 1.0
	var hasAnyImpregCells:bool = !impregnatedEggCells.empty()
	var hasAnyBigEggs:bool = !bigEggs.empty()
	if(hasAnyImpregCells || hasAnyBigEggs): # speed is costly to calculate
		pregnancySpeed = getPregnancySpeed()
		
	if(hasAnyImpregCells):
		var readyFetusAmount: = 0
		for egg in impregnatedEggCells:
			egg.processTime(seconds * pregnancySpeed)
			if(egg.fetusIsReadyForBirth()):
				readyFetusAmount += 1
		
		if(readyFetusAmount == impregnatedEggCells.size() && !noticedReadyToGiveBirth):
			noticedReadyToGiveBirth = true
			emit_signal("readyToGiveBirthOnce")

	if(hasAnyBigEggs):
		#TODO: Ready to lay eggs check?
		for bigEgg in bigEggs:
			bigEgg.processTime(seconds * pregnancySpeed)
	
	for orificeType in eggCells:
		for egg in eggCells[orificeType]:
			egg.processTime(seconds)

func forceImpregnateBy(npcID:String):
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
	
	var motherSpecies:Array = getCharacter().getSpecies()
	var possibleEggAmounts:Array = []
	for specie in motherSpecies:
		var speciesObject = GlobalRegistry.getSpecies(specie)
		if speciesObject == null:
			possibleEggAmounts.append_array([[1, 10.0],[2, 1.0]])
		else:
			possibleEggAmounts.append_array(speciesObject.getEggCellOvulationAmount())
	
	for orifice in OrificeType.getAll():
		if(!hasWombIn(orifice)):
			continue
		
		var ch = getCharacter()
		var amountOfEggs:int = RNG.pickWeightedPairs(possibleEggAmounts)
		amountOfEggs = Util.maxi(ch.getMinEggsAmount(), int(ceil(amountOfEggs * ch.getEggsBonusMod())))
		if(ch.hasPerk(Perk.FertilityBetterOvulation) && amountOfEggs < 10):
			amountOfEggs += RNG.randi_range(0, 4) #otherwise species with low base eggs like humans, won't get much bonus
			
		print(ch.getName(), " OVULATED WITH "+str(amountOfEggs)+" AMOUNT OF EGGS")
		#print(ch.getName(), " Bonus eggs modifier: ", ch.getEggsBonusMod() *100, "%")
		#print(ch.getName(), " AMOUNT OF Min eggs: ", ch.getMinEggsAmount())
		
		for _i in range(amountOfEggs):
			var egg := createEggCell()
			egg.setOrifice(orifice)
			egg.setMother(getCharacter().getID(), motherSpecies)
			eggCells[orifice].append(egg)
	
func removeEgg(egg:EggCell):
	eggCells[egg.getOrifice()].erase(egg)
	impregnatedEggCells.erase(egg)
	bigEggs.erase(egg)
	#print("EGG DIED")
	
func obsorbCum(_cumType, amountML:float, fluidDNA, orificeType:int = OrificeType.Vagina):
	if(!hasWombIn(orificeType)):
		return
	
	var fertility = getCharacter().getFertility()
	var crossSpeciesCompatibility = getCharacter().getCrossSpeciesCompatibility()
	
	if(eggCells.has(orificeType) && eggCells[orificeType].size() > 0):
		var eggAmountMult = sqrt(float(eggCells[orificeType].size()))
		
		var egg = RNG.pick(eggCells[orificeType])
		if(egg.tryImpregnate(fluidDNA, amountML, eggAmountMult, fertility, crossSpeciesCompatibility)):
			eggCells[orificeType].erase(egg)
			#TODO: is egg big check. Put into big eggs then
			impregnatedEggCells.append(egg)

func isEggStuffed() -> bool:
	return !bigEggs.empty()

func isPregnant() -> bool:
	return !impregnatedEggCells.empty()

func isEggStuffedBy(_charID:String) -> bool:
	for egg in bigEggs:
		if(egg.getFatherID() == _charID || egg.getMotherID() == _charID):
			return true
	return false

func isPregnantFromPlayer() -> bool:
	if(!isPregnant()):
		return false
	
	for egg in impregnatedEggCells:
		if(egg.getFatherID() == "pc" || egg.getMotherID() == "pc"):
			return true
	return false

func isPregnantFrom(_charID:String) -> bool:
	if(!isPregnant()):
		return false
	
	for egg in impregnatedEggCells:
		if(egg.getFatherID() == _charID || egg.getMotherID() == _charID):
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

func getPregnancyProgressDoll() -> float:
	var bigEggAmount:int = bigEggs.size() 
	var bigEggPregnancyProgress:float = min(bigEggAmount*0.1, 1.0) # 10 big eggs -> doll looks fully pregnant
	var theNormalPregnancyProgress:float = getPregnancyProgress()
	return max(theNormalPregnancyProgress, bigEggPregnancyProgress)

func isReadyToGiveBirth() -> bool:
	var readyFetusAmount:int = 0
	for egg in impregnatedEggCells:
		if(egg.fetusIsReadyForBirth()):
			readyFetusAmount += 1
			
	if(impregnatedEggCells.size() > 0):
		return readyFetusAmount == impregnatedEggCells.size()
	else:
		return false

func isReadyToLayEggs(_checkIfPlugged:bool = true) -> bool:
	for egg in bigEggs:
		if(egg.isReadyToBeLaid()):
			if(_checkIfPlugged && isOrificeBlocked(egg.orificeType)):
				continue
			return true
	return false

func isReadyToLayEggsCanContinue(_checkIfPlugged:bool = true) -> bool:
	return !getEggsToBeLaid(30*60, _checkIfPlugged).empty()

func hasEggsInOrifice(_orifice:int, _onlyTentacle:bool = false) -> bool:
	for egg in bigEggs:
		if(egg.orificeType == _orifice):
			if(_onlyTentacle && egg.tentacleEggType == TentacleEggType.NONE):
				continue
			return true
	return false

func addTentacleEgg(_charID:String, _tentacleType:int, _growTime:int, _orifice:int) -> bool:
	if(!hasOrifice(_orifice)):
		return false
	var egg:EggCell = EggCell.new()
	egg.cycle = weakref(self)
	
	egg.setOrifice(_orifice)
	egg.setMother(getCharacter().getID(), getCharacter().getSpecies())
	
	egg.isimpregnated = true
	egg.fatherID = _charID
	#causerID = fluidDNA.getCauserID()
	
	# Not needed for tentacle eggs but might as well
	egg.resultSpecies = egg.motherSpecies.duplicate()
	if(egg.fatherID == "pc" || egg.motherID == "pc"):
		egg.resultGender = GM.main.getEncounterSettings().generateGender()
	else:
		egg.resultGender = NpcGender.generate()
	
	egg.bigEgg = true
	egg.tentacleEggType = _tentacleType
	egg.lifeSpan = _growTime
	
	bigEggs.append(egg)
	return true

func getLitterSize() -> int:
	return impregnatedEggCells.size()

func getRoughLitterEstimateString(veryAccurate = false) -> String:
	var trueValue := impregnatedEggCells.size()
	
	var fullProgress:float = 0.0
	for egg in impregnatedEggCells:
		fullProgress += clamp(egg.getProgress(), 0.0, 1.0)
	var averageProgress = 0.0
	if(impregnatedEggCells.size() > 0):
		averageProgress = fullProgress / impregnatedEggCells.size()
	
	var disp:int = 3 + int(trueValue/2)
	if(veryAccurate):
		disp = disp / 2
	var minValue = RNG.randi_range(trueValue - int(disp * (1.0 - averageProgress)), trueValue)
	minValue = Util.maxi(0, minValue)
	var maxValueMin = trueValue + int(disp * (1.0 - averageProgress))
	var maxValue = 0
	if (maxValueMin > trueValue):
		maxValue = RNG.randi_range(trueValue, maxValueMin)
	else:
		maxValue = RNG.randi_range(maxValueMin, trueValue)
		

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
	var maxTime:int = impregnatedEggCells[0].getTimeUntilReadyForBirth()
	for egg in impregnatedEggCells:
		var newMaxTime = egg.getTimeUntilReadyForBirth()
		if(newMaxTime > maxTime):
			maxTime = newMaxTime
	return int(ceil(maxTime / getPregnancySpeed()))

func getAmountOfEggsReadyToBeLaid(_time:int = 30*60) -> int:
	return getEggsToBeLaid(_time).size()

func delayEggs(_time:int = 3*60*60):
	for egg in bigEggs:
		egg.delayEgg(_time)

func getTimeUntilNextEggLaying() -> int:
	if(bigEggs.empty()):
		return 0
	var theTime:int = bigEggs[0].getTimeUntilReadyToBeLaid()
	for egg in bigEggs:
		var theNewTime:int = egg.getTimeUntilReadyToBeLaid()
		if(theNewTime < theTime):
			theTime = theNewTime
	return theTime

func getEggsToBeLaid(_time:int = 30*60, _ignoreIfPlugged:bool = true) -> Array:
	var result:Array = []
	
	for egg in bigEggs:
		var theEggTime:int = egg.getTimeUntilReadyToBeLaid()
		if(theEggTime <= _time):
			if(_ignoreIfPlugged):
				var theOrifice:int = egg.orificeType
				if(theOrifice == OrificeType.Throat):
					theOrifice = OrificeType.Anus
				if(isOrificeBlocked(theOrifice)):
					continue
			
			result.append(egg)

	return result

func isVisiblyEggStuffed() -> bool:
	if(!bigEggs.empty()):
		return true
	return false

func isVisiblyPregnant() -> bool:
	if(getPregnancyProgress() >= 0.20):
		return true
	return false
	
func isVisiblyPregnantFromPlayer() -> bool:
	if(!isVisiblyPregnant()):
		return false
	
	return isPregnantFromPlayer()
	
func createEggCell() -> EggCell:
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
	var eggData:Array = []
	for orificeType in eggCells:
		for egg in eggCells[orificeType]:
			eggData.append(egg.saveData())
	for egg in impregnatedEggCells:
		eggData.append(egg.saveData())
	data["eggCells"] = eggData
	
	if(!bigEggs.empty()):
		var bigEggData:Array = []
		for egg in bigEggs:
			bigEggData.append(egg.saveData())
		data["bigEggs"] = bigEggData
	
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
	bigEggs.clear()
	for orificeType in OrificeType.getAll():
		eggCells[orificeType] = []
		
	var eggData = SAVE.loadVar(data, "eggCells", [])
	for eggD in eggData:
		var egg := createEggCell()
		egg.loadData(eggD)
		
		if(egg.isImpregnated()):
			impregnatedEggCells.append(egg)
		else:
			var orifice:int = egg.getOrifice()
			if(eggCells.has(orifice)):
				eggCells[orifice].append(egg)
	
	if(data.has("bigEggs")):
		var bigEggData:Array = SAVE.loadVar(data, "bigEggs", [])
		for eggD in bigEggData:
			var egg := createEggCell()
			egg.loadData(eggD)
			bigEggs.append(egg)
	
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

# {type=TentacleEggType.Plant, laidBy=charID, orifice=OrificeType.Anus/Vagina, slot=BodypartSlot.Anus/Vagina, data=OPTIONAL}
func laySingleEgg(_time:int = 0) -> EggLaid:
	if(bigEggs.empty()):
		return null
	var theChar = getCharacter()
	if(!theChar):
		return null
	var readyEggs:Array = getEggsToBeLaid(_time)
	if(readyEggs.empty()):
		return null
	var randomEgg = RNG.pick(readyEggs)
	
	return layEggSpecific(randomEgg)

func layEggSpecific(_egg:EggCell) -> EggLaid:
	if(!bigEggs.has(_egg)):
		return null
	bigEggs.erase(_egg)
	
	var theData:Dictionary = {}
	
	var newEgg := EggLaid.new()
	newEgg.type = _egg.tentacleEggType
	newEgg.laidBy = getCharacter().getID() if getCharacter() else ""
	newEgg.orifice = _egg.orificeType
	newEgg.data = theData
	
	return newEgg

func layEggs(_time:int = 30*60, _isAtNursery:bool = false) -> Array:
	if(bigEggs.empty()):
		return []
	
	var theChar = getCharacter()
	if(!theChar):
		return []
	var _isPc:bool = theChar.isPlayer()
	var readyEggs:Array = getEggsToBeLaid(_time)
	var result:Array = []
	for egg in readyEggs:
		result.append(egg)
		
		var theEggType:int = egg.tentacleEggType
		if(theEggType == TentacleEggType.Plant):
			if(_isPc):
				var newEggItem = GlobalRegistry.createItem("PlantEgg")
				newEggItem.whoGaveBirth = theChar.getID()
				theChar.getInventory().addItem(newEggItem)
		
		#TODO: Fill the result with better info
		bigEggs.erase(egg)
	return result

func generateLayEggsReport(_eggs:Array, _isAtNursery:bool = false) -> String:
	if(_eggs.empty()):
		return ""
	var resultLines:Array = []
	
	for egg in _eggs:
		var theEggType:int = egg.tentacleEggType
		if(theEggType == TentacleEggType.NONE):
			resultLines.append("LIVE EGG!") #TODO: Make this write the child info and stuff
		elif(theEggType == TentacleEggType.Plant):
			resultLines.append("1x Plant egg. Added to your inventory")
		else:
			resultLines.append("1x Unknown egg. Dissolved by itself")
	
	return Util.join(resultLines, "\n")

func giveBirth() -> Array:
	if(impregnatedEggCells.size() <= 0):
		return []
	
	var result:Array = []
	
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

func cancelPregnancy(_cancelNormalPregnancy:bool = true, _deleteBigEggs:bool = true):
	if(_cancelNormalPregnancy):
		impregnatedEggCells.clear()
		cycleProgress = 1.0
		noticedVisiblyPregnant = false
		noticedHeavyIntoPregnancy = false
		noticedReadyToGiveBirth = false
	if(_deleteBigEggs):
		bigEggs.clear()

func getEggStuffedOrifices() -> Array:
	var theStuffed:Dictionary = {}
	
	for theEgg in bigEggs:
		if(!theStuffed.has(theEgg.orificeType)):
			theStuffed[theEgg.orificeType] = true
	
	return theStuffed.keys()
		
