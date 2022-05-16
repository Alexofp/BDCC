extends Reference
class_name MenstrualCycle

var cycleProgress: float = 0.0
var character = null
var eggCells = {}
var impregnatedEggCells = []
var ovulatedThisCycle = false
var willOvulateAt: float = 0.5

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
	return 60*60*24*10

func processTime(seconds):
	if(isPregnant()):
		cycleProgress = 1.0
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
	
	var amountOfEggs = 2
	print("OVULATED")
	
	var motherSpecies = getCharacter().getSpecies()
	
	for orifice in OrificeType.getAll():
		if(!hasWombIn(orifice)):
			continue
		
		for _i in range(amountOfEggs):
			var egg = EggCell.new()
			egg.cycle = weakref(self)
			egg.setOrifice(orifice)
			egg.setMother(getCharacter().getID(), motherSpecies)
			eggCells[orifice].append(egg)
	
func removeEgg(egg):
	eggCells[egg.getOrifice()].erase(egg)
	impregnatedEggCells.erase(egg)
	print("EGG DIED")
	
func obsorbCum(cumType, amountML, whosCum, orificeType = OrificeType.Vagina):
	if(!hasWombIn(orificeType)):
		return
	
	if(!BodilyFluids.FluidType.canMakeYouPregnant(cumType)):
		return
	
	# Herms shouldn't get pregnant from their own cum
	# .. or should they?
	if(whosCum == getCharacter().getID()):
		return
	
	if(eggCells.has(orificeType) && eggCells[orificeType].size() > 0):
		var egg = RNG.pick(eggCells[orificeType])
		if(egg.tryImpregnate(whosCum, amountML)):
			eggCells[orificeType].erase(egg)
			impregnatedEggCells.append(egg)

func isPregnant():
	for orificeType in eggCells:
		for egg in eggCells[orificeType]:
			if(egg.isImpregnated()):
				return true
	return false

func getPregnancyProgress() -> float:
	var maxProgress = 0.0
	for egg in impregnatedEggCells:
		var newProgress = egg.getProgress()
		if(newProgress > maxProgress):
			maxProgress = newProgress
	if(maxProgress > 0.0):
		print("PREGNANCY: "+str(maxProgress))
	return maxProgress

func isVisiblyPregnant():
	if(getPregnancyProgress() >= 0.4):
		return true
	return false
	

		
