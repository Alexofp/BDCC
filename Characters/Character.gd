extends BaseCharacter
class_name Character

const Bob = "testchar"

var id = "errorerror"
var npcStats = {}
var npcLevel = 0
var npcLustInterests = {}
var npcArmor = {}
var npcBasePain = null
var npcBaseLust = null
var npcBaseStamina = null
var npcBaseRestraintDodgeChanceMult = null
var npcRestraintStrugglePower = 1.0
var npcRestraintMinigameResultMin = 0.8
var npcRestraintMinigameResultMax = 1.1
var npcHasMenstrualCycle = false # If true can get pregnant

var lastUpdatedDay:int = -1
var lastUpdatedSecond:int = -1

func _ready():
	name = id
	createBodyparts()
	createEquipment()
	for statID in npcStats:
		skillsHolder.setStat(statID, npcStats[statID])
	skillsHolder.setLevel(npcLevel)
	
	for interestID in npcLustInterests:
		var interestData = npcLustInterests[interestID]
		if(interestData is Array):
			if(interestData.size() > 1):
				lustInterests.addInterest(interestID, interestData[0])
			else:
				lustInterests.addInterest(interestID, interestData[0])
		else:
			lustInterests.addInterest(interestID, interestData)
			
	if(npcHasMenstrualCycle):
		menstrualCycle = MenstrualCycle.new()
		menstrualCycle.setCharacter(self)
		var _ok = menstrualCycle.connect("readyToGiveBirth", self, "onCharacterReadyToGiveBirth")
		var _ok2 = menstrualCycle.connect("heavyIntoPregnancy", self, "onCharacterHeavyIntoPregnancy")
		var _ok3 = menstrualCycle.connect("visiblyPregnant", self, "onCharacterVisiblyPregnant")
		menstrualCycle.start()

func _init():
	pass
	
func getID():
	return id
	
func _getName():
	return "Error"
	
func getName():
	return _getName()

func beforeFightStarted():
	.beforeFightStarted()
	lust = RNG.randi_range(0, getAmbientLust())
	pain = RNG.randi_range(0, getAmbientPain())
	stamina = getMaxStamina()

func afterFightEnded():
	.afterFightEnded()
	#pain = 0
	#lust = 0
	#stamina = getMaxStamina()

func saveData():
	var data = {
		"pain": pain,
		"lust": lust,
		"stamina": stamina,
		"arousal": arousal,
		"consciousness": consciousness,
	}
	
	data["bodyparts"] = {}
	for slot in bodyparts:
		if(bodyparts[slot] == null):
			continue
		
		data["bodyparts"][slot] = {
			"id": bodyparts[slot].id,
			"data": bodyparts[slot].saveDataNPC(),
		}
	
	data["statusEffects"] = saveStatusEffectsData()
	data["inventory"] = inventory.saveData()
	data["lustInterests"] = lustInterests.saveData()
	if(menstrualCycle != null):
		data["menstrualCycle"] = menstrualCycle.saveData()

	data["timedBuffs"] = saveBuffsData(timedBuffs)
	data["timedBuffsDurationSeconds"] = timedBuffsDurationSeconds
	data["timedBuffsTurns"] = saveBuffsData(timedBuffsTurns)
	data["timedBuffsDurationTurns"] = timedBuffsDurationTurns
	
	
	data["lastUpdatedDay"] = lastUpdatedDay
	data["lastUpdatedSecond"] = lastUpdatedSecond
	
	return data

func loadData(data):
	pain = SAVE.loadVar(data, "pain", 0)
	lust = SAVE.loadVar(data, "lust", 0)
	stamina = SAVE.loadVar(data, "stamina", 100)
	arousal = SAVE.loadVar(data, "arousal", 0.0)
	consciousness = SAVE.loadVar(data, "consciousness", 1.0)
	
	var loadedBodyparts = SAVE.loadVar(data, "bodyparts", {})
	for slot in loadedBodyparts:
		if(loadedBodyparts[slot] == null):
			assert(false)
		var bodypartStuff = loadedBodyparts[slot]
		var bodypartid = SAVE.loadVar(bodypartStuff, "id", "")
		var bodypartData = SAVE.loadVar(bodypartStuff, "data", {})
		if(!hasBodypart(slot)):
			continue
		var bodypart = getBodypart(slot)
		if(bodypartid != bodypart.id):
			Log.printerr("Bodypart changed for "+getName()+"'s "+str(slot)+", ignoring data (was "+bodypartid+", became "+bodypart.id+")")
			continue
		bodypart.loadDataNPC(bodypartData)
	
	loadStatusEffectsData(SAVE.loadVar(data, "statusEffects", {}))
	inventory.loadDataNPC(SAVE.loadVar(data, "inventory", {}))
	lustInterests.loadData(SAVE.loadVar(data, "lustInterests", {}))

	if(menstrualCycle != null && data.has("menstrualCycle")):
		menstrualCycle.loadData(SAVE.loadVar(data, "menstrualCycle", {}))

	timedBuffs = loadBuffsData(SAVE.loadVar(data, "timedBuffs", []))
	timedBuffsDurationSeconds = SAVE.loadVar(data, "timedBuffsDurationSeconds", 0)
	timedBuffsTurns = loadBuffsData(SAVE.loadVar(data, "timedBuffsTurns", []))
	timedBuffsDurationTurns = SAVE.loadVar(data, "timedBuffsDurationTurns", 0)
	
	lastUpdatedDay = SAVE.loadVar(data, "lastUpdatedDay", -1)
	lastUpdatedSecond = SAVE.loadVar(data, "lastUpdatedSecond", -1)

