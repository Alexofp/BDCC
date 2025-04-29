extends Character
class_name DynamicCharacter

var npcName = "BAD NAME"
var npcSpecies = ["canine"]
var npcGeneratedGender = NpcGender.Male
var npcSmallDescription = "One of the generated characters"
var npcThickness = 50
var npcFeminity = 0
var npcDefaultEquipment = []
var npcArchetypes = []
var npcAttacks = []
var temporaryCharacter = false
var flags = {}
var enslaveQuest = null
var npcSlavery = null
var npcChatColorOverride = ""
var npcMimicArtworkID = ""
var npcCustomSpeciesName = ""
var npcGender = null
var npcPronounsGender = null
var datapackID = null
var npcLootOverride = null
var extraSettings:DynCharExtraSettings = null
var tfHolder:TFHolder

func _init():
	npcHasMenstrualCycle = true

func _ready():
	tfHolder = TFHolder.new()
	tfHolder.setCharacter(self)

func _getName():
	return npcName

func getChatColor():
	if(npcChatColorOverride != ""):
		return npcChatColorOverride
	return .getChatColor()

func getGender():
	if(npcGender != null):
		return npcGender
	return NpcGender.toNormalGender(npcGeneratedGender)
	
func getPronounGender():
	if(npcPronounsGender != null):
		return npcPronounsGender
	if(npcGeneratedGender in [NpcGender.Herm, NpcGender.Shemale]):
		return Gender.Female
	return getGender()
	
func getSmallDescription() -> String:
	return npcSmallDescription

func getSpecies():
	return npcSpecies
	
func getSpeciesFullName():
	if(npcCustomSpeciesName != ""):
		return npcCustomSpeciesName
	return .getSpeciesFullName()
	
func getThickness() -> int:
	return npcThickness

func getFemininity() -> int:
	return npcFeminity

func setThickness(_newT:int):
	npcThickness = _newT
	updateAppearance()

func setFemininity(_newF:int):
	npcFeminity = _newF
	updateAppearance()

func createBodyparts():
	pass

func getDefaultEquipment():
	return npcDefaultEquipment

func _getAttacks():
	return npcAttacks

func deleteSelf():
	print(getID()+" SELF DELETED")
	GM.main.removeDynamicCharacter(getID())

func onStoppedProcessing():
	.onStoppedProcessing()
	if(temporaryCharacter):
		deleteSelf()

func setTemporary(newTemp:bool):
	temporaryCharacter = newTemp

func setFlag(flagID, value):
	flags[flagID] = value

func getFlag(flagID, defaultValue = null):
	if(!flags.has(flagID)):
		return defaultValue
	
	return flags[flagID]

func increaseFlag(flagID, addvalue = 1):
	setFlag(flagID, getFlag(flagID, 0) + addvalue)

func personalityChangesAfterSex():
	return true

func isDynamicCharacter():
	return true

func getLootTable(_battleName):
	if(isSlaveToPlayer()):
		return .getLootTable(_battleName)
	
	if(npcLootOverride != null):
		if(npcLootOverride.has("baseTableID")):
			var baseTable = GlobalRegistry.createLootTable(npcLootOverride["baseTableID"])
			if(baseTable == null):
				return .getLootTable(_battleName)
			if(npcLootOverride.has("creditsDropChance")):
				baseTable.creditsChance = npcLootOverride["creditsDropChance"]
			if(npcLootOverride.has("creditsMin")):
				baseTable.minCredits = npcLootOverride["creditsMin"]
			if(npcLootOverride.has("creditsMax")):
				baseTable.maxCredits = npcLootOverride["creditsMax"]
			if(npcLootOverride.has("customLoot")):
				var customLoot = npcLootOverride["customLoot"]
				if(customLoot != null && customLoot is Array):
					for lootLine in customLoot:
						if(lootLine.has("item") && lootLine.has("chance")):
							if(lootLine.has("min") && lootLine.has("max")):
								baseTable.addLoot(lootLine["chance"], [[lootLine["item"], lootLine["min"], lootLine["max"]]])
							else:
								baseTable.addLoot(lootLine["chance"], [lootLine["item"]])
			return baseTable
			
			
	if(npcCharacterType == CharacterType.Engineer):
		return EngineerLoot.new()
	if(npcCharacterType == CharacterType.Guard):
		return GuardLoot.new()
	if(npcCharacterType == CharacterType.Nurse):
		return MedicalLoot.new()
	if(npcCharacterType == CharacterType.Inmate):
		return InmateLoot.new()
	return .getLootTable(_battleName)

