extends BaseCharacter
class_name Player


signal location_changed(newloc)

var gamename = "Player"
var credits:int = 0
var location:String = "cellblock_orange_playercell"#"ScriptedRoom"

var pickedGender = Gender.Female
var pronounsGender = null
var pickedSpecies = ["feline"]
var inmateNumber = "12859"
var pickedFemininity: int = 50
var pickedThickness: int = 50
var inmateType = InmateType.General

# Messy stuff
var bodyFluids = []
var bodyMessiness = 0

# Intoxication stuff
var intoxication: float = 0.0
var intoxicationTolerance: float = 0.0
var timedBuffs: Array = []
var timedBuffsDurationSeconds: int = 0
var timedBuffsTurns: Array = []
var timedBuffsDurationTurns: int = 0

#
signal orificeBecomeMoreLoose(orificeName, newvalue, oldvalue)

# lust combat stuff
var lustCombatState


func _init():
	initialDodgeChance = 0.05 # Player has a small chance to dodge anything

func _ready():
	#GM.pc = self
	name = "Player"
	menstrualCycle = MenstrualCycle.new()
	menstrualCycle.setCharacter(self)
	menstrualCycle.start()
	
	lustCombatState = LustCombatState.new()
	lustCombatState.setCharacter(self)
	
	var _ok = menstrualCycle.connect("readyToGiveBirthOnce", self, "onPlayerReadyToGiveBirth")
	var _ok2 = menstrualCycle.connect("visiblyPregnant", self, "onPlayerVisiblyPregnant")
	
	getInventory().clear()
	giveBodypart(GlobalRegistry.createBodypart("felineleg"))
	var mybreasts: BodypartBreasts = GlobalRegistry.createBodypart("humanbreasts")
	mybreasts.size = BreastsSize.C
	giveBodypart(mybreasts)
	giveBodypart(GlobalRegistry.createBodypart("baldhair"))
	giveBodypart(GlobalRegistry.createBodypart("felinetail"))
	giveBodypart(GlobalRegistry.createBodypart("felinehead"))
	giveBodypart(GlobalRegistry.createBodypart("humanbody"))
	giveBodypart(GlobalRegistry.createBodypart("humanarms"))
	giveBodypart(GlobalRegistry.createBodypart("felineears"))
	giveBodypart(GlobalRegistry.createBodypart("vagina"))
	giveBodypart(GlobalRegistry.createBodypart("anus"))
	#giveBodypart(GlobalRegistry.createBodypart("caninepenis"))
	updateNonBattleEffects()
	
	#inventory.addItem(GlobalRegistry.createItem("testitem"))
	#inventory.addItem(GlobalRegistry.createItem("testitem"))
	#inventory.addItem(GlobalRegistry.createItem("ballgag"))
	
	#inventory.equipItem(GlobalRegistry.createItem("ballgag"))
	#skillsHolder.setStat(Stat.Sexiness, 10)
	#skillsHolder.setStat(Stat.Agility, 5)
	#skillsHolder.setStat(Stat.Vitality, 5)
	#skillsHolder.addSkillExperience(Skill.Combat, 250)

func getID():
	return "pc"

func setLocation(newRoomID:String):
	location = newRoomID
	#var roomInfo = GM.world.getRoomByID(location)
	#if(roomInfo):
	#	var roomName = roomInfo.getName()
	#	GM.ui.setLocationName(roomName)
	emit_signal("location_changed", newRoomID)
	
func getLocation():
	return location
	
func getName() -> String:
	return gamename
	
func setName(newname: String):
	newname = newname.replace("{", "")
	newname = newname.replace("}", "")
	newname = newname.replace("[", "")
	newname = newname.replace("]", "")
	newname = newname.replace("\"", "")
	if(newname == ""):
		newname = "Player"
	
	gamename = newname
	emit_signal("stat_changed")
	
func addCredits(_c: int):
	credits += _c
	emit_signal("stat_changed")

func getCredits() -> int:
	return credits

func isPlayer():
	return true

func _getAttacks():
	var attacks = ["PunchPCAttack", "BitePCAttack", "KickPCAttack",
	"TeaseBodyPCAttack",
	"TeaseCrotchPCAttack",
	"TeaseButtPCAttack",
	]
	
	attacks.append_array(skillsHolder.getPerkAttacks())
	
	return attacks

func hasBoundArms():
	return buffsHolder.hasBuff(Buff.RestrainedArmsBuff)

func hasBlockedHands():
	return buffsHolder.hasBuff(Buff.BlockedHandsBuff)

func hasBoundLegs():
	return buffsHolder.hasBuff(Buff.RestrainedLegsBuff)

func isBlindfolded():
	return buffsHolder.hasBuff(Buff.BlindfoldBuff)

