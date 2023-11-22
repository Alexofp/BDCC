extends Node
class_name BuffsHolder

var buffs: Array = []
var buffsIds: Dictionary = {}
var npc = null
var dealDamageMult = {}
var receiveDamageMult = {}
var armor = {}
var gagged = false
var dodgeChance = 0
var accuracy = 0
var extraPain = 0
var extraLust = 0
var extraStamina = 0
var ambientPain = 0
var ambientLust = 0
var exposure = 0
var genitalElasticity = 0.0
var genitalResistance = 0.0
var orificeMinLooseness = {}
var orificesPreventedFromRecovering = {}
var blockedOrifices = {}
var extraFertility = 0.0
var extraVirility = 0.0
var eggsBonusMod: float = 0.0
var minEggsAmount: int = 0
var extraCrossSpeciesCompatibility = 0.0
var skillsExperience = {}
var statusEffectImmunity = {}
var customAttributes = {}
var extraStats = {}

func _ready():
	name = "Buffs"

func setCharacter(newnpc):
	npc = newnpc

func getCharacter():
	return npc

func calculateBuffs():
	assert(npc != null)
	
	var newbuffs = []
	
	var items = npc.getInventory().getAllEquippedItems()
	for slot in items:
		var item = items[slot]
		var itemBuffs = item.getBuffs()
		if(itemBuffs != null && itemBuffs is Array):
			newbuffs.append_array(itemBuffs)
		
	var statusEffects = npc.getStatusEffects()
	for statusEffectID in statusEffects:
		var statusEffect = statusEffects[statusEffectID]
		var statusEffectBuffs = statusEffect.getBuffs()
		if(statusEffectBuffs != null && statusEffectBuffs is Array):
			newbuffs.append_array(statusEffectBuffs)

	var perkBuffs = npc.getSkillsHolder().getBuffs()
	if(perkBuffs != null && perkBuffs is Array):
		newbuffs.append_array(perkBuffs)
	
	buffs = newbuffs
	buffsIds.clear()
	dealDamageMult.clear()
	receiveDamageMult.clear()
	armor.clear()
	gagged = false
	dodgeChance = 0
	accuracy = 0
	extraPain = 0
	extraLust = 0
	extraStamina = 0
	ambientPain = 0
	ambientLust = 0
	exposure = 0
	genitalElasticity = 0.0
	genitalResistance = 0.0
	extraFertility = 0.0
	extraVirility = 0.0
	eggsBonusMod = 0.0
	minEggsAmount = 0
	extraCrossSpeciesCompatibility = 0.0
	skillsExperience.clear()
	statusEffectImmunity.clear()
	customAttributes.clear()
	orificesPreventedFromRecovering.clear()
	extraStats.clear()
	
	for statID in GlobalRegistry.getStats():
		extraStats[statID] = 0
	
	for damageType in DamageType.getAll():
		dealDamageMult[damageType] = 0.0
		receiveDamageMult[damageType] = 0.0
		armor[damageType] = 0
		
	orificeMinLooseness.clear()
	for orificeType in OrificeType.getAll():
		orificeMinLooseness[orificeType] = 0.0
		blockedOrifices[orificeType] = false
	
	for buff in buffs:
		buffsIds[buff.id] = true
		buff.apply(self)

func addCustom(id:String, value):
	if(!customAttributes.has(id)):
		customAttributes[id] = 0
	
	customAttributes[id] += value

func getCustom(id:String):
	if(!customAttributes.has(id)):
		return 0.0
	return customAttributes[id]

func getCustomBool(id:String):
	if(!customAttributes.has(id)):
		return false
	return customAttributes[id] > 0.0

func isGagged():
	return gagged

func getDealDamageMult(damageType):
	if(!dealDamageMult.has(damageType)):
		return 0.0
	
	return dealDamageMult[damageType]

func getRecieveDamageMult(damageType):
	if(!receiveDamageMult.has(damageType)):
		return 0.0
	
	return receiveDamageMult[damageType]

func getArmor(damageType):
	if(!armor.has(damageType)):
		return 0
	
	return armor[damageType]

func hasBuff(buffID):
	if(buffsIds.has(buffID)):
		return true

	return false

func getDodgeChance():
	return dodgeChance

func getAccuracy():
	return accuracy

func getExtraPainThreshold():
	return extraPain

func getExtraLustThreshold():
	return extraLust

func getExtraStamina():
	return extraStamina

func getAmbientPain():
	return ambientPain

func getAmbientLust():
	return ambientLust

func getExposure():
	return exposure

func getGenitalElasticity():
	return genitalElasticity

func getGenitalResistance():
	return genitalResistance

func getOrificeMinLooseness(orificeType):
	if(!orificeMinLooseness.has(orificeType)):
		return 0.0
	
	return orificeMinLooseness[orificeType]

func getOrificePreventedFromRecovering(orificeType):
	if(orificesPreventedFromRecovering.has(orificeType)):
		return true
	
	return false

func getOrificeBlocked(orificeType):
	if(!blockedOrifices.has(orificeType)):
		return false
	
	return blockedOrifices[orificeType]

func getFertility():
	return extraFertility

func getVirility():
	return extraVirility
	
func getEggsBonusMod():
	return eggsBonusMod
	
func getMinEggsAmount():
	return minEggsAmount
	
func getCrossSpeciesCompatibility():
	return extraCrossSpeciesCompatibility

func getSkillExperienceMult(skill):
	if(!skillsExperience.has(skill)):
		return 0.0
	
	return skillsExperience[skill]

func getStatusEffectImmunity(statusEffect):
	if(!statusEffectImmunity.has(statusEffect)):
		return 0.0
	return statusEffectImmunity[statusEffect]

func getExtraStat(stat) -> int:
	if(!extraStats.has(stat)):
		return 0
	return extraStats[stat]