func getDefaultArtwork(_variant = []):
	if(false):
		return .getDefaultArtwork(_variant)
	
	return Images.getGenericCharacterArt(self, _variant)

func getBirthWaitTime():
	return 60*60*30 # Dynamic npcs wait 30 hours before giving birth

func hasEnslaveQuest():
	return enslaveQuest != null

func getEnslaveQuest() -> NpcEnslavementQuest:
	return enslaveQuest

func setEnslaveQuest(newQuest):
	enslaveQuest = newQuest

func isSlaveToPlayer():
	return npcSlavery != null

func getNpcSlavery() -> NpcSlave:
	return npcSlavery

func setNpcSlavery(newSlav):
	npcSlavery = newSlav

func onSexEvent(_event : SexEvent):
	.onSexEvent(_event)
	
	if(enslaveQuest != null):
		enslaveQuest.handleSexEvent(_event)
	
	if(npcSlavery != null):
		npcSlavery.handleSexEvent(_event)
	
func adjustArtworkVariant(_variant:Array):
	if(isFullyNaked() && !_variant.has("naked")):
		_variant.append("naked")
	
func shouldBeExcludedFromEncounters() -> bool:
	if(extraSettings != null && extraSettings.excludeEncounters):
		return true
	
	return .shouldBeExcludedFromEncounters()

func canForgetCharacter() -> bool:
	if(extraSettings != null && extraSettings.disableForget):
		return false
	
	return .canForgetCharacter()
	
func shouldGiveBirth():
	if(extraSettings != null && extraSettings.disableBirth):
		return false
		
	return .shouldGiveBirth()
	
func supportsDefaultGiveBirthScene() -> bool:
	if(extraSettings != null && extraSettings.disableBirth):
		return false
		
	return .supportsDefaultGiveBirthScene()
	
func canMeetCharacter() -> bool:
	if(extraSettings != null && extraSettings.disableMeet):
		return false
		
	return .canMeetCharacter()
	