func isBitingBlocked():
	return buffsHolder.hasBuff(Buff.GagBuff) || buffsHolder.hasBuff(Buff.RingGagBuff) || buffsHolder.hasBuff(Buff.MuzzleBuff)

func isGagged():
	return buffsHolder.hasBuff(Buff.GagBuff) || buffsHolder.hasBuff(Buff.RingGagBuff)

func isOralBlocked():
	return buffsHolder.hasBuff(Buff.GagBuff) || buffsHolder.hasBuff(Buff.MuzzleBuff)

func canHandleBlindness():
	return skillsHolder.hasPerk(Perk.BDSMBlindfold)
	
func calculateBuffs():
	updateNonBattleEffects()

# They may have effect on your damage in battles but they're not a 'battle' effects
func updateNonBattleEffects():
	buffsHolder.calculateBuffs()
	
	if(getIntoxicationLevel() >= 0.01):
		addEffect(StatusEffect.Intoxicated)
	else:
		removeEffect(StatusEffect.Intoxicated)
		
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
		
	if(isFullyNaked() || getExposedPrivates().size() > 0):
		addEffect(StatusEffect.Naked)
	else:
		removeEffect(StatusEffect.Naked)
		
	if(getStamina() <= 0):
		addEffect(StatusEffect.Exhausted)
	else:
		removeEffect(StatusEffect.Exhausted)
		
	if(getOutsideMessinessLevel() > 0):
		addEffect(StatusEffect.CoveredInCum)
	else:
		removeEffect(StatusEffect.CoveredInCum)

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
		
	emit_signal("stat_changed")

func processBattleTurn():
	.processBattleTurn()
	updateNonBattleEffects()
	skillsHolder.giveSkillExperienceBattleTurn()
	
	if(timedBuffsDurationTurns > 0):
		timedBuffsDurationTurns -= 1
		if(timedBuffsDurationTurns <= 0):
			timedBuffsTurns.clear()

func beforeFightStarted():
	.beforeFightStarted()
	if(lustCombatState != null):
		lustCombatState.enteredBattle()

func afterFightEnded():
	.afterFightEnded()
	
	timedBuffsTurns.clear()
	timedBuffsDurationTurns = 0
	
	if(lustCombatState != null):
		lustCombatState.exitedBattle()

func processTime(_secondsPassed):
	for bodypart in processingBodyparts:
		if(bodypart == null || !is_instance_valid(bodypart)):
			continue
		bodypart.processTime(_secondsPassed)
	
	if(intoxication > 0.0):
		intoxication -= _secondsPassed / 30000.0
		if(intoxication < 0.0):
			intoxication = 0.0
	
	if(timedBuffsDurationSeconds > 0):
		timedBuffsDurationSeconds -= _secondsPassed
		if(timedBuffsDurationSeconds <= 0):
			timedBuffs.clear()
	
	updateNonBattleEffects()
	
	for effectID in statusEffects:
		var effect = statusEffects[effectID]
		effect.processTime(_secondsPassed)
	
	if(menstrualCycle != null):
		menstrualCycle.processTime(_secondsPassed)

func hoursPassed(_howmuch):
	var currentLust = getLust()
	var targetLust = getAmbientLust()
	
	if(currentLust < targetLust):
		var addValue = min(_howmuch, (targetLust - currentLust))
		addLust(addValue)

	var currentPain = getPain()
	var targetPain = getAmbientPain()
	
	if(currentPain < targetPain):
		var addValue = min(_howmuch, (targetPain - currentPain))
		addPain(addValue)
		
	skillsHolder.hoursPassed(_howmuch)
	
	for bodypart in processingBodyparts:
		if(bodypart != null && is_instance_valid(bodypart)):
			bodypart.hoursPassed(_howmuch)
		
	if(intoxication <= 0.0 && intoxicationTolerance > 0.0):
		intoxicationTolerance -= 0.005
		if(intoxicationTolerance < 0.0):
			intoxicationTolerance = 0.0

func processStruggleTurn():
	var texts = []
	var damage = 0.0
	var addLust = 0
	var addPain = 0
	var addStamina = 0
	
	for item in getInventory().getEquppedRestraints():
		var restraintData: RestraintData = item.getRestraintData()
		var struggleData = restraintData.processStruggleTurn()
		
		if(struggleData == null):
			continue
			
		if(struggleData.has("damage")):
			damage += struggleData["damage"]
		if(struggleData.has("lust")):
			addLust += struggleData["lust"]
		if(struggleData.has("pain")):
			addPain += struggleData["pain"]
		if(struggleData.has("stamina")):
			addStamina += struggleData["stamina"]
		if(struggleData.has("text")):
			texts.append(struggleData["text"])
			#additionalStruggleText += struggleData["text"] + "\n\n"
		
	return {"damage": damage, "lust": addLust, "pain": addPain, "stamina": addStamina, "text": Util.join(texts, "\n\n")}

