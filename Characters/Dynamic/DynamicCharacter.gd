extends Character
class_name DynamicCharacter

var npcName = "BAD NAME"
var npcSpecies = ["canine"]
var npcGender = Gender.Male
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
	return npcGender
	
func getPronounGender():
	if(npcGender == Gender.Androgynous):
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

func createEquipment():
	for itemID in getDefaultEquipment():
		getInventory().equipItem(GlobalRegistry.createItemNoID(itemID))

func _getAttacks():
	return npcAttacks

func deleteSelf():
	print(getID()+" SELF DELETED")
	GM.main.removeDynamicCharacter(getID())

func onStoppedProcessing():
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

func saveData():
	var data = {
		"pain": pain,
		"lust": lust,
		"stamina": stamina,
		"arousal": arousal,
		"consciousness": consciousness,
		"npcName": npcName,
		"npcSpecies": npcSpecies,
		"npcGender": npcGender,
		"npcSmallDescription": npcSmallDescription,
		"npcThickness": npcThickness,
		"npcFeminity": npcFeminity,
		"npcArchetypes": npcArchetypes,
		"npcAttacks": npcAttacks,
		"temporaryCharacter": temporaryCharacter,
		"flags": flags,
		"npcDefaultEquipment": npcDefaultEquipment,
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
	data["lustInterests"] = lustInterests.saveData()
	if(menstrualCycle != null):
		data["menstrualCycle"] = menstrualCycle.saveData()

	data["timedBuffs"] = saveBuffsData(timedBuffs)
	data["timedBuffsDurationSeconds"] = timedBuffsDurationSeconds
	data["timedBuffsTurns"] = saveBuffsData(timedBuffsTurns)
	data["timedBuffsDurationTurns"] = timedBuffsDurationTurns
	
	
	data["lastUpdatedDay"] = lastUpdatedDay
	data["lastUpdatedSecond"] = lastUpdatedSecond
	
	data["lustInterests"] = lustInterests.saveDataDynamicNpc()
	data["fetishHolder"] = fetishHolder.saveData()
	data["personality"] = personality.saveData()
	
	return data

func loadData(data):
	pain = SAVE.loadVar(data, "pain", 0)
	lust = SAVE.loadVar(data, "lust", 0)
	stamina = SAVE.loadVar(data, "stamina", 100)
	arousal = SAVE.loadVar(data, "arousal", 0.0)
	consciousness = SAVE.loadVar(data, "consciousness", 1.0)
	npcName = SAVE.loadVar(data, "npcName", "Error")
	npcSpecies = SAVE.loadVar(data, "npcSpecies", ["canine"])
	npcGender = SAVE.loadVar(data, "npcGender", Gender.Male)
	npcSmallDescription = SAVE.loadVar(data, "npcSmallDescription", "No description")
	npcThickness = SAVE.loadVar(data, "npcThickness", 50)
	npcFeminity = SAVE.loadVar(data, "npcFeminity", 50)
	npcArchetypes = SAVE.loadVar(data, "npcArchetypes", [])
	npcAttacks = SAVE.loadVar(data, "npcAttacks", [])
	temporaryCharacter = SAVE.loadVar(data, "temporaryCharacter", false)
	flags = SAVE.loadVar(data, "flags", {})
	npcDefaultEquipment = SAVE.loadVar(data, "npcDefaultEquipment", [])
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
	
	lustInterests.loadDataDynamicNpc(SAVE.loadVar(data, "lustInterests", {}))
	fetishHolder.loadData(SAVE.loadVar(data, "fetishHolder", {}))
	personality.loadData(SAVE.loadVar(data, "personality", {}))

	updateAppearance()