# The whole thing is hack, never expect it to work or be supported
func copyEverythingFrom(otherCharacter): #:BaseCharacter
	var isPc = otherCharacter.isPlayer()
	
	npcName = otherCharacter.getName()
	npcSpecies = otherCharacter.getSpecies()
	if(otherCharacter.isDynamicCharacter()):
		npcGeneratedGender = otherCharacter.npcGeneratedGender
	else:
		var otherHasPenis = otherCharacter.hasPenis()
		var otherHasVag = otherCharacter.hasVagina()
		var otherHasTits = otherCharacter.hasNonFlatBreasts()
		if(otherHasPenis && otherHasVag):
			npcGeneratedGender = NpcGender.Herm
		elif(otherHasPenis && otherHasTits):
			npcGeneratedGender = NpcGender.Shemale
		elif(otherHasPenis):
			npcGeneratedGender = NpcGender.Male
		elif(otherHasVag && !otherHasTits):
			npcGeneratedGender = NpcGender.Peachboy
		else:
			npcGeneratedGender = NpcGender.Female
	npcSmallDescription = otherCharacter.getSmallDescription()
	npcThickness = otherCharacter.getThickness()
	npcFeminity = otherCharacter.getFemininity()
	if(!isPc):
		npcDefaultEquipment = otherCharacter.getDefaultEquipment()
	else:
		if(otherCharacter.inmateType == InmateType.General):
			npcDefaultEquipment = ["inmatecollar", "inmateuniform"]
		if(otherCharacter.inmateType == InmateType.HighSec):
			npcDefaultEquipment = ["inmatecollar", "inmateuniformHighsec"]
		if(otherCharacter.inmateType == InmateType.SexDeviant):
			npcDefaultEquipment = ["inmatecollar", "inmateuniformSexDeviant"]
	if(!isPc):
		npcMimicArtworkID = otherCharacter.getID()
	if(otherCharacter.isDynamicCharacter()):
		npcArchetypes = otherCharacter.npcArchetypes
	else:
		npcArchetypes = []
	if(!isPc):
		npcAttacks = otherCharacter._getAttacks()
	else:
		npcAttacks = ["biteattack", "simplekickattack", "shoveattack", "NpcScratch"]
	if(otherCharacter.isDynamicCharacter()):
		flags = otherCharacter.flags.duplicate(true)
	else:
		flags = {}
	npcChatColorOverride = otherCharacter.getChatColor()
	if(!isPc):
		npcStats = otherCharacter.npcStats.duplicate(true)
		npcLevel = otherCharacter.npcLevel
		npcLustInterests = otherCharacter.npcLustInterests.duplicate(true)
		npcPersonality = otherCharacter.npcPersonality.duplicate(true)
		npcFetishes = otherCharacter.npcFetishes.duplicate(true)
		npcDefaultFetishInterest = otherCharacter.npcDefaultFetishInterest
		npcArmor = otherCharacter.npcArmor.duplicate(true)
		npcBasePain = otherCharacter.npcBasePain
		npcBaseLust = otherCharacter.npcBaseLust
		npcBaseStamina = otherCharacter.npcBaseStamina
		npcBaseRestraintDodgeChanceMult = otherCharacter.npcBaseRestraintDodgeChanceMult
		npcRestraintStrugglePower = otherCharacter.npcRestraintStrugglePower
		npcCharacterType = otherCharacter.npcCharacterType
		npcSkinData = otherCharacter.npcSkinData.duplicate(true)
	else:
		npcCharacterType = CharacterType.Inmate
		npcBasePain = otherCharacter.getBasePainThreshold()
		npcBaseLust = otherCharacter.getBaseLustThreshold()
		npcBaseStamina = otherCharacter.getBaseMaxStamina()
	
	pickedSkin = otherCharacter.pickedSkin
	pickedSkinRColor = otherCharacter.pickedSkinRColor
	pickedSkinGColor = otherCharacter.pickedSkinGColor
	pickedSkinBColor = otherCharacter.pickedSkinBColor
	
	for bodypartSlot in otherCharacter.getBodyparts():
		if(!otherCharacter.hasBodypart(bodypartSlot)):
			bodyparts[bodypartSlot] = null
			continue
		var otherBodypart:Bodypart = otherCharacter.getBodypart(bodypartSlot)
		
		var newBodypart:Bodypart = GlobalRegistry.createBodypart(otherBodypart.id)
		newBodypart.loadData(otherBodypart.saveData().duplicate(true))
		giveBodypartUnlessSame(newBodypart)
	
	inventory.loadData(otherCharacter.getInventory().saveData().duplicate(true))
	for item in inventory.getItems():
		item.uniqueID = "item"+str(GlobalRegistry.generateUniqueID())
	for itemSlot in inventory.getEquippedItems():
		var item = inventory.getEquippedItem(itemSlot)
		item.uniqueID = "item"+str(GlobalRegistry.generateUniqueID())
	
	skillsHolder.loadData(otherCharacter.skillsHolder.saveData().duplicate(true))
	lustInterests.loadData(otherCharacter.lustInterests.saveData().duplicate(true))
	personality.loadData(otherCharacter.personality.saveData().duplicate(true))
	fetishHolder.loadData(otherCharacter.fetishHolder.saveData().duplicate(true))

