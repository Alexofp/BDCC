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
var blockedOrifices = {}
var extraFertility = 0.0
var extraVirility = 0.0
var extraCrossSpeciesCompatibility = 0.0
var skillsExperience = {}

func _ready():
	name = "Buffs"

func setCharacter(newnpc):
	npc = newnpc

func calculateBuffs():
	assert(npc != null)
	buffs.clear()
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
	extraCrossSpeciesCompatibility = 0.0
	skillsExperience.clear()
	
	for damageType in DamageType.getAll():
		dealDamageMult[damageType] = 0.0
		receiveDamageMult[damageType] = 0.0
		armor[damageType] = 0
		
	orificeMinLooseness.clear()
	for orificeType in OrificeType.getAll():
		orificeMinLooseness[orificeType] = 0.0
		blockedOrifices[orificeType] = false
	
	var items = npc.getInventory().getAllEquippedItems()
	for slot in items:
		var item = items[slot]
		buffs.append_array(item.getBuffs())
		
	var statusEffects = npc.getStatusEffects()
	for statusEffectID in statusEffects:
		var statusEffect = statusEffects[statusEffectID]
		buffs.append_array(statusEffect.getBuffs())

	buffs.append_array(npc.getSkillsHolder().getBuffs())

	for buff in buffs:
		buffsIds[buff.id] = true
		buff.apply(self)

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

func getOrificeBlocked(orificeType):
	if(!blockedOrifices.has(orificeType)):
		return false
	
	return blockedOrifices[orificeType]

func getFertility():
	return extraFertility

func getVirility():
	return extraVirility

func getCrossSpeciesCompatibility():
	return extraCrossSpeciesCompatibility

func getSkillExperienceMult(skill):
	if(!skillsExperience.has(skill)):
		return 0.0
	
	return skillsExperience[skill]
