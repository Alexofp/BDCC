extends Node
class_name BaseCharacter

# used for player/npc chat color and pronouns (can be overriden)
enum Gender {
	Male,
	Female,
	Androgynous,
	Other,
}

#Base class that has all the functions
signal stat_changed
signal levelChanged
signal skillLevelChanged(skillID)
signal bodypart_changed

var pain:int = 0
var lust:int = 0
var stamina:int = 100
var statusEffects:Dictionary = {}
var statusEffectsStorageNode
var inventory: Inventory
var buffsHolder: BuffsHolder
var skillsHolder: SkillsHolder
var lustInterests: LustInterests

# Bodypart stuff
var bodyparts: Dictionary
var bodypartStorageNode

# Combat stats
var initialDodgeChance = 0

var fightingState = "" # dodge, block, defocus

func _init():
	name = "BaseCharacter"

func _ready():
	bodypartStorageNode = Node.new()
	add_child(bodypartStorageNode)
	bodypartStorageNode.name = "Bodyparts"
	resetSlots()
	statusEffectsStorageNode = Node.new()
	add_child(statusEffectsStorageNode)
	statusEffectsStorageNode.name = "StatusEffects"	
	inventory = Inventory.new()
	add_child(inventory)
	var _con = inventory.connect("equipped_items_changed", self, "onEquippedItemsChange")
	buffsHolder = BuffsHolder.new()
	buffsHolder.setCharacter(self)
	add_child(buffsHolder)
	skillsHolder = SkillsHolder.new()
	skillsHolder.setCharacter(self)
	add_child(skillsHolder)
	var _con2 = skillsHolder.connect("statChanged", self, "onStatChange")
	var _con3 = skillsHolder.connect("experienceChanged", self, "onStatChange")
	var _con4 = skillsHolder.connect("levelChanged", self, "onLevelChange")
	var _con5 = skillsHolder.connect("skillLevelChanged", self, "onSkillLevelChange")
	stamina = getMaxStamina()
	#resetToDefault()
	lustInterests = LustInterests.new()

# Skips armor checks etc
func addPain(_p: int):
	pain += _p
	if(pain > painThreshold()):
		pain = painThreshold()
	if(pain < 0):
		pain = 0
		
	emit_signal("stat_changed")

func addLust(_l: int):
	lust += _l
	if(lust > lustThreshold()):
		lust = lustThreshold()
	if(lust < 0):
		lust = 0
	
	emit_signal("stat_changed")

func addStamina(_s: int):
	stamina += _s
	if(stamina > getMaxStamina()):
		stamina = getMaxStamina()
	if(stamina < 0):
		stamina = 0
	
	emit_signal("stat_changed")

func getPain() -> int:
	return pain

func getLust() -> int:
	return lust
	
func getStamina() -> int:
	return stamina
	
func getBaseMaxStamina() -> int:
	return 100
	
func getMaxStamina() -> int:
	return int(max(0, getBaseMaxStamina() + skillsHolder.getExtraStamina() + buffsHolder.getExtraStamina()))
	
func getName() -> String:
	return name
	
func getSmallDescription() -> String:
	return "Test test test"

func getBasePainThreshold() -> int:
	return 100

func painThreshold() -> int:
	return int(max(10, getBasePainThreshold() + skillsHolder.getExtraPainThreshold() + buffsHolder.getExtraPainThreshold()))

func getBaseLustThreshold() -> int:
	return 100

func lustThreshold() -> int:
	return int(max(10, getBaseLustThreshold() + skillsHolder.getExtraLustThreshold() + buffsHolder.getExtraLustThreshold()))

func getPainLevel():
	return float(getPain()) / float(painThreshold())

func getLustLevel():
	return float(getLust()) / float(lustThreshold())

func getStaminaLevel():
	return float(getStamina()) / float(getMaxStamina())

func getAmbientPain():
	return int(buffsHolder.getAmbientPain())

func getAmbientLust():
	return int(buffsHolder.getAmbientLust())

func addEffect(effectID: String, args = []):
	if(statusEffects.has(effectID)):
		statusEffects[effectID].combine(args)
		return
	
	var effect = GlobalRegistry.createStatusEffect(effectID)
	effect.setCharacter(self)
	effect.initArgs(args)
	statusEffectsStorageNode.add_child(effect)
	
	statusEffects[effectID] = effect
	buffsHolder.calculateBuffs()

func hasEffect(effectID: String):
	return statusEffects.has(effectID)
	
func getEffect(effectID: String):
	if(!statusEffects.has(effectID)):
		return null
	return statusEffects[effectID]
	