func saveData():
	var data = {
		"npcLevel": npcLevel,
		"pain": pain,
		"npcBasePain": npcBasePain,
		"lust": lust,
		"npcBaseLust": npcBaseLust,
		"stamina": stamina,
		"npcBaseStamina": npcBaseStamina,
		"arousal": arousal,
		"consciousness": consciousness,
		"npcName": npcName,
		"npcSpecies": npcSpecies,
		"npcGeneratedGender": npcGeneratedGender,
		"npcSmallDescription": npcSmallDescription,
		"npcThickness": npcThickness,
		"npcFeminity": npcFeminity,
		"npcArchetypes": npcArchetypes,
		"npcAttacks": npcAttacks,
		"temporaryCharacter": temporaryCharacter,
		"flags": flags,
		"npcDefaultEquipment": npcDefaultEquipment,
		"npcCharacterType": npcCharacterType,
		"pickedSkin": pickedSkin,
		"pickedSkinRColor": pickedSkinRColor.to_html(),
		"pickedSkinGColor": pickedSkinGColor.to_html(),
		"pickedSkinBColor": pickedSkinBColor.to_html(),
		"npcChatColorOverride": npcChatColorOverride,
		"npcMimicArtworkID": npcMimicArtworkID,
		"npcCustomSpeciesName": npcCustomSpeciesName,
	}
	if(npcGender != null):
		data["npcGender"] = npcGender
	if(npcPronounsGender != null):
		data["npcPronounsGender"] = npcPronounsGender
	if(datapackID != null && datapackID != ""):
		data["datapackID"] = datapackID
	if(npcLootOverride != null):
		data["npcLootOverride"] = npcLootOverride
	if(npcBaseRestraintDodgeChanceMult != null && npcBaseRestraintDodgeChanceMult != 0.9):
		data["restraintDodgeChanceMult"] = npcBaseRestraintDodgeChanceMult
	if(npcRestraintStrugglePower != null && npcRestraintStrugglePower != 1.0):
		data["restraintStrugglePower"] = npcRestraintStrugglePower
	
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
	
	data["lustInterests"] = lustInterests.saveDataDynamicNpc()
	data["fetishHolder"] = fetishHolder.saveData()
	data["personality"] = personality.saveData()
	
	if(enslaveQuest == null):
		data["enslaveQuest"] = null
	else:
		data["enslaveQuest"] = enslaveQuest.saveData()
	
	if(npcSlavery == null):
		data["npcSlavery"] = null
	else:
		data["npcSlavery"] = npcSlavery.saveData()
	
	if(extraSettings != null):
		data["extraSettings"] = extraSettings.saveData()
	
	if(tfHolder != null):
		data["tfHolder"] = tfHolder.saveData()
	
	return data