func getGender():
	return pickedGender

func getPronounGender():
	if(pronounsGender == null):
		return getGender()
	return pronounsGender

func setGender(newgender):
	pickedGender = newgender

func setPronounGender(newgender):
	pronounsGender = newgender

func getChatColor():
	var gender = getGender()
	
	if(gender == Gender.Male):
		return "#92B3DD"
	if(gender == Gender.Female):
		return "#FFB7B2"
	if(gender == Gender.Androgynous):
		return "#DABFFF"
	if(gender == Gender.Other):
		return "#C3E8BE"
	
	return "red"

func formatSay(text):
	var color = getChatColor()
	if(GM.ui != null):
		text = GM.ui.processString(text)
	
	if(isGagged() && hasPerk(Perk.BDSMGagTalk)):
		return "[color="+color+"]\""+Util.muffledSpeech(text)+"\" ("+text+") [/color]"
	
	if(isGagged()):
		text = Util.muffledSpeech(text)
	
	return "[color="+color+"]\""+text+"\"[/color]"

func getSpecies():
	return pickedSpecies

func setSpecies(species: Array):
	pickedSpecies = species
	pickedSpecies.sort()
	emit_signal("stat_changed")

func resetBodypartsToDefault():
	var newgender = getGender()
	if(newgender == Gender.Male):
		pickedFemininity = 0
	if(newgender == Gender.Female):
		pickedFemininity = 100
	if(newgender == Gender.Androgynous || newgender == Gender.Other):
		pickedFemininity = 50
	
	var speciesIds = getSpecies()
	var myspecies = []
	for specieID in speciesIds:
		myspecies.append(GlobalRegistry.getSpecies(specieID))
	if(myspecies.size() == 0):
		return
	resetSlots()
	var allslots = BodypartSlot.getAll()
	
	for slot in allslots:
		var choices = []
		
		for specie in myspecies:
			var bodypartID = specie.getDefaultForSlot(slot, getGender())
			if(bodypartID == null):
				continue
			var bodypart = GlobalRegistry.createBodypart(bodypartID)
			choices.append(bodypart)
			
		if(choices.size() == 0):
			continue
		
		var bestBodypart = choices[0]
		for bodypart in choices:
			if(bodypart.getHybridPriority() > bestBodypart.getHybridPriority()):
				bestBodypart = bodypart
				
		bodyparts[slot] = bestBodypart
		bodypartStorageNode.add_child(bestBodypart)
		bestBodypart.name = bestBodypart.visibleName
		bestBodypart.character = weakref(self)
		
	emit_signal("bodypart_changed")

func saveData():
	var data = {
		"gamename": gamename,
		"credits": credits,
		"pain": pain,
		"lust": lust,
		"stamina": stamina,
		"location": location,
		"pickedGender": pickedGender,
		"pronounsGender": pronounsGender,
		"pickedSpecies": pickedSpecies,
		"bodyMessiness": bodyMessiness,
		"bodyFluids": bodyFluids,
		"pickedFemininity": pickedFemininity,
		"pickedThickness": pickedThickness,
		"inmateType": inmateType,
	}
	
	data["bodyparts"] = {}
	for slot in bodyparts:
		if(bodyparts[slot] == null):
			data["bodyparts"][slot] = null
			continue
		
		data["bodyparts"][slot] = {
			"id": bodyparts[slot].id,
			"data": bodyparts[slot].saveData(),
		}
	
	data["statusEffects"] = saveStatusEffectsData()
	data["inventory"] = inventory.saveData()
	data["skills"] = skillsHolder.saveData()
	data["menstrualCycle"] = menstrualCycle.saveData()
	
	data["timedBuffs"] = saveBuffsData(timedBuffs)
	data["timedBuffsDurationSeconds"] = timedBuffsDurationSeconds
	data["timedBuffsTurns"] = saveBuffsData(timedBuffsTurns)
	data["timedBuffsDurationTurns"] = timedBuffsDurationTurns
	data["intoxication"] = intoxication
	data["intoxicationTolerance"] = intoxicationTolerance
	
	return data