func removeEffect(effectID: String):
	if(statusEffects.has(effectID)):
		statusEffects[effectID].queue_free()
		var _wasremoved = statusEffects.erase(effectID)
		buffsHolder.calculateBuffs()
	
func canStandUpCombat():
	if(!hasEffect(StatusEffect.Collapsed)):
		return false
	
	var collapsedEffect = statusEffects[StatusEffect.Collapsed]
	return collapsedEffect.canStandUp() || hasPerk(Perk.CombatBetterGetUp)
	
func getStatusEffects():
	return statusEffects
	
func saveStatusEffectsData():
	var data = {}
	for effectID in statusEffects:
		data[effectID] = statusEffects[effectID].saveData()
	return data
	
func loadStatusEffectsData(data):
	for effectID in statusEffects.keys():
		removeEffect(effectID)
	
	for effectID in data:
		var effect = GlobalRegistry.createStatusEffect(effectID)
		effect.setCharacter(self)
		statusEffects[effectID] = effect
		statusEffectsStorageNode.add_child(effect)
		
		effect.loadData(data[effectID])
	
func updateEffectPanel(panel: StatusEffectsPanel):
	panel.clearBattleEffects()
	for effectID in statusEffects.keys():
		var effect = statusEffects[effectID]
		panel.addBattleEffect(effect.getIconColor(), effect.getEffectName(), effect.getVisisbleDescription(), effect.getEffectImage())

func processBattleTurn():
	for effectID in statusEffects.keys():
		var effect = statusEffects[effectID]
		effect.processBattleTurn()
		
	skillsHolder.processBattleTurn()
		
	buffsHolder.calculateBuffs()
		
func beforeFightStarted():
	pass

func afterFightEnded():
	print(getName()+" my fight has ended")
	
	for effectID in statusEffects.keys():
		var effect = statusEffects[effectID]
		if(effect.isBattleOnly):
			removeEffect(effectID)
	
func isPlayer():
	return false

func _getAttacks():
	return ["blunderAttack"]
	
func getAttacks():
	return _getAttacks()
	
func getArmor(_damageType):
	var armor = 0
	if(isBlocking()):
		if(_damageType == DamageType.Physical):
			if(hasPerk(Perk.CombatBetterBlock)):
				armor += 50
			else:
				armor += 20
	if(isDefocusing()):
		if(_damageType == DamageType.Lust):
			if(hasPerk(Perk.SexBetterDefocus)):
				armor += 50
			else:
				armor += 20
	
	armor += buffsHolder.getArmor(_damageType)
	
	return armor
	
func calculateBuffs():
	buffsHolder.calculateBuffs()
	
func onEquippedItemsChange():
	calculateBuffs()
	
func onStatChange():
	emit_signal("stat_changed")
	
func onDamage(_damageType, _amount):
	pass

func getDamageMultiplier(_damageType):
	var mult = 0
	for effectID in statusEffects.keys():
		var effect = statusEffects[effectID]
		mult += effect.getDamageMultiplierMod(_damageType)
	
	mult += buffsHolder.getDealDamageMult(_damageType)
	mult += skillsHolder.getDamageMultiplier(_damageType)

	if(mult < -0.8):
		mult = -0.8

	return mult

func getRecieveDamageMultiplier(_damageType):
	var mult = 0
	for effectID in statusEffects.keys():
		var effect = statusEffects[effectID]
		mult += effect.getRecievedDamageMod(_damageType)
		
	mult += buffsHolder.getRecieveDamageMult(_damageType)
	
	if(mult < -0.8):
		mult = -0.8
	
	return mult

func getDodgeChance():
	if(isDodging()):
		return 1
	
	var mult = initialDodgeChance
	for effectID in statusEffects.keys():
		var effect = statusEffects[effectID]
		mult += effect.getDodgeMod()

	mult += buffsHolder.getDodgeChance()

	if(mult > 0.8):
		mult = 0.8

	return mult
	
func getAttackAccuracy():
	var mult = 0
	for effectID in statusEffects.keys():
		var effect = statusEffects[effectID]
		mult += effect.getAccuracyMod()
	
	mult += buffsHolder.getAccuracy()
	
	if(mult < -0.9):
		mult = -0.9
	
	return mult
	