func loadData(data):
	# Converting old-style npcGender into the new way
	var theNpcGender = null
	if(data.has("npcGender")):
		theNpcGender = SAVE.loadVar(data, "npcGender", null)
	if(theNpcGender != null):
		npcGeneratedGender = NpcGender.fromNormalGender(theNpcGender)
	else:
		npcGeneratedGender = SAVE.loadVar(data, "npcGeneratedGender", NpcGender.Male)
	
	if(data.has("npcGender")):
		npcGender = SAVE.loadVar(data, "npcGender", Gender.Male)
	if(data.has("npcPronounsGender")):
		npcPronounsGender = SAVE.loadVar(data, "npcPronounsGender", null)
	
	npcLevel = SAVE.loadVar(data, "npcLevel", 0)
	npcBasePain = SAVE.loadVar(data, "npcBasePain", 50)
	pain = SAVE.loadVar(data, "pain", 0)
	npcBaseLust = SAVE.loadVar(data, "npcBaseLust", 50)
	lust = SAVE.loadVar(data, "lust", 0)
	npcBaseStamina = SAVE.loadVar(data, "npcBaseStamina", 100)
	stamina = SAVE.loadVar(data, "stamina", 100)
	arousal = SAVE.loadVar(data, "arousal", 0.0)
	consciousness = SAVE.loadVar(data, "consciousness", 1.0)
	npcName = SAVE.loadVar(data, "npcName", "Error")
	npcSpecies = SAVE.loadVar(data, "npcSpecies", ["canine"])
	if(data.has("npcCustomSpeciesName")):
		npcCustomSpeciesName = SAVE.loadVar(data, "npcCustomSpeciesName", "")
	else:
		npcCustomSpeciesName = ""
	npcSmallDescription = SAVE.loadVar(data, "npcSmallDescription", "No description")
	npcThickness = SAVE.loadVar(data, "npcThickness", 50)
	npcFeminity = SAVE.loadVar(data, "npcFeminity", 50)
	npcArchetypes = SAVE.loadVar(data, "npcArchetypes", [])
	npcAttacks = SAVE.loadVar(data, "npcAttacks", [])
	temporaryCharacter = SAVE.loadVar(data, "temporaryCharacter", false)
	flags = SAVE.loadVar(data, "flags", {})
	npcDefaultEquipment = SAVE.loadVar(data, "npcDefaultEquipment", [])
	npcCharacterType = SAVE.loadVar(data, "npcCharacterType", CharacterType.Generic)
	if(data.has("npcChatColorOverride")):
		npcChatColorOverride = SAVE.loadVar(data, "npcChatColorOverride", "")
	if(data.has("npcMimicArtworkID")):
		npcMimicArtworkID = SAVE.loadVar(data, "npcMimicArtworkID", "")
	if(data.has("datapackID")):
		datapackID = SAVE.loadVar(data, "datapackID", "")
	if(data.has("npcLootOverride")):
		npcLootOverride = SAVE.loadVar(data, "npcLootOverride", {})
	if(data.has("extraSettings")):
		extraSettings = DynCharExtraSettings.new()
		extraSettings.loadData(SAVE.loadVar(data, "extraSettings", {}))
	else:
		extraSettings = null
	if(data.has("restraintDodgeChanceMult")):
		npcBaseRestraintDodgeChanceMult = SAVE.loadVar(data, "restraintDodgeChanceMult", 0.9)
	if(data.has("restraintStrugglePower")):
		npcRestraintStrugglePower = SAVE.loadVar(data, "restraintStrugglePower", 1.0)
		
	if(!data.has("pickedSkin")):
		applyRandomSkinAndColorsAndParts()
	else:
		pickedSkin = SAVE.loadVar(data, "pickedSkin", "EmptySkin")
		pickedSkinRColor = Color(SAVE.loadVar(data, "pickedSkinRColor", "ffffff"))
		pickedSkinGColor = Color(SAVE.loadVar(data, "pickedSkinGColor", "cccccc"))
		pickedSkinBColor = Color(SAVE.loadVar(data, "pickedSkinBColor", "999999"))
	resetEquipment()
	
	resetSlots()
	var loadedBodyparts = SAVE.loadVar(data, "bodyparts", {})
	for slot in loadedBodyparts:
		if(loadedBodyparts[slot] == null):
			bodyparts[slot] = null
			continue
		var id = SAVE.loadVar(loadedBodyparts[slot], "id", "errorbad")
		var bodypart = GlobalRegistry.createBodypart(id)
		if(bodypart == null):
			var replacementID = BodypartSlot.findReplacement(slot, id)
			if(replacementID == null || replacementID == ""):
				Log.printerr("Couldn't find an replacement bodypart for slot "+str(slot))
				continue
			bodypart = GlobalRegistry.createBodypart(replacementID)
			
		giveBodypart(bodypart, false)
		bodypart.loadData(SAVE.loadVar(loadedBodyparts[slot], "data", {}))
	checkSkins(true)
	
	loadStatusEffectsData(SAVE.loadVar(data, "statusEffects", {}))
	inventory.loadDataNPC(SAVE.loadVar(data, "inventory", {}), self)
	skillsHolder.loadData(SAVE.loadVar(data, "skills", {}))
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
	
	lustInterests.loadDataDynamicNpc(SAVE.loadVar(data, "lustInterests", {}))
	fetishHolder.loadData(SAVE.loadVar(data, "fetishHolder", {}))
	personality.loadData(SAVE.loadVar(data, "personality", {}))
	if(data.has("tfHolder") && tfHolder != null):
		tfHolder.loadData(SAVE.loadVar(data, "tfHolder", {}))

	if(data.has("enslaveQuest") && data["enslaveQuest"] != null):
		var newEnslaveQuest = NpcEnslavementQuest.new()
		newEnslaveQuest.setChar(self)
		setEnslaveQuest(newEnslaveQuest)
		newEnslaveQuest.loadData(SAVE.loadVar(data, "enslaveQuest", {}))
	else:
		enslaveQuest = null
	
	if(data.has("npcSlavery") && data["npcSlavery"] != null):
		var newNpcSlavery = NpcSlave.new()
		newNpcSlavery.setChar(self)
		setNpcSlavery(newNpcSlavery)
		newNpcSlavery.loadData(SAVE.loadVar(data, "npcSlavery", {}))
	else:
		npcSlavery = null

	updateAppearance()