func getArmor(_damageType):
	var calculatedArmor = .getArmor(_damageType)
	
	if(npcArmor.has(_damageType)):
		calculatedArmor += npcArmor[_damageType]
	
	return calculatedArmor

func getBaseMaxStamina() -> int:
	if(npcBaseStamina != null):
		return npcBaseStamina
	return .getBaseMaxStamina()

func getBasePainThreshold() -> int:
	if(npcBasePain != null):
		return npcBasePain
	return .getBasePainThreshold()
	
func getBaseLustThreshold() -> int:
	if(npcBaseLust != null):
		return npcBaseLust
	return .getBaseLustThreshold()
	
func createBodyparts():
	pass

func createEquipment():
	pass

func resetEquipment():
	inventory.clearEquippedItems()
	createEquipment()

func processTime(_secondsPassed):
	if(timedBuffsDurationSeconds > 0):
		timedBuffsDurationSeconds -= _secondsPassed
		if(timedBuffsDurationSeconds <= 0):
			timedBuffs.clear()
	
	for bodypart in processingBodyparts:
		if(bodypart == null || !is_instance_valid(bodypart)):
			continue
		bodypart.processTime(_secondsPassed)
		
	if(menstrualCycle != null):
		menstrualCycle.processTime(_secondsPassed)
		
	# Not sure if needed
	updateNonBattleEffects()
		
func hoursPassed(_howmuch):
	for bodypart in processingBodyparts:
		if(bodypart != null && is_instance_valid(bodypart)):
			bodypart.hoursPassed(_howmuch)

func updateNonBattleEffects():
	if(timedBuffs.size() > 0):
		addEffect(StatusEffect.TimedEffects)
	else:
		removeEffect(StatusEffect.TimedEffects)
		
	if(timedBuffsTurns.size() > 0):
		addEffect(StatusEffect.TimedEffectsTurns)
	else:
		removeEffect(StatusEffect.TimedEffectsTurns)
	
	if(hasBoundArms()):
		addEffect(StatusEffect.ArmsBound)
	else:
		removeEffect(StatusEffect.ArmsBound)
		
	if(hasBlockedHands()):
		addEffect(StatusEffect.HandsBlocked)
	else:
		removeEffect(StatusEffect.HandsBlocked)
			
	if(hasBoundLegs()):
		addEffect(StatusEffect.LegsBound)
	else:
		removeEffect(StatusEffect.LegsBound)
			
	if(isBlindfolded()):
		addEffect(StatusEffect.Blindfolded)
	else:
		removeEffect(StatusEffect.Blindfolded)
			
	if(isGagged()):
		addEffect(StatusEffect.Gagged)
	else:
		removeEffect(StatusEffect.Gagged)
		
	if(buffsHolder.hasBuff(Buff.MuzzleBuff)):
		addEffect(StatusEffect.Muzzled)
	else:
		removeEffect(StatusEffect.Muzzled)
	
	if(hasBodypart(BodypartSlot.Vagina) && !getBodypart(BodypartSlot.Vagina).isOrificeEmpty()):
		addEffect(StatusEffect.HasCumInsideVagina)
	else:
		removeEffect(StatusEffect.HasCumInsideVagina)
		
	if(hasBodypart(BodypartSlot.Anus) && !getBodypart(BodypartSlot.Anus).isOrificeEmpty()):
		addEffect(StatusEffect.HasCumInsideAnus)
	else:
		removeEffect(StatusEffect.HasCumInsideAnus)
		
	if(hasBodypart(BodypartSlot.Head) && !getBodypart(BodypartSlot.Head).isOrificeEmpty()):
		addEffect(StatusEffect.HasCumInsideMouth)
	else:
		removeEffect(StatusEffect.HasCumInsideMouth)

	if(menstrualCycle != null && menstrualCycle.isInHeat()):
		addEffect(StatusEffect.InHeat)
	else:
		removeEffect(StatusEffect.InHeat)
		
	if(menstrualCycle != null && menstrualCycle.isVisiblyPregnant()):
		addEffect(StatusEffect.Pregnant)
	else:
		removeEffect(StatusEffect.Pregnant)

	if(hasBreastsFullOfMilk()):
		addEffect(StatusEffect.BreastsFull)
	else:
		removeEffect(StatusEffect.BreastsFull)

	if(getCumInflationLevel() > 0.01):
		addEffect(StatusEffect.CumInflated)
	else:
		removeEffect(StatusEffect.CumInflated)
	
	if(GM.main != null && GM.main.supportsSexEngine()):
		addEffect(StatusEffect.SexEnginePersonality)
		addEffect(StatusEffect.SexEngineLikes)
	else:
		removeEffect(StatusEffect.SexEnginePersonality)
		removeEffect(StatusEffect.SexEngineLikes)