func loadData(data):
	gamename = SAVE.loadVar(data, "gamename", "Player")
	credits = SAVE.loadVar(data, "credits", 0)
	pain = SAVE.loadVar(data, "pain", 0)
	lust = SAVE.loadVar(data, "lust", 0)
	stamina = SAVE.loadVar(data, "stamina", 100)
	location = SAVE.loadVar(data, "location", "ScriptedRoom")
	pickedGender = SAVE.loadVar(data, "pickedGender", Gender.Female)
	pronounsGender = SAVE.loadVar(data, "pronounsGender", null)
	pickedSpecies = SAVE.loadVar(data, "pickedSpecies", ["human"])
	bodyMessiness = SAVE.loadVar(data, "bodyMessiness", 0)
	bodyFluids = SAVE.loadVar(data, "bodyFluids", [])
	pickedFemininity = SAVE.loadVar(data, "pickedFemininity", 50)
	pickedThickness = SAVE.loadVar(data, "pickedThickness", 50)
	inmateType = SAVE.loadVar(data, "inmateType", InmateType.General)
	
	resetSlots()
	var loadedBodyparts = SAVE.loadVar(data, "bodyparts", {})
	for slot in loadedBodyparts:
		if(loadedBodyparts[slot] == null):
			bodyparts[slot] = null
			continue
		var id = SAVE.loadVar(loadedBodyparts[slot], "id", "humanleg")
		var bodypart = GlobalRegistry.createBodypart(id)
		bodypart.loadData(SAVE.loadVar(loadedBodyparts[slot], "data", {}))
		giveBodypart(bodypart, false)
	
	loadStatusEffectsData(SAVE.loadVar(data, "statusEffects", {}))
	inventory.loadData(SAVE.loadVar(data, "inventory", {}))
	skillsHolder.loadData(SAVE.loadVar(data, "skills", {}))
	menstrualCycle.loadData(SAVE.loadVar(data, "menstrualCycle", {}))
	
	timedBuffs = loadBuffsData(SAVE.loadVar(data, "timedBuffs", []))
	timedBuffsDurationSeconds = SAVE.loadVar(data, "timedBuffsDurationSeconds", 0)
	timedBuffsTurns = loadBuffsData(SAVE.loadVar(data, "timedBuffsTurns", []))
	timedBuffsDurationTurns = SAVE.loadVar(data, "timedBuffsDurationTurns", 0)
	intoxication = SAVE.loadVar(data, "intoxication", 0.0)
	intoxicationTolerance = SAVE.loadVar(data, "intoxicationTolerance", 0.0)
	
	checkLocation()
		
	updateNonBattleEffects()
	emit_signal("bodypart_changed")

func checkLocation():
	var _roomInfo = GM.world.getRoomByID(getLocation())
	if(_roomInfo == null):
		printerr("Player's location '"+str(location)+"' doesn't exists, reseting them to their cell")
		location = getCellLocation()

func saveBuffsData(buffs):
	var data = []
	
	for buff in buffs:
		var buffData = {
			"id": buff.id,
			"buffdata": buff.saveData(),
		}
		data.append(buffData)
	return data

func loadBuffsData(data):
	var result = []
	
	for buffFullData in data:
		var id = SAVE.loadVar(buffFullData, "id", "error")
		var buffdata = SAVE.loadVar(buffFullData, "buffdata", {})
		
		var buff: BuffBase = GlobalRegistry.createBuff(id)
		buff.loadData(buffdata)
		result.append(buff)
	return result
		

func getFightState(_battleName):
	if(getPainLevel() > getLustLevel()):
		var mypain = getPainLevel() * 100
		
		if(mypain >= 70):
			return "Everything hurts, you are barely able to continue fighting."
		if(mypain >= 50):
			return "The pain begins to take over your body, it's hard to concentrate on fighting"
		if(mypain >= 10):
			return "You got bruised but doing fine otherwise"
	else:
		var mylust = getLustLevel() * 100
		
		if(mylust >= 70):
			return "You feel so horny, you just can't stop thinking about your opponent, your hands sneak down to your privates and tease them"
		if(mylust >= 50):
			return "You feel very lusty, you find your opponent to be quite hot"
		if(mylust >= 10):
			return "You are slightly aroused but you manage to control it just fine"
		
	return "You seem to be doing just fine during this moment in a fight"

func getBodypartTooltipName(_bodypartSlot):
	if(hasBodypart(_bodypartSlot)):
		var bodypart: Bodypart = getBodypart(_bodypartSlot)
		return bodypart.getName()
	
	return "error"

func getBodypartTooltipInfo(_bodypartSlot):
	if(hasBodypart(_bodypartSlot)):
		var bodypart: Bodypart = getBodypart(_bodypartSlot)
		return bodypart.getTooltipInfo()
	
	return "error"

func hasPenis():
	return hasBodypart(BodypartSlot.Penis)

func hasReachablePenis():
	return hasPenis()

func hasVagina():
	return hasBodypart(BodypartSlot.Vagina)

func hasReachableVagina():
	return hasVagina()