func getInmateType():
	calculateNpcInmateType()
	return getFlag(CharacterFlag.InmateType, InmateType.Unknown)

func calculateNpcInmateType():
	if(getFlag(CharacterFlag.InmateType, InmateType.Unknown) != InmateType.Unknown):
		return
	
	if(!inventory.hasSlotEquipped(InventorySlot.Body)):
		return
	
	var uniform:ItemBase = inventory.getEquippedItem(InventorySlot.Body)
	if(uniform.hasTag(ItemTag.GeneralInmateUniform)):
		setFlag(CharacterFlag.InmateType, InmateType.General)
	elif(uniform.hasTag(ItemTag.HighSecurityInmateUniform)):
		setFlag(CharacterFlag.InmateType, InmateType.HighSec)
	elif(uniform.hasTag(ItemTag.SexualDeviantInmateUniform)):
		setFlag(CharacterFlag.InmateType, InmateType.SexDeviant)

func calculateNpcGeneratedGender():
	var otherHasPenis = hasPenis()
	var otherHasVag = hasVagina()
	var otherHasTits = hasNonFlatBreasts()
	
	if(otherHasPenis && otherHasVag):
		npcGeneratedGender = NpcGender.Herm
	elif(otherHasPenis && otherHasTits):
		npcGeneratedGender = NpcGender.Shemale
	elif(otherHasPenis):
		npcGeneratedGender = NpcGender.Male
	elif(otherHasVag && !otherHasTits):
		npcGeneratedGender = NpcGender.Peachboy
	else:
		npcGeneratedGender = NpcGender.Female

