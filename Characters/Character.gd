extends BaseCharacter
class_name Character

const Bob = "testchar"

var id = "errorerror"
var npcStats = {}
var npcLevel = 0
var npcLustInterests = {}
var npcPersonality = {}
var npcFetishes = {}
var npcDefaultFetishInterest = FetishInterest.Likes
var npcArmor = {}
var npcBasePain = null
var npcBaseLust = null
var npcBaseStamina = null
var npcBaseRestraintDodgeChanceMult = null
var npcRestraintStrugglePower = 1.0
var npcRestraintMinigameResultMin = 0.8
var npcRestraintMinigameResultMax = 1.1
var npcHasMenstrualCycle = false # If true can get pregnant
var npcCharacterType = CharacterType.Generic

var lastUpdatedDay:int = -1
var lastUpdatedSecond:int = -1
var disableSerialization:bool = false # Set to true if the character doesn't need to be saved, only works for non-dynamic npcs
var pregnancyWaitTimer:int = 0

var npcSkinData = {}

func _ready():
	name = id
	createBodyparts()
	paintBodyparts()
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
			
	for personalityStat in npcPersonality:
		personality.setStat(personalityStat, npcPersonality[personalityStat])
	if(npcDefaultFetishInterest != FetishInterest.Likes):
		fetishHolder.clearToInterest(npcDefaultFetishInterest)
	for fetishID in npcFetishes:
		fetishHolder.setFetish(fetishID, npcFetishes[fetishID])
			
	if(npcHasMenstrualCycle):
		menstrualCycle = MenstrualCycle.new()
		menstrualCycle.setCharacter(self)
		var _ok = menstrualCycle.connect("readyToGiveBirthOnce", self, "onCharacterReadyToGiveBirth")
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
	
	GM.GES.callGameExtenders(ExtendGame.npcBeforeFightStarted, [self])

func afterFightEnded():
	.afterFightEnded()
	#pain = 0
	#lust = 0
	#stamina = getMaxStamina()
	GM.GES.callGameExtenders(ExtendGame.npcAfterFightEnded, [self])

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
	data["bodyFluids"] = bodyFluids.saveData()

	data["timedBuffs"] = saveBuffsData(timedBuffs)
	data["timedBuffsDurationSeconds"] = timedBuffsDurationSeconds
	data["timedBuffsTurns"] = saveBuffsData(timedBuffsTurns)
	data["timedBuffsDurationTurns"] = timedBuffsDurationTurns
	
	
	data["lastUpdatedDay"] = lastUpdatedDay
	data["lastUpdatedSecond"] = lastUpdatedSecond
	data["pregnancyWaitTimer"] = pregnancyWaitTimer
	
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
	inventory.loadDataNPC(SAVE.loadVar(data, "inventory", {}), self)
	lustInterests.loadData(SAVE.loadVar(data, "lustInterests", {}))
	bodyFluids.loadData(SAVE.loadVar(data, "bodyFluids", {}))

	if(menstrualCycle != null && data.has("menstrualCycle")):
		menstrualCycle.loadData(SAVE.loadVar(data, "menstrualCycle", {}))

	timedBuffs = loadBuffsData(SAVE.loadVar(data, "timedBuffs", []))
	timedBuffsDurationSeconds = SAVE.loadVar(data, "timedBuffsDurationSeconds", 0)
	timedBuffsTurns = loadBuffsData(SAVE.loadVar(data, "timedBuffsTurns", []))
	timedBuffsDurationTurns = SAVE.loadVar(data, "timedBuffsDurationTurns", 0)
	
	lastUpdatedDay = SAVE.loadVar(data, "lastUpdatedDay", -1)
	lastUpdatedSecond = SAVE.loadVar(data, "lastUpdatedSecond", -1)
	pregnancyWaitTimer = SAVE.loadVar(data, "pregnancyWaitTimer", 0)
	
	updateNonBattleEffects()

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

# GM.main.getFlag() is allowed here
func updateBodyparts():
	pass

func paintBodyparts():
	if(npcSkinData != null):
		for bodypartSlot in npcSkinData:
			if(!hasBodypart(bodypartSlot)):
				#Log.error(getID()+" doesn't have "+str(bodypartSlot)+" slot but we're trying to paint it anyway inside paintBodyparts()")
				continue
			var bodypart = getBodypart(bodypartSlot)
			var bodypartSkinData = npcSkinData[bodypartSlot]
			if(bodypartSkinData.has("skin")):
				bodypart.pickedSkin = bodypartSkinData["skin"]
			if(bodypartSkinData.has("r")):
				bodypart.pickedRColor = bodypartSkinData["r"]
			if(bodypartSkinData.has("g")):
				bodypart.pickedGColor = bodypartSkinData["g"]
			if(bodypartSkinData.has("b")):
				bodypart.pickedBColor = bodypartSkinData["b"]

func copySkinTo(otherNPC):
	otherNPC.pickedSkin = pickedSkin
	otherNPC.pickedSkinRColor = pickedSkinRColor
	otherNPC.pickedSkinGColor = pickedSkinGColor
	otherNPC.pickedSkinBColor = pickedSkinBColor
	otherNPC.applyBodypartsSkinData(npcSkinData)