func hasHair():
	return hasBodypart(BodypartSlot.Hair) && getBodypart(BodypartSlot.Hair).id != "baldhair"

func hasTail():
	return hasBodypart(BodypartSlot.Tail)
	
func hasHorns():
	return hasBodypart(BodypartSlot.Horns)

func hasNonFlatBreasts():
	var breasts = getBodypart(BodypartSlot.Breasts)
	
	var size = breasts.size
	
	if(size > BreastsSize.FLAT):
		return true
	else:
		return false

func hasBigBreasts():
	var breasts = getBodypart(BodypartSlot.Breasts)
	
	var size = breasts.size
	
	if(size > BreastsSize.B):
		return true
	else:
		return false

func afterSleeping():
	addStamina(getMaxStamina())
	addPain(-100)
	skillsHolder.onNewDay()
	for item in getInventory().getEquppedRestraints():
		item.getRestraintData().resetOnNewDay()
	
	if(isPregnant() && getPregnancyProgress() <= 0.5 && RNG.chance(30)):
		GM.main.addLogMessage("Nausea", "You wake up and feel kinda nauseous.")
		addEffect(StatusEffect.PregnancySickness)
		
	updateNonBattleEffects()

func afterSleepingInBed():
	afterSleeping()

func afterRestingInBed(seconds):
	var _hours = floor(seconds/3600.0)
	
	addStamina(_hours * 10)
	updateNonBattleEffects()

func isFullyNaked():
	var slotsToBeFullyNaked = [InventorySlot.Body, InventorySlot.UnderwearBottom, InventorySlot.UnderwearTop]
	
	for slot in slotsToBeFullyNaked:
		if(inventory.hasSlotEquipped(slot)):
			return false
	
	return true

func getExposedPrivates():
	var possiblePrivates = [BodypartSlot.Breasts, BodypartSlot.Penis, BodypartSlot.Vagina, BodypartSlot.Anus]
	var result = []
	var coveredParts = {}
	
	var equippedItems = inventory.getAllEquippedItems()
	for inventorySlot in equippedItems:
		var item = equippedItems[inventorySlot]
		var itemCovers = item.coversBodyparts()
		for itemCover in itemCovers:
			coveredParts[itemCover] = true
	
	for possiblePrivatePart in possiblePrivates:
		if(!hasBodypart(possiblePrivatePart)):
			continue
		
		var bodypart = getBodypart(possiblePrivatePart)
		if(bodypart.safeWhenExposed()):
			continue
		
		if(!coveredParts.has(possiblePrivatePart) || !coveredParts[possiblePrivatePart]):
			result.append(possiblePrivatePart)
		
	return result

func isBodypartCovered(bodypartSlot):
	var coveredParts = {}
	
	var equippedItems = inventory.getAllEquippedItems()
	for inventorySlot in equippedItems:
		var item = equippedItems[inventorySlot]
		var itemCovers = item.coversBodyparts()
		for itemCover in itemCovers:
			coveredParts[itemCover] = true
	
	if(coveredParts.has(bodypartSlot) && coveredParts[bodypartSlot]):
		return true
	return false

func isWearingAnyUnderwear():
	return inventory.hasSlotEquipped(InventorySlot.UnderwearBottom) || inventory.hasSlotEquipped(InventorySlot.UnderwearTop)

func afterEatingAtCanteen():
	addStamina(100)
	addPain(-20)
	updateNonBattleEffects()

func afterTakingAShower():
	addStamina(30)
	clearBodyFluids()
	clearBodywritings()
	clearTallymarks()
	updateNonBattleEffects()

func orgasmFrom(_characterID: String):
	cumOnFloor()
	
	addLust(-lust)
	if(hasPerk(Perk.SexLustPassion)):
		addStamina(20)
	updateNonBattleEffects()

func cumOnFloor():
	if(hasBodypart(BodypartSlot.Penis)):
		var penis:BodypartPenis = getBodypart(BodypartSlot.Penis)
		return penis.getFluidProduction().drain()

func cummedOnBy(characterID, sourceType = null, howMessy: int = 1):	
	var ch = GlobalRegistry.getCharacter(characterID)
	if(sourceType == null):
		if(ch.getGender() == Gender.Female):
			sourceType = BodilyFluids.FluidSource.Vagina
		else:
			sourceType = BodilyFluids.FluidSource.Penis
	
	coverBodyWithFluid(characterID, ch.getFluidType(sourceType), howMessy)

func coverBodyWithFluid(characterID, fluidType, howMuchLevels: int = 1):
	bodyFluids.append([characterID, fluidType, howMuchLevels])
	bodyMessiness += howMuchLevels
	if(bodyMessiness < 0):
		bodyMessiness = 0
	if(bodyMessiness > BodilyFluids.MaxMessinessLevel):
		bodyMessiness = BodilyFluids.MaxMessinessLevel
	