func loadFromDatapackCharacter(_datapack:Datapack, _datapackChar:DatapackCharacter, _isUpdating = false):
	if(_datapack != null):
		datapackID = _datapack.id
	npcName = _datapackChar.name
	npcSmallDescription = _datapackChar.description
	npcGender = _datapackChar.gender
	npcPronounsGender = _datapackChar.pronounsGender
	npcFeminity = _datapackChar.femininity
	npcThickness = _datapackChar.thickness
	
	if(_datapackChar.hasChatColor):
		npcChatColorOverride = "#"+_datapackChar.chatColor.to_html(false)
	
	npcSpecies = _datapackChar.species
	if(npcSpecies.size() <= 0):
		npcSpecies = [Species.Unknown]
	npcCustomSpeciesName = _datapackChar.customSpeciesName
	
	pickedSkin = _datapackChar.pickedSkin
	pickedSkinRColor = _datapackChar.pickedSkinRColor
	pickedSkinGColor = _datapackChar.pickedSkinGColor
	pickedSkinBColor = _datapackChar.pickedSkinBColor
	
	npcCharacterType = _datapackChar.characterType
	setFlag(CharacterFlag.InmateType, _datapackChar.inmateType)
	
	npcAttacks = _datapackChar.attacks.duplicate()
	
	skillsHolder.resetPickedPerks()
	skillsHolder.resetStats()
	
	skillsHolder.setLevel(_datapackChar.level)
	npcBasePain = _datapackChar.basePain
	npcBaseLust = _datapackChar.baseLust
	npcBaseStamina = _datapackChar.baseStamina
	
	npcBaseRestraintDodgeChanceMult = _datapackChar.restraintDodgeChanceMult
	npcRestraintStrugglePower = _datapackChar.restraintStrugglePower
	
	npcStats = _datapackChar.stats.duplicate()
	for statID in npcStats:
		if(GlobalRegistry.getStat(statID) != null):
			skillsHolder.setStat(statID, npcStats[statID])
	
	for perkID in _datapackChar.perks:
		if(GlobalRegistry.getPerk(perkID) != null):
			skillsHolder.addPerk(perkID)
	
	npcPersonality = _datapackChar.personality.duplicate()
	personality.clear()
	for statID in npcPersonality:
		personality.setStat(statID, npcPersonality[statID])
	
	npcFetishes = _datapackChar.fetishes.duplicate()
	fetishHolder.clear()
	for fetishID in npcFetishes:
		if(npcFetishes[fetishID] != FetishInterest.Neutral):
			fetishHolder.setFetish(fetishID, npcFetishes[fetishID])
	
	npcLustInterests = _datapackChar.lustInterests.duplicate()
	lustInterests.clear()
	for topicID in npcLustInterests:
		if(npcLustInterests[topicID] != Interest.Neutral):
			lustInterests.addInterest(topicID, npcLustInterests[topicID])
	
	resetSlots()
	var loadedBodyparts = _datapackChar.bodyparts
	for slot in loadedBodyparts:
		if(loadedBodyparts[slot] == null || loadedBodyparts[slot]["id"] == "" || loadedBodyparts[slot]["id"] == null):
			bodyparts[slot] = null
			continue
		var id = SAVE.loadVar(loadedBodyparts[slot], "id", "errorbad")
		var bodypart = GlobalRegistry.createBodypart(id)
		if(bodypart == null):
			var replacementID = BodypartSlot.findReplacement(slot, id)
			if(replacementID == null || replacementID == ""):
				Log.printerr("Couldn't find an replacement bodypart for slot "+str(slot))
				continue
			bodypart = GlobalRegistry.createBodypart(replacementID)
			
		#bodypart.loadData(SAVE.loadVar(loadedBodyparts[slot], "data", {}))
		var bodypartAttribs = SAVE.loadVar(loadedBodyparts[slot], "data", {})
		for attribID in bodypartAttribs:
			bodypart.applyAttribute(attribID, bodypartAttribs[attribID])
		if(loadedBodyparts[slot].has("pickedSkin")):
			bodypart.pickedSkin = loadedBodyparts[slot]["pickedSkin"]
			if(bodypart.pickedSkin == ""):
				bodypart.pickedSkin = null
		if(loadedBodyparts[slot].has("pickedR")):
			bodypart.pickedRColor = loadedBodyparts[slot]["pickedR"]
		if(loadedBodyparts[slot].has("pickedG")):
			bodypart.pickedGColor = loadedBodyparts[slot]["pickedG"]
		if(loadedBodyparts[slot].has("pickedB")):
			bodypart.pickedBColor = loadedBodyparts[slot]["pickedB"]
		giveBodypart(bodypart, false)
	checkSkins(true)
	
	npcDefaultEquipment = []
	inventory.clearEquippedItems()
	
	var datacharEquippedInv = _datapackChar.equippedItems
	for inventorySlot in datacharEquippedInv:
		var equipItemData = datacharEquippedInv[inventorySlot]
		
		if(equipItemData["id"] != null):
			var itemRef = GlobalRegistry.getItemRef(equipItemData["id"])
			if(itemRef == null):
				continue
			
			var newItem = GlobalRegistry.createItem(equipItemData["id"])
			
			var foundData = null
			if(equipItemData.has("data")):
				foundData = equipItemData["data"]
			
			if(inventory.equipItem(newItem)):
				if(equipItemData.has("autoEquip") && equipItemData["autoEquip"]):
					if(foundData != null):
						npcDefaultEquipment.append({id=equipItemData["id"], datapackdata=foundData})
					else:
						npcDefaultEquipment.append(equipItemData["id"]) # Gets reequipped if the character loses it after a while
				
				if(foundData != null):
					for dataID in foundData:
						newItem.applyDatapackEditVar(dataID, foundData[dataID])

	npcLootOverride = {
		baseTableID = _datapackChar.lootTableID,
		creditsDropChance = _datapackChar.lootCreditsChance,
		creditsMin = _datapackChar.lootCreditsMin,
		creditsMax = _datapackChar.lootCreditsMax,
		customLoot = _datapackChar.lootExtra.duplicate(),
	}
	
	if(npcGender == Gender.Male):
		npcGeneratedGender = NpcGender.Male
	elif(npcGender == Gender.Female):
		npcGeneratedGender = NpcGender.Female
	else:
		calculateNpcGeneratedGender()
	
	extraSettings = DynCharExtraSettings.new()
	extraSettings.excludeEncounters = _datapackChar.excludeEncounters
	extraSettings.disableForget = _datapackChar.disableForget
	extraSettings.disableBirth = _datapackChar.disableBirth
	extraSettings.disableMeet = _datapackChar.disableMeet
	
	updateNonBattleEffects()
	
	if(hasPenis()):
		fillBalls()
	if(isLactating()):
		fillBreasts()
	
	stamina = getMaxStamina()
	updateAppearance()

