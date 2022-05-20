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
var npcHasMenstrualCycle = false # If true can get pregnant

func _ready():
	name = id
	createBodyparts()
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
			printerr("Bodypart changed for "+getName()+"'s "+str(slot)+", ignoring data (was "+bodypartid+", became "+bodypart.id+")")
			continue
		bodypart.loadDataNPC(bodypartData)
	
	loadStatusEffectsData(SAVE.loadVar(data, "statusEffects", {}))
	inventory.loadData(SAVE.loadVar(data, "inventory", {}))
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

func processTime(_secondsPassed):
	for bodypartSlot in bodyparts:
		var bodypart = bodyparts[bodypartSlot]
		if(bodypart == null):
			continue
		bodypart.processTime(_secondsPassed)
		
	if(menstrualCycle != null):
		menstrualCycle.processTime(_secondsPassed)
		
func hoursPassed(_howmuch):
	for bodypartSlot in bodyparts:
		if(bodyparts[bodypartSlot] != null):
			bodyparts[bodypartSlot].hoursPassed(_howmuch)

func updateNonBattleEffects():
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
		#if(!hasEffect(StatusEffect.Pregnant)):
		#	GM.main.addLogMessage("Uh oh", "You notice that your belly is more inflated that normally. You can't deny it anymore, you are pregnant..")
		
		addEffect(StatusEffect.Pregnant)
	else:
		removeEffect(StatusEffect.Pregnant)

func onCharacterReadyToGiveBirth():
	if(getMenstrualCycle() != null):
		GM.main.addLogMessage("News", "You just received news that someone gave birth to your children! You can check who in the nursery")
		
		var bornChildren = getMenstrualCycle().giveBirth()
		
		for child in bornChildren:
			GM.CS.addChild(child)