func clearBodyFluids():
	bodyFluids.clear()
	bodyMessiness = 0

func getOutsideMessinessLevel():
	return bodyMessiness

func getOutsideMessinessFluidList():
	var myfluids = []
	for bodyFluidData in bodyFluids:
		if(!myfluids.has(bodyFluidData[1])):
			myfluids.append(bodyFluidData[1])
	return myfluids

func getPenisSize():
	if(!hasBodypart(BodypartSlot.Penis)):
		return 0.0
	
	var bodypart = getBodypart(BodypartSlot.Penis)
	return bodypart.getLength()

func gotOrificeStretchedWith(bodypartSlot, insertionSize, showMessages = true):
	var thebodypart = getBodypart(bodypartSlot)
	
	var orifice: Orifice = thebodypart.getOrifice()
	var oldLooseness = orifice.getLooseness()
	thebodypart.handleInsertion(insertionSize)
	var newLooseness = orifice.getLooseness()
	if(newLooseness > oldLooseness && showMessages):
		emit_signal("orificeBecomeMoreLoose", thebodypart.getOrificeName(), newLooseness, oldLooseness)

func gotFuckedBy(bodypartSlot, characterID, showMessages = true):
	if(!hasBodypart(bodypartSlot)):
		return
	
	var ch = GlobalRegistry.getCharacter(characterID)
	assert(ch != null)
	gotOrificeStretchedWith(bodypartSlot, ch.getPenisSize(), showMessages)

func gotVaginaFuckedBy(characterID, showMessages = true):
	return gotFuckedBy(BodypartSlot.Vagina, characterID, showMessages)

func gotAnusFuckedBy(characterID, showMessages = true):
	return gotFuckedBy(BodypartSlot.Anus, characterID, showMessages)

func gotThroatFuckedBy(characterID, showMessages = true):
	return gotFuckedBy(BodypartSlot.Head, characterID, showMessages)

func getExposure():
	return buffsHolder.getExposure()

func getInmateNumber():
	return inmateNumber

func getFullInmateNumber():
	return "P-"+inmateNumber

func getBodypartLewdSizeAdjective(bodypartSlot):
	if(!hasBodypart(bodypartSlot)):
		return "ERROR:NO BODYPART IN SLOT " + str(bodypartSlot)
	return getBodypart(bodypartSlot).getLewdSizeAdjective()
	
func getBodypartLewdAdjective(bodypartSlot):
	if(!hasBodypart(bodypartSlot)):
		return "ERROR:NO BODYPART IN SLOT " + str(bodypartSlot)
	return getBodypart(bodypartSlot).getLewdAdjective()

func getBodypartLewdName(bodypartSlot):
	if(!hasBodypart(bodypartSlot)):
		return "ERROR:NO BODYPART IN SLOT " + str(bodypartSlot)
	return getBodypart(bodypartSlot).getLewdName()

func getBodypartLewdDescriptionAndName(bodypartSlot):
	if(!hasBodypart(bodypartSlot)):
		return "ERROR:NO BODYPART IN SLOT " + str(bodypartSlot)
	return getBodypart(bodypartSlot).getLewdDescriptionAndName()

func getBodypartLewdDescriptionAndNameWithA(bodypartSlot):
	if(!hasBodypart(bodypartSlot)):
		return "ERROR:NO BODYPART IN SLOT " + str(bodypartSlot)
	return getBodypart(bodypartSlot).getLewdDescriptionAndNameWithA()

func getFemininity() -> int:
	return pickedFemininity

func getThickness() -> int:
	return pickedThickness

func getPickableAttributes():
	return {
		"femininity": {
			"text": "Pick how feminine or masculine you are",
			"textButton": "Femininity",
			"buttonDesc": "Pick how feminine or masculine you are",
			"options": [
				[0, "Very masculine", "Fully masculine"],
				[25, "Masculine", "75% Masculine"],
				[50, "Androgynous", "Half-way between feminine and masculine"],
				[75, "Feminine", "75% Feminine"],
				[100, "Very feminine", "Fully feminine"],
			]
		},
		"thickness": {
			"text": "Pick how thick you are",
			"textButton": "Thickness",
			"buttonDesc": "Pick how thick you are",
			"options": [
				[0, "Skinny", "0% thick"],
				[25, "Slim", "25% thick"],
				[50, "Average", "50% thick"],
				[75, "Thick", "75% thick"],
				[100, "Very thick", "100% thicc"],
				[125, "125% thick", "Sooo thicc"],
				[150, "150% thick", "Sooo thicc"],
				[175, "175% thick", "Sooo thicc"],
				[200, "200% thick", "Sooo thicc"],
			]
		},
	}
	
