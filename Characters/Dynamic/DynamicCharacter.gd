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

func _init():
	npcHasMenstrualCycle = true

func _getName():
	return npcName

func getGender():
	return NpcGender.toNormalGender(npcGeneratedGender)
	
func getPronounGender():
	if(getGender() == Gender.Androgynous):
		return Gender.Female
	return getGender()
	
func getSmallDescription() -> String:
	return npcSmallDescription

func getSpecies():
	return npcSpecies
	
func getThickness() -> int:
	return npcThickness

func getFemininity() -> int:
	return npcFeminity

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
	npcSmallDescription = SAVE.loadVar(data, "npcSmallDescription", "No description")
	npcThickness = SAVE.loadVar(data, "npcThickness", 50)
	npcFeminity = SAVE.loadVar(data, "npcFeminity", 50)
	npcArchetypes = SAVE.loadVar(data, "npcArchetypes", [])
	npcAttacks = SAVE.loadVar(data, "npcAttacks", [])
	temporaryCharacter = SAVE.loadVar(data, "temporaryCharacter", false)
	flags = SAVE.loadVar(data, "flags", {})
	npcDefaultEquipment = SAVE.loadVar(data, "npcDefaultEquipment", [])
	npcCharacterType = SAVE.loadVar(data, "npcCharacterType", CharacterType.Generic)
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
			
		bodypart.loadData(SAVE.loadVar(loadedBodyparts[slot], "data", {}))
		giveBodypart(bodypart, false)
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

	updateAppearance()