func receiveDamage(damageType, amount: int, armorScale: float = 1.0):
	var mult = getRecieveDamageMultiplier(damageType)
	var newdamage = round(amount * (1.0 + mult))
	
	if(amount > 0):
		var finalArmor = floor(getArmor(damageType) * armorScale)
		#newdamage -= finalArmor
		newdamage = newdamage * (50.0/(50.0+finalArmor)) 
		newdamage = max(newdamage, 1)
	
	if(damageType == DamageType.Physical):
		var oldpain = pain

		addPain(newdamage)
		
		var actualAddpain = pain - oldpain
		onDamage(damageType, actualAddpain)
		return actualAddpain
		
	if(damageType == DamageType.Lust):
		var oldlust = lust

		addLust(newdamage)
		
		var actualAddlust = lust - oldlust
		onDamage(damageType, actualAddlust)
		return actualAddlust
		
	if(damageType == DamageType.Stamina):
		var oldstamina = stamina

		addStamina(-newdamage)
		
		var actualAddstamina = stamina - oldstamina
		onDamage(damageType, actualAddstamina)
		return -actualAddstamina
		
	return 0

func isDodging():
	return fightingState == "dodge"
	
func isBlocking():
	return fightingState == "block"
	
func isDefocusing():
	return fightingState == "defocus"

func setFightingStateNormal():
	fightingState = ""
	
func setFightingStateDodging():
	fightingState = "dodge"
	
func setFightingStateBlocking():
	fightingState = "block"
	
func setFightingStateDefocusing():
	fightingState = "defocus"

func lustDamageReaction(lustDamage, _enemy):
	if(lustDamage <= -10):
		return getName() + " got very turned off by the sight"
	if(lustDamage <= -6):
		return getName() + " didn't like that at all"
	if(lustDamage <= -3):
		return getName() + " sighs and shakes "+hisHer()+" head"
	if(lustDamage == 0):
		return getName() + " didn't seem to care at all"
	if(lustDamage <= 5):
		return getName() + " seems intrigued"
	if(lustDamage <= 10):
		return getName() + " smiles eagerly and watches the show"
	if(lustDamage <= 10):
		return getName() + " blushes watching " + _enemy.getName()
	if(lustDamage <= 15):
		return getName() + " exhalled deeply while rubbing "+hisHer()+" legs together"
	if(lustDamage > 15):
		return getName() + " moans audibly, "+hisHer()+" eyes burn with desire"

func getGender():
	return Gender.Other

func getPronounGender():
	return getGender()

func getChatColor():
	var gender = getGender()
	
	if(gender == Gender.Male):
		return "#5696EA"
	if(gender == Gender.Female):
		return "#FF837A"
	if(gender == Gender.Androgynous):
		return "#BA82FF"
	if(gender == Gender.Other):
		return "#77D86C"
	
	return "red"

func formatSay(text):
	var color = getChatColor()
	
	return "[color="+color+"]\""+text+"\"[/color]"

func heShe():
	var gender = getPronounGender()
	
	if(gender == Gender.Male):
		return "he"
	if(gender == Gender.Female):
		return "she"
	if(gender == Gender.Androgynous):
		return "they"
	if(gender == Gender.Other):
		return "it"
		
func hisHer():
	var gender = getPronounGender()
	
	if(gender == Gender.Male):
		return "his"
	if(gender == Gender.Female):
		return "her"
	if(gender == Gender.Androgynous):
		return "their"
	if(gender == Gender.Other):
		return "its"
		
func himHer():
	var gender = getPronounGender()
	
	if(gender == Gender.Male):
		return "him"
	if(gender == Gender.Female):
		return "her"
	if(gender == Gender.Androgynous):
		return "them"
	if(gender == Gender.Other):
		return "it"

func isAre():
	var gender = getPronounGender()
	
	if(gender == Gender.Male):
		return "is"
	if(gender == Gender.Female):
		return "is"
	if(gender == Gender.Androgynous):
		return "are"
	if(gender == Gender.Other):
		return "is"

func hasHave():
	var gender = getPronounGender()
	
	if(gender == Gender.Male):
		return "has"
	if(gender == Gender.Female):
		return "has"
	if(gender == Gender.Androgynous):
		return "have"
	if(gender == Gender.Other):
		return "has"

func himselfHerself():
	var gender = getPronounGender()
	
	if(gender == Gender.Male):
		return "himself"
	if(gender == Gender.Female):
		return "herself"
	if(gender == Gender.Androgynous):
		return "themself"
	if(gender == Gender.Other):
		return "itself"