func applyAttribute(_attrID: String, _attrValue):
	if(_attrID == "femininity"):
		pickedFemininity = _attrValue
	if(_attrID == "thickness"):
		pickedThickness = _attrValue

func getAttributesText():
	return [
		["Femininity", str(pickedFemininity)+"%"],
		["Thickness", str(pickedThickness)+"%"],
	]

func freeMouthDeleteAll():
	return getInventory().removeEquippedItemsWithBuff(Buff.GagBuff)
	
func freeHandsDeleteAll():
	return getInventory().removeEquippedItemsWithBuff(Buff.RestrainedArmsBuff)
	
func freeLegsDeleteAll():
	return getInventory().removeEquippedItemsWithBuff(Buff.RestrainedLegsBuff)
	
func freeEyesDeleteAll():
	return getInventory().removeEquippedItemsWithBuff(Buff.BlindfoldBuff)

func canUndress():
	var slotsToCheck = [InventorySlot.Body, InventorySlot.UnderwearTop, InventorySlot.UnderwearBottom]
	for slot in slotsToCheck:
		if(getInventory().hasSlotEquipped(slot)):
			return true
	return false

func getUndressMessage(withS):
	var res = []
	var slotsToCheck = [InventorySlot.Body, InventorySlot.UnderwearTop, InventorySlot.UnderwearBottom]
	
	for slot in slotsToCheck:
		if(getInventory().hasSlotEquipped(slot)):
			var item = getInventory().getEquippedItem(slot)
			res.append(item.getTakingOffStringLong(withS))
	
	return Util.humanReadableList(res, "and also")

func hasIllegalItems():
	if(inventory.getItemsWithTag(ItemTag.Illegal).size() > 0):
		return true
	if(inventory.getEquippedItemsWithTag(ItemTag.Illegal).size() > 0):
		return true
	return false

func setInmateType(newtype):
	inmateType = newtype

func getInmateType():
	return inmateType

func getInmateColorString():
	return InmateType.getColorName(getInmateType())

func getCellLocation():
	if(inmateType == InmateType.General):
		return "cellblock_orange_playercell"
	if(inmateType == InmateType.HighSec):
		return "cellblock_red_playercell"
	if(inmateType == InmateType.SexDeviant):
		return "cellblock_pink_playercell"
	
	return "cellblock_orange_playercell"

func invCanEquipSlot(slot):
	if(slot == InventorySlot.Penis && !hasPenis()):
		return false
	if(slot == InventorySlot.Vagina && !hasVagina()):
		return false
	
	return true

func calculateBestRestraintLevel():
	var restraintsCount = 0
	var levelsTotal = 0
	for item in getInventory().getEquppedRestraints():
		var restraintData: RestraintData = item.getRestraintData()
		
		if(!restraintData.canStruggle()):
			continue
		
		restraintsCount += 1
		levelsTotal += restraintData.getLevel()
	
	if(restraintsCount < 2 || RNG.chance(20)):
		return RNG.randi_range(1, 5)
	
	var average = float(levelsTotal) / float(restraintsCount)

	if(average >= 2.5):
		return RNG.randi_range(1, 3)
	else:
		return RNG.randi_range(3, 5)

func addIntoxication(howmuch: float):
	intoxication += howmuch
	intoxication = clamp(intoxication, 0.0, 2.0)
	
	if(intoxication >= 0.5):
		intoxicationTolerance += howmuch / 20.0
		if(intoxicationTolerance > 1.0):
			intoxicationTolerance = 1.0
	
	updateNonBattleEffects()

func getIntoxicationLevel() -> float:
	return intoxication

func getIntoxicationTolerance() -> float:
	return intoxicationTolerance

func getIntoxicationMod() -> float:
	if(intoxicationTolerance < 0.2):
		return 1.0
	
	return 1.0 - (intoxicationTolerance - 0.1) / 0.9 * 0.4

func canIntoxicateMore(_howmuch: float):
	if(getIntoxicationLevel() >= 1.0):
		return false

	return true

func addTimedBuffs(buffs: Array, seconds):
	for newbuff in buffs:
		var foundBuff = false
		for oldbuff in timedBuffs:
			if(newbuff.id == oldbuff.id):
				oldbuff.combine(newbuff)
				foundBuff = true
				break
		if(!foundBuff):
			timedBuffs.append(newbuff)
	
	if(seconds > timedBuffsDurationSeconds):
		timedBuffsDurationSeconds = seconds
	updateNonBattleEffects()