func onCharacterVisiblyPregnant():
	if(getMenstrualCycle() != null):
		if(getMenstrualCycle().isPregnantFromPlayer()):
			GM.main.addLogMessage("News", "You just received news that "+getName()+" is pregnant with your children.")

func onCharacterHeavyIntoPregnancy():
	#print(getName()+" is heavy into pregnancy")
	pass

func onCharacterReadyToGiveBirth():
	if(getMenstrualCycle() != null):
		if(getMenstrualCycle().isPregnantFromPlayer()):
			GM.main.addLogMessage("News", "You just received news that "+getName()+" gave birth to your children! You can check who in the nursery")
		else:
			GM.main.addLogMessage("News", "Rumors spread fast. You just received news that "+getName()+" gave birth to someone's children!")
		
		var bornChildren = getMenstrualCycle().giveBirth()
		clearOrificeFluids()
		
		for child in bornChildren:
			GM.CS.addChild(child)

func getAiStrategy(_battleName):
	var basicAI = BasicAI.new()
	basicAI.setCharacterID(id)
	return basicAI

func interestVerbalReaction(_interest):
	var parentCharID = getParentCharacterID()
	if(parentCharID != null):
		return GlobalRegistry.getCharacter(parentCharID).interestVerbalReaction(_interest)
	
	return null

func getLustInterests() -> LustInterests:
	var parentCharID = getParentCharacterID()
	if(parentCharID != null):
		return GlobalRegistry.getCharacter(parentCharID).getLustInterests()
	
	return .getLustInterests()
	
func getParentCharacterID():
	return null

func getRestraintResistance():
	if(npcBaseRestraintDodgeChanceMult != null):
		return npcBaseRestraintDodgeChanceMult
	else:
		return .getRestraintResistance()

func getRestraintStrugglePower():
	return npcRestraintStrugglePower

func getRestraintStrugglingMinigameResult():
	return RNG.randf_range(npcRestraintMinigameResultMin, npcRestraintMinigameResultMax)

func shouldReactToRestraint(_restraintType, _restraintAmount, _isGettingForced):
	if(_isGettingForced && _restraintType in [RestraintType.ButtPlug, RestraintType.VaginalPlug]):
		return RNG.chance(90)
	
	if(_restraintAmount == 0):
		return RNG.chance(50)
	return RNG.chance(20)

func reactRestraint(_restraintType, _restraintAmount, _isGettingForced):
	var parentCharID = getParentCharacterID()
	if(parentCharID != null):
		return GlobalRegistry.getCharacter(parentCharID).reactRestraint(_restraintType, _restraintAmount, _isGettingForced)
	
	return null

func shouldBeUpdated():
	if(GM.main.characterIsVisible(getID())):
		return true
	
	if(hasEffect(StatusEffect.HasCumInsideAnus) || hasEffect(StatusEffect.HasCumInsideMouth) || hasEffect(StatusEffect.HasCumInsideVagina)):
		return true
	
	if(isPregnant()):
		return true
	
	return false

func checkOldWayOfUpdating(theday:int, theseconds:int):
	if(lastUpdatedDay < 0):
		lastUpdatedDay = theday
		lastUpdatedSecond = theseconds

func processUntilTime(theday:int, theseconds:int):
	if(lastUpdatedDay < 0):
		lastUpdatedDay = theday
		lastUpdatedSecond = theseconds
		return
	if(lastUpdatedDay > theday):
		return
	if(lastUpdatedDay == theday && lastUpdatedSecond >= theseconds):
		return
	
	var secondsDiff = 0
	
	var dayDiff = theday - lastUpdatedDay
	if(dayDiff == 0):
		secondsDiff = theseconds - lastUpdatedSecond
	else:
		secondsDiff = 24*60*60*dayDiff - lastUpdatedSecond + theseconds
		
	print("PROCESSED "+str(getID())+" FOR "+str(secondsDiff)+" SECONDS")
	var oneDaySeconds = 24*60*60
	var oneHourSeconds = 60*60
	
	# Processing entire days, then hours, then the rest
	var secondsToProcess = secondsDiff
	while(secondsToProcess > oneDaySeconds):
		processTime(oneDaySeconds)
		secondsToProcess -= oneDaySeconds
	while(secondsToProcess > oneHourSeconds):
		processTime(oneHourSeconds)
		secondsToProcess -= oneHourSeconds
	processTime(secondsToProcess)
	
	var oldHours = int(float(lastUpdatedSecond) / 60 / 60) + lastUpdatedDay*24
	var newHours = int(float(theseconds) / 60 / 60) + theday*24
	var hoursPassed = newHours - oldHours
	
	if(hoursPassed > 0):
		print("and also for "+str(hoursPassed)+" hours")
		hoursPassed(hoursPassed)
	
	lastUpdatedDay = theday
	lastUpdatedSecond = theseconds