func verbS(verbWithNoS, verbWithS = null):
	var gender = getPronounGender()
	
	if(verbWithS == null):
		verbWithS = verbWithNoS + "s"
	
	if(gender == Gender.Male):
		return verbWithS
	if(gender == Gender.Female):
		return verbWithS
	if(gender == Gender.Androgynous):
		return verbWithNoS
	if(gender == Gender.Other):
		return verbWithS

func getInventory() -> Inventory:
	return inventory

func getLustInterests() -> LustInterests:
	return lustInterests

func getSkillsHolder() -> SkillsHolder:
	return skillsHolder

func addExperience(newexp: int):
	skillsHolder.addExperience(newexp)

func addSkillExperience(skillID, amount, activityID = null):
	skillsHolder.addSkillExperience(skillID, amount, activityID)

func hasPerk(perkID):
	return skillsHolder.hasPerk(perkID)

func getStat(statID):
	return skillsHolder.getStat(statID)

func getSkillLevel(skillID):
	var skill = skillsHolder.getSkill(skillID)
	if(skill == null):
		return 0
	return skill.getLevel()

func getSpecies():
	return []

func getSpeciesFullName():
	var species = getSpecies()
	return Util.getSpeciesName(species)
	
func getFightIntro(_battleName):
	return "Plase change the fight intro"

func getFightState(_battleName):
	if(getPainLevel() > getLustLevel()):
		var mypain = getPainLevel() * 100
		
		if(mypain >= 70):
			return getName() + " constantly grunts from pain. "+heShe()+" can barely stand at this point, all "+hisHer()+" bruises are really wearing "+himHer()+" down"
		if(mypain >= 50):
			return getName() + " looks pretty beat up and "+hisHer()+" face shows it but "+heShe()+" is still standing strong"
		if(mypain >= 25):
			return getName() + " has a bruise there and there but "+heShe()+" clearly won't give up the fight any time soon"
	else:
		var mylust = getLustLevel() * 100
		
		if(mylust >= 70):
			return getName() + " keeps moaning to "+himselfHerself()+" and can't hide the arousal anymore, "+heShe()+" blatantly gropes and rubs "+hisHer()+" body in front of you"
		if(mylust >= 50):
			return getName() + " breathes warmly, "+hisHer()+" blush starts to shine through, "+ heShe()+" is lusty and "+hisHer()+" eyes show it"
		if(mylust >= 25):
			return getName() + " looks alright but you notice some desire in "+hisHer()+" eyes"
		
	return getName() + " looks completely fine, no visible bruises or signs of lust"

func getLootTable(_battleName):
	return LootTableBase.new()

func getLoot(_battleName):
	var lootTable = getLootTable(_battleName)
	var generatedLoot = lootTable.generate()
	
	var resultCredits = 0
	
	var resultItems = []
	if(generatedLoot.has("items")):
		for generatedItemData in generatedLoot["items"]:
			var generatedItem = GlobalRegistry.createItem(generatedItemData[0])
			if(generatedItemData[1] > 1):
				generatedItem.setAmount(generatedItemData[1])
			resultItems.append(generatedItem)
	if(generatedLoot.has("credits")):
		resultCredits = generatedLoot["credits"]
	
	return {"credits": resultCredits, "items": resultItems}

func getBodypartTooltipName(_bodypartSlot):
	return "error"

func getBodypartTooltipInfo(_bodypartSlot):
	return "error"

func getPenisSize():
	return 20.0

func getFluidType(fluidSource):
	if(fluidSource == BodilyFluids.FluidSource.Penis):
		return BodilyFluids.FluidType.Cum
	if(fluidSource == BodilyFluids.FluidSource.Vagina):
		return BodilyFluids.FluidType.GirlCum
		
	return null

func getFluidAmount(fluidSource):
	if(fluidSource == BodilyFluids.FluidSource.Penis):
		if(hasBodypart(BodypartSlot.Penis)):
			var penis:BodypartPenis = getBodypart(BodypartSlot.Penis)
			return penis.getFluidProduction().getFluidAmount()
		return 100.0
	if(fluidSource == BodilyFluids.FluidSource.Vagina):
		return RNG.randf_range(50.0, 200.0)
		
	return 0.0

func extractFluidAmount(fluidSource, howmuch = 1.0):
	if(fluidSource == BodilyFluids.FluidSource.Penis):
		if(hasBodypart(BodypartSlot.Penis)):
			var penis:BodypartPenis = getBodypart(BodypartSlot.Penis)
			return penis.getFluidProduction().drain(howmuch)

	return getFluidAmount(fluidSource)

func getFemininity() -> int:
	return 50

func getThickness() -> int:
	return 50