func addTimedBuffsTurns(buffs: Array, turns):
	if(!GM.main.supportsBattleTurns()):
		return
	
	for newbuff in buffs:
		var foundBuff = false
		for oldbuff in timedBuffsTurns:
			if(newbuff.id == oldbuff.id):
				oldbuff.combine(newbuff)
				foundBuff = true
				break
		if(!foundBuff):
			timedBuffsTurns.append(newbuff)
	
	if(turns > timedBuffsDurationTurns):
		timedBuffsDurationTurns = turns
	updateNonBattleEffects()

func canBeMilked():
	if(!hasBodypart(BodypartSlot.Breasts)):
		return false
	var breasts: BodypartBreasts = getBodypart(BodypartSlot.Breasts)
	var production: FluidProduction = breasts.getFluidProduction()
	return production.getFluidAmount() > 0.0

func milk(howmuch = 1.0):
	var breasts: BodypartBreasts = getBodypart(BodypartSlot.Breasts)
	var production: FluidProduction = breasts.getFluidProduction()
	var howMuchMilk = production.drain(howmuch)
	production.afterMilked()
	return howMuchMilk

func canBeSeedMilked():
	if(!hasBodypart(BodypartSlot.Penis)):
		return false
	var penis: BodypartPenis = getBodypart(BodypartSlot.Penis)
	var production: FluidProduction = penis.getFluidProduction()
	return production.getFluidAmount() > 0.0

func milkSeed(howmuch = 1.0):
	var penis: BodypartPenis = getBodypart(BodypartSlot.Penis)
	var production: FluidProduction = penis.getFluidProduction()
	var howMuchSeed = production.drain(howmuch)
	production.afterMilked()
	return howMuchSeed

func addTallymark(zone):
	addEffect(StatusEffect.HasTallyMarks, [zone])

func addTallymarkPickBestZone(zonelist):
	addEffect(StatusEffect.HasTallyMarks, [zonelist])

func addTallymarkFace():
	addTallymarkPickBestZone([
		BodyWritingsZone.CheekLeft,
		BodyWritingsZone.CheekRight,
	])

func addTallymarkCrotch():
	addTallymarkPickBestZone([
		BodyWritingsZone.LowerAbdomen,
		BodyWritingsZone.HipLeft,
		BodyWritingsZone.HipRight,
		BodyWritingsZone.ButtcheekLeft,
		BodyWritingsZone.ButtcheekRight,
		BodyWritingsZone.ThighLeft,
		BodyWritingsZone.ThighRight,
	])

func addTallymarkButt():
	addTallymarkCrotch()

func hasTallymarks():
	return hasEffect(StatusEffect.HasTallyMarks)

func clearTallymarks():
	removeEffect(StatusEffect.HasTallyMarks)

func addBodywriting(zone, writingID):
	addEffect(StatusEffect.HasBodyWritings, [zone, writingID])

func hasBodywritings():
	return hasEffect(StatusEffect.HasBodyWritings)

func clearBodywritings():
	removeEffect(StatusEffect.HasBodyWritings)

func hasCondoms():
	return getInventory().getItemsWithTag(ItemTag.Condom).size() > 0

func useBestCondom():
	var condoms = getInventory().getItemsWithTag(ItemTag.Condom)
	if(condoms.size() <= 0):
		return null
	
	var bestObject = null
	var bestChance = -99.0
	for condom in condoms:
		if(condom.getCondomBreakChance() > bestChance):
			bestChance = condom.getCondomBreakChance()
			bestObject = condom
	
	if(bestObject != null):
		bestObject.removeXOrDestroy(1)
	return bestChance
	
func onGivingBirth(_impregnatedEggCells: Array, _newkids: Array):
	var amountPerOrifice = {}
	for egg in _impregnatedEggCells:
		if(!amountPerOrifice.has(egg.getOrifice())):
			amountPerOrifice[egg.getOrifice()] = 0
		amountPerOrifice[egg.getOrifice()] += 1
	
	# This is meh
	var mapping = {
		OrificeType.Vagina: BodypartSlot.Vagina,
		OrificeType.Anus: BodypartSlot.Anus,
		OrificeType.Throat: BodypartSlot.Head,
	}
	
	for orificeType in mapping:
		if(!amountPerOrifice.has(orificeType)):
			continue
		
		var amountToStretch = sqrt(amountPerOrifice[orificeType]) * 50.0
		
		gotOrificeStretchedWith(mapping[orificeType], amountToStretch)

func onPlayerVisiblyPregnant():
	GM.main.addLogMessage("Uh oh", "You notice that your belly is more inflated that normally. You can't deny it anymore, you are pregnant..")

func onPlayerReadyToGiveBirth():
	GM.main.addLogMessage("It's time..", "Your belly is so swollen, it's hard to walk! You feel ready to give birth, maybe it's time to visit the nursery.")

func getLustCombatState():
	return lustCombatState
