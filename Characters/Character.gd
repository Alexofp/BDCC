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
				lustInterests.addInterest(interestID, interestData[0], interestData[1])
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
	addLust(getAmbientLust())
	addPain(getAmbientPain())

func afterFightEnded():
	.afterFightEnded()
	pain = 0
	lust = 0
	stamina = getMaxStamina()

func saveData():
	var data = {
		"pain": pain,
		"lust": lust,
		"stamina": stamina,
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
	
	return data

func loadData(data):
	pain = SAVE.loadVar(data, "pain", 0)
	lust = SAVE.loadVar(data, "lust", 0)
	stamina = SAVE.loadVar(data, "stamina", 100)
	
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
	for bodypart in processingBodyparts:
		if(bodypart == null || !is_instance_valid(bodypart)):
			continue
		bodypart.processTime(_secondsPassed)
		
	if(menstrualCycle != null):
		menstrualCycle.processTime(_secondsPassed)
		
func hoursPassed(_howmuch):
	for bodypart in processingBodyparts:
		if(bodypart != null && is_instance_valid(bodypart)):
			bodypart.hoursPassed(_howmuch)

func updateNonBattleEffects():
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