func getFeminityAdjective():
	var fem = getFemininity()
	
	if(fem <= 33):
		return RNG.pick(["manly", "masculine"])

	if(fem >= 66):
		return RNG.pick(["girly", "feminine"])

	return RNG.pick(["androgynous"])
	
func getThicknessAdjective():
	var thick = getThickness()
	
	if(thick <= 10):
		return RNG.pick(["soft", "thin", "skinny", "athletic"])
	if(thick <= 35):
		return RNG.pick(["slim", "fit"])
	if(thick <= 75):
		return RNG.pick(["average", "round"])
	else:
		return RNG.pick(["soft", "plush", "thick", "wide"])

func onLevelChange():
	emit_signal("levelChanged")

func onSkillLevelChange(skillID):
	emit_signal("skillLevelChanged", skillID)

static func genderToString(thegender):
	if(thegender == Gender.Male):
		return "male"
	if(thegender == Gender.Female):
		return "female"
	if(thegender == Gender.Androgynous):
		return "androgynous"
	if(thegender == Gender.Other):
		return "other"
	return "error?"

static func genderToPronouns(thegender):
	if(thegender == Gender.Male):
		return "He/his"
	if(thegender == Gender.Female):
		return "She/her"
	if(thegender == Gender.Androgynous):
		return "They/their"
	if(thegender == Gender.Other):
		return "It/its"
	return "error?"

# Bodyparts stuff

func updateAppearance():
	emit_signal("bodypart_changed")

func resetSlots():
	for slot in BodypartSlot.getAll():
		if(bodyparts.has(slot) && bodyparts[slot] != null):
			bodyparts[slot].queue_free()
		bodyparts[slot] = null

func giveBodypart(bodypart: Bodypart):
	var slot = bodypart.getSlot()
	if(bodyparts.has(slot) && bodyparts[slot] != null):
		bodyparts[slot].queue_free()
	bodyparts[slot] = bodypart
	bodypartStorageNode.add_child(bodypart)
	bodypart.name = bodypart.visibleName
	bodypart.character = weakref(self)
	emit_signal("bodypart_changed")

func giveBodypartUnlessSame(bodypart: Bodypart):
	var slot = bodypart.getSlot()
	if(bodyparts.has(slot) && bodyparts[slot] != null):
		if(bodypart.id == bodyparts[slot].id):
			bodypart.queue_free()
			return
	giveBodypart(bodypart)

func hasBodypart(slot):
	if(bodyparts.has(slot) && bodyparts[slot] != null):
		return true
	return false
	
func getBodypart(slot):
	return bodyparts[slot]

func getBodyparts():
	return bodyparts
	
func removeBodypart(slot):
	if(bodyparts.has(slot) && bodyparts[slot] != null):
		bodyparts[slot].queue_free()
	bodyparts[slot] = null
	emit_signal("bodypart_changed")

func clearOrificeFluids():
	if(hasBodypart(BodypartSlot.Vagina)):
		getBodypart(BodypartSlot.Vagina).clearOrificeFluids()
	getBodypart(BodypartSlot.Anus).clearOrificeFluids()
	getBodypart(BodypartSlot.Head).clearOrificeFluids()

func cummedInBodypartBy(bodypartSlot, characterID, sourceType = null):
	if(!hasBodypart(bodypartSlot)):
		return
	
	var ch = GlobalRegistry.getCharacter(characterID)
	if(sourceType == null):
		sourceType = BodilyFluids.FluidSource.Penis
	
	var thebodypart = getBodypart(bodypartSlot)
	thebodypart.addFluidOrifice(ch.getFluidType(sourceType), ch.extractFluidAmount(sourceType), characterID)

func cummedInVaginaBy(characterID, sourceType = null):
	cummedInBodypartBy(BodypartSlot.Vagina, characterID, sourceType)

func cummedInAnusBy(characterID, sourceType = null):
	cummedInBodypartBy(BodypartSlot.Anus, characterID, sourceType)

func cummedInMouthBy(characterID, sourceType = null):
	cummedInBodypartBy(BodypartSlot.Head, characterID, sourceType)

func getGenitalElasticity():
	var value = 0.0
	value += buffsHolder.getGenitalElasticity()
	return value
	
func getGenitalResistance():
	var value = 0.0
	value += buffsHolder.getGenitalResistance()
	return value

func getOrificeMinLooseness(orificeType):
	var value = 0.0
	value += buffsHolder.getOrificeMinLooseness(orificeType)
	return value
	
func getOrificeBlocked(orificeType):
	return buffsHolder.getOrificeBlocked(orificeType)