# ["collar", "inmateuniform", {id="asd", data={}}]
func getDefaultEquipment():
	return []

func equipDefaultEquipmentEntrySafely(equipEntry):
	var itemID = equipEntry
	if(equipEntry is Dictionary):
		itemID = equipEntry["id"]
		
	var itemRef = GlobalRegistry.getItemRef(itemID)
	if(itemRef == null):
		return false
	
	var itemSlot = itemRef.getClothingSlot()
	if(itemSlot == null):
		return false
	
	if(getInventory().hasSlotEquipped(itemSlot)):
		return false
	
	var theItem
	if(!disableSerialization):
		theItem = GlobalRegistry.createItem(itemID)
	else:
		theItem = GlobalRegistry.createItemNoID(itemID)
	
	if(equipEntry is Dictionary):
		if(equipEntry.has("data")):
			theItem.loadData(equipEntry["data"])
		elif(equipEntry.has("datapackdata")):
			var foundData = equipEntry["datapackdata"]
			for dataID in foundData:
				theItem.applyDatapackEditVar(dataID, foundData[dataID])
	
	return getInventory().equipItem(theItem)

func createEquipment():
	var theEquip = getDefaultEquipment()
	
	for equipEntry in theEquip:
		equipDefaultEquipmentEntrySafely(equipEntry)

func restockEquipmentChance(chanceToEquip):
	var theEquip = getDefaultEquipment()
	
	for equipEntry in theEquip:
		if(RNG.chance(chanceToEquip)):
			equipDefaultEquipmentEntrySafely(equipEntry)

# Restraints that we forced onto the npc for example, anything that is not their default equipment
func getWrongEquippedItems(includeDamaged=true):
	var result = []
	
	var theEquip = getDefaultEquipment()
	var theEquipChecker = {}
	for equipEntry in theEquip:
		if(equipEntry is String):
			theEquipChecker[equipEntry] = true
		elif(equipEntry is Dictionary):
			theEquipChecker[equipEntry["id"]] = true
	
	for item in getInventory().getEquippedItems().values():
		if(item == null):
			continue
		if(!theEquipChecker.has(item.id) || (includeDamaged && item.isDamaged())):
			result.append(item)
	
	return result

func resetEquipment(keepPersistent = true, keepImportant = true, keepRestraints=false):
	var badItems = getWrongEquippedItems()
	for item in badItems:
		if(keepRestraints && item.isRestraint()):
			continue
		if(keepPersistent && item.isPersistent()):
			continue
		if(keepImportant && item.isImportant()):
			continue
		getInventory().removeEquippedItem(item)
	
	restockEquipmentChance(100)

func resetEquipmentHard(keepPersistent = true):
	if(keepPersistent):
		inventory.clearEquippedItemsKeepPersistent()
	else:
		inventory.clearEquippedItems()
	createEquipment()

func prepareForSexAsDom():
	#resetEquipment()
	pass

func processTime(_secondsPassed):
	for bodypart in processingBodyparts:
		if(bodypart == null || !is_instance_valid(bodypart)):
			continue
		bodypart.processTime(_secondsPassed)
	
	if(timedBuffsDurationSeconds > 0):
		timedBuffsDurationSeconds -= _secondsPassed
		if(timedBuffsDurationSeconds <= 0):
			timedBuffs.clear()
	
	for effectID in statusEffects:
		var effect = statusEffects[effectID]
		effect.processTime(_secondsPassed)
		
	if(menstrualCycle != null):
		menstrualCycle.processTime(_secondsPassed)
		
	if(!bodyFluids.isEmpty()):
		bodyFluids.drain(0.1 * _secondsPassed / 60.0)
		
	GM.GES.callGameExtenders(ExtendGame.npcProcessTime, [self, _secondsPassed])
	lastUpdatedDay = GM.main.getDays()
	lastUpdatedSecond = GM.main.getTime()
	if(isReadyToGiveBirth()):
		pregnancyWaitTimer += _secondsPassed
		if(shouldGiveBirth()):
			if(getMenstrualCycle() != null):
				if(getMenstrualCycle().isPregnantFromPlayer()):
					GM.main.addLogMessage("News", "You just received news that "+getName()+" gave birth to your children! You can check who in the nursery")
				else:
					GM.main.addLogMessage("News", "Rumors spread fast. You just received news that "+getName()+" gave birth to someone's children!")
				
				pregnancyWaitTimer = 0
				giveBirth()
		
func canDoSelfCare():
	# If character is in a scene, don't touch them
	if(GM.main != null && GM.main.characterIsVisible(getID())):
		return false
	# If they are a slave to the player, also don't touch them. They are chained to the floor 24/7
	if(isSlaveToPlayer()):
		return false
	return true
		
