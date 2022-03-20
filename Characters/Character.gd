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

func _ready():
	name = id
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

func _init():
	pass
	
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
	
	data["statusEffects"] = saveStatusEffectsData()
	data["inventory"] = inventory.saveData()
	data["lustInterests"] = lustInterests.saveData()
	
	return data

func loadData(data):
	pain = SAVE.loadVar(data, "pain", 0)
	lust = SAVE.loadVar(data, "lust", 0)
	stamina = SAVE.loadVar(data, "stamina", 100)
	
	loadStatusEffectsData(SAVE.loadVar(data, "statusEffects", {}))
	inventory.loadData(SAVE.loadVar(data, "inventory", {}))
	lustInterests.loadData(SAVE.loadVar(data, "lustInterests", {}))

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
	