func saveOriginalTFData() -> Dictionary:
	var partSkinData:Dictionary = {}
	for bodypartSlot in bodyparts:
		var bodypart = getBodypart(bodypartSlot)
		if(bodypart == null):
			continue
		partSkinData[bodypartSlot] = bodypart.getTFSkinData()
	
	var result:Dictionary = {
		"species": npcSpecies,
		"femininity": npcFeminity,
		"thickness": npcThickness,
		"pickedSkin": pickedSkin,
		"pickedSkinRColor": pickedSkinRColor.to_html(),
		"pickedSkinGColor": pickedSkinGColor.to_html(),
		"pickedSkinBColor": pickedSkinBColor.to_html(),
		"gender": npcGender,
		"pronounsGender": npcPronounsGender,
		"partsSkins": partSkinData,
	}
	
	return result

func applyTFData(_data):
	npcSpecies = loadTFVar(_data, "species", npcSpecies)
	npcFeminity = loadTFVar(_data, "femininity", npcFeminity)
	npcThickness = loadTFVar(_data, "thickness", npcThickness)
	pickedSkin = loadTFVar(_data, "pickedSkin", pickedSkin)
	npcGender = loadTFVar(_data, "gender", npcGender)
	npcPronounsGender = loadTFVar(_data, "pronounsGender", npcPronounsGender)
	if(_data.has("pickedSkinRColor")):
		pickedSkinRColor = Util.tryFixColor(_data["pickedSkinRColor"], false)
	if(_data.has("pickedSkinGColor")):
		pickedSkinGColor = Util.tryFixColor(_data["pickedSkinGColor"], false)
	if(_data.has("pickedSkinBColor")):
		pickedSkinBColor = Util.tryFixColor(_data["pickedSkinBColor"], false)
	var partSkinData:Dictionary = loadTFVar(_data, "partsSkins", {})
	for bodypartSlot in bodyparts:
		var bodypart = getBodypart(bodypartSlot)
		if(bodypart == null || !partSkinData.has(bodypartSlot)):
			continue
		bodypart.applySkinData(partSkinData[bodypartSlot] if partSkinData.has(bodypartSlot) else {})

func getTFHolder():
	return tfHolder

func canApplySmartLocks() -> bool:
	return !temporaryCharacter