func hoursPassed(_howmuch):
	for bodypart in processingBodyparts:
		if(bodypart != null && is_instance_valid(bodypart)):
			bodypart.hoursPassed(_howmuch)

	if(canDoSelfCare()):
		var tookShowerChance = sqrt(_howmuch * 30.0)
		if(RNG.chance(tookShowerChance)):
			removeEffect(StatusEffect.DrenchedInPiss)
			removeEffect(StatusEffect.HasTallyMarks)
			removeEffect(StatusEffect.HasBodyWritings)
			removeEffect(StatusEffect.CoveredInCum)
			
		var removedRestraintsChance = sqrt(_howmuch * 20.0)
		if(RNG.chance(removedRestraintsChance)):
			var restraints = getInventory().getEquppedRestraints()
			var restraintAmount = restraints.size()
			var removedAtLeastOne = false
			if(restraints.size() > 0):
				for restraint in restraints:
					if(restraint.isImportant() || restraint.isPersistent()):
						restraintAmount -= 1
						continue
					
					var chanceModifier = 1.0
					var restraintData:RestraintData = restraint.getRestraintData()
					if(restraintData != null):
						if(restraintData.aiWontResist):
							restraintAmount -= 1
							continue
						chanceModifier /= restraintData.getLevel()
					
					if(RNG.chance(removedRestraintsChance * chanceModifier)):
						getInventory().removeEquippedItem(restraint)
						restraintAmount -= 1
						removedAtLeastOne = true
				
				# We removed all our restraints, time to dress up!
				if(restraintAmount == 0 && removedAtLeastOne):
					restockEquipmentChance(100)
		else:
			# Npcs occasionally check if they have all the items that they should have
			var checkEquipmentRandomlyChance = sqrt(_howmuch * 10.0)
			if(RNG.chance(checkEquipmentRandomlyChance) && !hasBlockedHands() && !hasBoundArms()):
				#restockEquipmentChance(100)
				resetEquipment()

	GM.GES.callGameExtenders(ExtendGame.npcHoursPassed, [self, _howmuch])

func updateNonBattleEffects():
	buffsHolder.calculateBuffs()
	
	for effect in GlobalRegistry.getStatusEffectsAlwaysCheckedForNPC():
		if(effect.shouldApplyTo(self)):
			addEffect(effect.id)
		else:
			removeEffect(effect.id)
		
	if(hasEnslaveQuest()):
		getEnslaveQuest().checkIfTasksGotCompleted()
	if(isSlaveToPlayer()):
		getNpcSlavery().checkIfTasksGotCompleted()
		
	GM.GES.callGameExtenders(ExtendGame.npcUpdateNonBattleEffects, [self])
	
	buffsHolder.calculateBuffs()

func onCharacterVisiblyPregnant():
	pregnancyWaitTimer = 0
	if(getMenstrualCycle() != null):
		if(getMenstrualCycle().isPregnantFromPlayer()):
			GM.pc.addSkillExperience(Skill.Breeder, 50)
			GM.main.addLogMessage("News", "You just received news that "+getName()+" is pregnant with your children.")
		
func onCharacterHeavyIntoPregnancy():
	#print(getName()+" is heavy into pregnancy")
	pass

func onCharacterReadyToGiveBirth():
	pregnancyWaitTimer = 0
	if(getBirthWaitTime() > 0 && getMenstrualCycle() != null):
		if(isSlaveToPlayer()):
			if(getMenstrualCycle().isPregnantFromPlayer()):
				GM.main.addLogMessage("News (Slave)", "You just received news that "+getName()+" is ready to give birth to your children. Since "+heShe()+" "+isAre()+" slave, it is your job to bring "+himHer()+" to the nursery.")
			else:
				GM.main.addLogMessage("News (Slave)", "You just received news that "+getName()+" is ready to give birth to someone's children. Since "+heShe()+" "+isAre()+" slave, it is your job to bring "+himHer()+" to the nursery.")
		elif(getMenstrualCycle().isPregnantFromPlayer()):
			GM.main.addLogMessage("News", "You just received news that "+getName()+" is ready to give birth to your children and now just waits for a good moment to do it. Maybe you can go check on them.")


# How much the npc will wait before giving birth alone (in seconds)
func getBirthWaitTime():
	return 0

func shouldGiveBirth():
	if(pregnancyWaitTimer < getBirthWaitTime()):
		return false
	if(!isReadyToGiveBirth()):
		return false
	if(GM.main.characterIsVisible(getID())):
		return false
	if(isSlaveToPlayer()):
		return false
	return true

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
	var oneWeekSeconds = 7*24*60*60
	var oneDaySeconds = 24*60*60
	var oneHourSeconds = 60*60
	var processedWeeks = 0
	
	# Processing entire days, then hours, then the rest
	var secondsToProcess = secondsDiff
	while(secondsToProcess > oneWeekSeconds):
		if(processedWeeks < 8): # After 2 months we stop processing to not lag as much
			processTime(oneWeekSeconds)
			processedWeeks += 1
		secondsToProcess -= oneWeekSeconds
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

func onStoppedProcessing():
	lastUpdatedDay = GM.main.getDays()
	lastUpdatedSecond = GM.main.getTime()

func getCharacterType():
	return npcCharacterType

func processBattleTurn():
	.processBattleTurn()

	GM.GES.callGameExtenders(ExtendGame.npcProcessBattleTurn, [self])
