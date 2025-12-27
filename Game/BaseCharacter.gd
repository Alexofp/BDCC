extends Node
class_name BaseCharacter

#Base class that has all the functions
signal stat_changed
signal pain_changed(newValue, oldValue)
signal lust_changed(newValue, oldValue)
signal stamina_changed(newValue, oldValue)
signal levelChanged
signal skillLevelChanged(skillID)
signal bodypart_changed
signal orificeBecomeMoreLoose(orificeName, newvalue, oldvalue)
signal exchangedCumDuringRubbing(senderName, receiverName)
#signal soft_doll_update

var pain:int = 0
var lust:int = 0
var stamina:int = 100

# sex stats
var arousal:float = 0
var consciousness: float = 1.0

var statusEffects:Dictionary = {}
var inventory: Inventory
var buffsHolder: BuffsHolder
var skillsHolder: SkillsHolder
var lustInterests: LustInterests
var fetishHolder: FetishHolder
var personality: Personality
var bodyFluids: Fluids

# Bodypart stuff
var bodyparts: Dictionary
var processingBodyparts: Array
var bodypartStorageNode

# pee is not attached to a bodypart but we track it anyway
var peeProduction: PeeProduction

# Combat stats
var initialDodgeChance = 0
var fightingState = "" # dodge, block, defocus

# pregnancy stuff
var menstrualCycle: MenstrualCycle

var timedBuffs: Array = [] # [ [buff, seconds], [buff, seconds], ... ]
var timedBuffsTurns: Array = [] # [ [buff, turns], [buff, turns], ... ]

# Skin data
var pickedSkin:String = "EmptySkin"
var pickedSkinRColor:Color = Color.white
var pickedSkinGColor:Color = Color.lightgray
var pickedSkinBColor:Color = Color.darkgray

func _init():
	name = "BaseCharacter"

func _ready():
	bodypartStorageNode = Node.new()
	add_child(bodypartStorageNode)
	bodypartStorageNode.name = "Bodyparts"
	resetSlots()
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
	fetishHolder = FetishHolder.new()
	fetishHolder.setCharacter(self)
	personality = Personality.new()
	personality.setCharacter(self)
	bodyFluids = Fluids.new()

	peeProduction = PeeProduction.new(self)

func getID():
	assert(false, "Getting an ID of a baseCharacter class")

# Skips armor checks etc
func addPain(_p: int):
	var initialPain = pain
	pain += _p
	if(pain > painThreshold()):
		pain = painThreshold()
	if(pain < 0):
		pain = 0
		
	if(initialPain != pain):
		emit_signal("pain_changed", pain, initialPain)
	emit_signal("stat_changed")

func addLust(_l: int):
	var initialLust = lust
	lust += _l
	if(lust > lustThreshold()):
		lust = lustThreshold()
	if(lust < 0):
		lust = 0
	
	if(initialLust != lust):
		emit_signal("lust_changed", lust, initialLust)
	emit_signal("stat_changed")

func addStamina(_s: int):
	var initialStamina = stamina
	stamina += _s
	if(stamina > getMaxStamina()):
		stamina = getMaxStamina()
	if(stamina < 0):
		stamina = 0
	
	if(initialStamina != stamina):
		emit_signal("stamina_changed", stamina, initialStamina)
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

func getSmallDescriptionWithRelationship() -> String:
	var result:String = getSmallDescription()
	if(GM.main && GM.main.RS):
		var specialText:Array = GM.main.RS.getSpecialTextAndColor(getID())
		if(specialText.size() >= 2):
			result += "\n([color=#"+specialText[1].to_html(false)+"]"+specialText[0]+"[/color])"+(specialText[2] if specialText.size() > 2 else "")
	return result
	
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
		return true
	
	var immunity = getStatusEffectImmunity(effectID)
	if(RNG.chance(clamp(immunity, 0.0, 1.0)*100.0) || GlobalRegistry.getStatusEffectRef(effectID).checkAvoidedBuff(self)):
		if(GM.main != null && GM.main.characterIsVisible(getID())):
			if(isPlayer()):
				GM.main.addMessage("You managed to avoid the '"+GlobalRegistry.getStatusEffectRef(effectID).getEffectName()+"' status effect!")
			else:
				GM.main.addMessage(getName()+" managed to avoid the '"+GlobalRegistry.getStatusEffectRef(effectID).getEffectName()+"' status effect!")
		return false
	
	var effect = GlobalRegistry.createStatusEffect(effectID)
	effect.setCharacter(self)
	effect.initArgs(args)
	
	statusEffects[effectID] = effect
	#buffsHolder.calculateBuffs()
	return true

func hasEffect(effectID: String):
	return statusEffects.has(effectID)
	
func getEffect(effectID: String):
	if(!statusEffects.has(effectID)):
		return null
	return statusEffects[effectID]
	
func removeEffect(effectID: String):
	if(statusEffects.has(effectID)):
		#statusEffects[effectID].queue_free()
		var _wasremoved = statusEffects.erase(effectID)
		#buffsHolder.calculateBuffs()
	
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
		if(effect == null):
			continue
		effect.setCharacter(self)
		statusEffects[effectID] = effect
		
		effect.loadData(data[effectID])
	
func updateEffectPanel(panel: StatusEffectsPanel):
	panel.clearBattleEffects()
	for effectID in statusEffects.keys():
		var effect = statusEffects[effectID]
		panel.addBattleEffect(effect.getIconColor(), effect.getEffectName(), effect.getVisisbleDescription(), effect.getEffectImage(), effect.shouldHaveWideTooltip())

func processTimedBuffs(_seconds:int):
	if(timedBuffs.empty() || _seconds <= 0):
		return
	var newTimedBuffs:Array = []
	for buffEntry in timedBuffs:
		buffEntry[1] -= _seconds
		if(buffEntry[1] > 0):
			newTimedBuffs.append(buffEntry)
	timedBuffs = newTimedBuffs

func processBattleTurn():
	if(!timedBuffsTurns.empty()):
		var newTimedBuffs:Array = []
		for buffEntry in timedBuffsTurns:
			buffEntry[1] -= 1
			if(buffEntry[1] > 0):
				newTimedBuffs.append(buffEntry)
		timedBuffsTurns = newTimedBuffs
	
	for effectID in statusEffects.keys():
		var effect = statusEffects[effectID]
		effect.processBattleTurn()
		
	skillsHolder.processBattleTurn()
		
	#buffsHolder.calculateBuffs()
		
func beforeFightStarted():
	pass

func afterFightEnded():
	print(getName()+" my fight has ended")
	
	timedBuffsTurns.clear()
	
	for effectID in statusEffects.keys():
		var effect = statusEffects[effectID]
		if(effect.isBattleOnly):
			removeEffect(effectID)
	
func isPlayer():
	return false

func isOverriddenPlayer():
	return false

func _getAttacks():
	return ["blunderAttack"]
	
func _getAttacksForBattle(_battlename):
	return null
	
func getAttacks(_battlename):
	var battleAttacks = _getAttacksForBattle(_battlename)
	if(battleAttacks != null):
		return battleAttacks
	
	return _getAttacks()
	
func getArmor(_damageType):
	var armor = 0
	if(isBlocking()):
		if(_damageType == DamageType.Physical):
			armor += getBlockArmor()
	if(isDefocusing()):
		if(_damageType == DamageType.Lust):
			armor += getDefocusArmor()
	
	armor += buffsHolder.getArmor(_damageType)
	
	return armor
	
func calculateBuffs():
	#buffsHolder.calculateBuffs()
	pass
	
func onEquippedItemsChange():
	#calculateBuffs()
	updateAppearance()
	
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
		var theArmor = getArmor(damageType)
		var finalArmor = floor(theArmor * armorScale) if theArmor > 0.0 else floor(theArmor)
		#newdamage -= finalArmor
		if(finalArmor < 0):
			newdamage = newdamage * (-finalArmor/50.0)
		else:
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
		if(isDefocusing() && hasPerk(Perk.SexDefocusNeverLose) && (oldlust < (lustThreshold()-1)) && (getLust() >= lustThreshold())):
			addLust(-1)
		
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
	if(GM.ui != null):
		text = GM.ui.processString(text)
	
	for speechModifier in GlobalRegistry.getSpeechModifiers():
		if(speechModifier.appliesTo(self)):
			text = speechModifier.modify(text, self)
	
	return "[color="+color+"]\""+text+"\"[/color]"

func theyre() -> String:
	var gender = getPronounGender()
	
	if(gender == Gender.Male):
		return "he's"
	if(gender == Gender.Female):
		return "she's"
	if(gender == Gender.Androgynous):
		return "they're"
	if(gender == Gender.Other):
		return "it's"
	return "theyre():BAD_GENDER"

func theyve() -> String:
	var gender = getPronounGender()
	
	if(gender == Gender.Male):
		return "he's"
	if(gender == Gender.Female):
		return "she's"
	if(gender == Gender.Androgynous):
		return "they've"
	if(gender == Gender.Other):
		return "it's"
	return "theyve():BAD_GENDER"

func doesntDont() -> String:
	var gender = getPronounGender()
	
	if(gender in [Gender.Male,Gender.Female,Gender.Other]):
		return "doesn't"
	if(gender == Gender.Androgynous):
		return "don't"
	return "doesntDont():BAD_GENDER"

func doesDo() -> String:
	var gender = getPronounGender()
	
	if(gender in [Gender.Male,Gender.Female,Gender.Other]):
		return "does"
	if(gender == Gender.Androgynous):
		return "do"
	return "doesDo():BAD_GENDER"

func heShe() -> String:
	var gender = getPronounGender()
	
	if(gender == Gender.Male):
		return "he"
	if(gender == Gender.Female):
		return "she"
	if(gender == Gender.Androgynous):
		return "they"
	if(gender == Gender.Other):
		return "it"
	return "heShe():BAD_GENDER"
		
func hisHer() -> String:
	var gender = getPronounGender()
	
	if(gender == Gender.Male):
		return "his"
	if(gender == Gender.Female):
		return "her"
	if(gender == Gender.Androgynous):
		return "their"
	if(gender == Gender.Other):
		return "its"
	return "hisHer():BAD_GENDER"
		
func hisHers() -> String:
	var gender = getPronounGender()
	
	if(gender == Gender.Male):
		return "his"
	if(gender == Gender.Female):
		return "hers"
	if(gender == Gender.Androgynous):
		return "theirs"
	if(gender == Gender.Other):
		return "its"
	return "hisHers():BAD_GENDER"
		
func himHer() -> String:
	var gender = getPronounGender()
	
	if(gender == Gender.Male):
		return "him"
	if(gender == Gender.Female):
		return "her"
	if(gender == Gender.Androgynous):
		return "them"
	if(gender == Gender.Other):
		return "it"
	return "himHer():BAD_GENDER"

func wasWere() -> String:
	var gender = getPronounGender()
	
	if(gender in [Gender.Male,Gender.Female,Gender.Other]):
		return "was"
	if(gender == Gender.Androgynous):
		return "were"
	return "wasWere():BAD_GENDER"

func isAre() -> String:
	var gender = getPronounGender()
	
	if(gender in [Gender.Male,Gender.Female,Gender.Other]):
		return "is"
	if(gender == Gender.Androgynous):
		return "are"
	return "himHer():BAD_GENDER"

func hasHave() -> String:
	var gender = getPronounGender()
	
	if(gender in [Gender.Male,Gender.Female,Gender.Other]):
		return "has"
	if(gender == Gender.Androgynous):
		return "have"
	return "hasHave():BAD_GENDER"

func himselfHerself() -> String:
	var gender = getPronounGender()
	
	if(gender == Gender.Male):
		return "himself"
	if(gender == Gender.Female):
		return "herself"
	if(gender == Gender.Androgynous):
		return "themself"
	if(gender == Gender.Other):
		return "itself"
	return "himselfHerself():BAD_GENDER"

func verbS(verbWithNoS:String, verbWithS:String = "") -> String:
	var gender = getPronounGender()
	
	if(verbWithS == ""):
		verbWithS = verbWithNoS + "s"
	
	if(gender in [Gender.Male,Gender.Female,Gender.Other]):
		return verbWithS
	if(gender == Gender.Androgynous):
		return verbWithNoS
	return "verbS():BAD_GENDER"

func getPenisSizeString() -> String:
	if(!hasBodypart(BodypartSlot.Penis) && !isWearingStrapon()):
		return "ERROR:NO_PENIS"
	
	return Util.cmToString(getPenisSize())

func getInventory() -> Inventory:
	return inventory

func getLustInterests() -> LustInterests:
	return lustInterests

func getSkillsHolder() -> SkillsHolder:
	return skillsHolder

func getBuffsHolder() -> BuffsHolder:
	return buffsHolder

func getFetishHolder() -> FetishHolder:
	return fetishHolder

func getPersonality() -> Personality:
	return personality

func addExperience(newexp: int):
	skillsHolder.addExperience(newexp)

func addSkillExperience(skillID, amount:int, activityID = null):
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

func getLevel() -> int:
	return skillsHolder.getLevel()

func getSpecies():
	return []

func getSpeciesFullName():
	var species = getSpecies()
	return Util.getSpeciesName(species)
	
func getFightIntro(_battleName):
	if(_battleName == "DrugDenEncounter"):
		var theText:String = "You run into a junkie. Looks like "+heShe()+" isn't happy to see you."
		theText += "\n\nThe junkie gets into the combat stance and prepares to fight."
		return theText
		
	return getName() + " gets into the combat stance and prepares for a fight."

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
	if(lootTable is String):
		lootTable = GlobalRegistry.getLootTable(lootTable)
	
	if(lootTable == null):
		return {"credits": 0, "items": []}
	
	var generatedLoot = lootTable.generate(getID(), _battleName)
	
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

func hasKeyholderLocksFrom(otherCharID:String):
	for invSlot in getInventory().getEquippedItems():
		var item = getInventory().getEquippedItem(invSlot)
		if(item.isRestraint()):
			var restraintData = item.getRestraintData()
			if(restraintData.hasSmartLock()):
				var smartLock = restraintData.getSmartLock()
				if(smartLock.isKeyholder(otherCharID)):
					return true
	return false

func unlockAllKeyholderLocksFrom(otherCharID:String) -> int:
	var howMany:int = 0
	for invSlot in getInventory().getEquippedItems().keys():
		var item = getInventory().getEquippedItem(invSlot)
		if(item.isRestraint()):
			var restraintData = item.getRestraintData()
			if(restraintData.hasSmartLock()):
				var smartLock = restraintData.getSmartLock()
				if(smartLock.isKeyholder(otherCharID)):
					getInventory().clearSlot(invSlot)
					howMany += 1
	return howMany

func getBodypartTooltipName(_bodypartSlot):
	return "error"

func getBodypartTooltipInfo(_bodypartSlot):
	return "error"

func getPenisSize():
	var strapon = getWornStrapon()
	if(strapon != null):
		return strapon.getStraponLength()
	
	if(!hasBodypart(BodypartSlot.Penis)):
		return 20.0
	
	var bodypart = getBodypart(BodypartSlot.Penis)
	return bodypart.getLength()

func getBreastsSize() -> int:
	if(!hasBodypart(BodypartSlot.Breasts)):
		return BreastsSize.FOREVER_FLAT
	return getBodypart(BodypartSlot.Breasts).getSize()

func getFluidType(fluidSource):
	var theCustomType:String = getCustomFluidType(fluidSource)
	if(theCustomType != ""):
		return theCustomType
	
	if(fluidSource == FluidSource.Penis):
		if(hasBodypart(BodypartSlot.Penis)):
			return getBodypart(BodypartSlot.Penis).getFluidType(fluidSource)
		return "Cum"
	if(fluidSource == FluidSource.Vagina):
		if(hasBodypart(BodypartSlot.Vagina)):
			return getBodypart(BodypartSlot.Vagina).getFluidType(fluidSource)
		return "GirlCum"
	if(fluidSource == FluidSource.Strapon):
		return "CumLube"
	if(fluidSource == FluidSource.Breasts):
		if(hasBodypart(BodypartSlot.Breasts)):
			return getBodypart(BodypartSlot.Breasts).getFluidType(fluidSource)
		return "Milk"
	if(fluidSource == FluidSource.Pissing):
		return "Piss"
		
	return null

func getCustomFluidType(_fluidSource) -> String:
	return ""

func getFluidAmount(fluidSource):
	if(fluidSource == FluidSource.Penis):
		if(hasBodypart(BodypartSlot.Penis)):
			var penis:BodypartPenis = getBodypart(BodypartSlot.Penis)
			return penis.getFluidProduction().getFluidAmount()
		return RNG.randf_range(100.0, 500.0)
	if(fluidSource == FluidSource.Vagina):
		return RNG.randf_range(50.0, 200.0)
	if(fluidSource == FluidSource.Strapon):
		return RNG.randf_range(100.0, 500.0)
	if(fluidSource == FluidSource.Pissing):
		return peeProduction.getFluidAmount()
	if(fluidSource == FluidSource.Breasts):
		if(hasBodypart(BodypartSlot.Breasts)):
			var breasts:BodypartBreasts = getBodypart(BodypartSlot.Breasts)
			return breasts.getFluidProduction().getFluidAmount()
		return 0.0
		
	return 0.0

func getFluidDNA(fluidSource):
	var fluidDNA = FluidDNA.new()
	fluidDNA.charID = getID()
	fluidDNA.virility = 0.0
	fluidDNA.species = getSpecies()
	
	# Fluids produced by your balls can always get someone pregnant
	if(fluidSource == FluidSource.Penis):
		fluidDNA.virility = getVirility()
	
	# Cum can get you pregnant even if it was generated elsewhere
	var fluidType = getFluidType(fluidSource)
	if(fluidType != null):
		var fluidObject = GlobalRegistry.getFluid(fluidType)
		if(fluidObject != null && fluidObject.canImpregnate()):
			fluidDNA.virility = getVirility()
	
	return fluidDNA

func getFemininity() -> int:
	return 50

func getThickness() -> int:
	return 50

func setThickness(_newT:int):
	pass

func setFemininity(_newF:int):
	pass

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

# Bodyparts stuff

func updateAppearance():
	#print(getName()+" UPDATED APPEARENCE "+Util.getStackFunction(3))
	emit_signal("bodypart_changed")

func resetSlots():
	for slot in BodypartSlot.getAll():
		if(bodyparts.has(slot) && bodyparts[slot] != null):
			bodyparts[slot].queue_free()
		bodyparts[slot] = null
	processingBodyparts.clear()

func giveBodypart(bodypart: Bodypart, emitSignal = true):
	if(bodypart == null):
		Log.printerr("Trying to give a null bodypart to "+str(self))
		return
	
	var slot = bodypart.getSlot()
	if(bodyparts.has(slot) && bodyparts[slot] != null):
		removeBodypart(slot, false)
		
	bodyparts[slot] = bodypart
	bodypartStorageNode.add_child(bodypart)
	bodypart.name = bodypart.visibleName
	bodypart.character = weakref(self)
	if(bodypart.needsProcessing):
		processingBodyparts.append(bodypart)
	
	if(emitSignal):
		emit_signal("bodypart_changed")

func giveBodypartUnlessSame(bodypart: Bodypart):
	if(bodypart == null):
		Log.printerr("Trying to give a null bodypart to "+str(self))
		return
	var slot = bodypart.getSlot()
	if(bodyparts.has(slot) && bodyparts[slot] != null):
		if(bodypart.id == bodyparts[slot].id):
			bodypart.queue_free()
			return false
	giveBodypart(bodypart)
	return true

func hasBodypart(slot):
	if(bodyparts.has(slot) && bodyparts[slot] != null):
		return true
	return false
	
func getBodypart(slot):
	if(!bodyparts.has(slot)):
		Log.printerr("Trying to get bodypart from slot "+str(slot)+" when it doesn't exist.")
		return null
	return bodyparts[slot]

func getBodyparts():
	return bodyparts
	
func removeBodypart(slot, emitSignal = true):
	if(bodyparts.has(slot) && bodyparts[slot] != null):
		var bodypart = bodyparts[slot]
		bodypart.queue_free()
		
		if(processingBodyparts.has(bodypart)):
			processingBodyparts.erase(bodypart)
	bodyparts[slot] = null
	
	if(emitSignal):
		emit_signal("bodypart_changed")

func clearOrificeFluids():
	if(hasBodypart(BodypartSlot.Vagina)):
		getBodypart(BodypartSlot.Vagina).clearOrificeFluids()
	if(hasBodypart(BodypartSlot.Anus)):
		getBodypart(BodypartSlot.Anus).clearOrificeFluids()
	if(hasBodypart(BodypartSlot.Head)):
		getBodypart(BodypartSlot.Head).clearOrificeFluids()

func clearOrificeFluidsCheckBlocked():
	var success = true
	
	if(hasBodypart(BodypartSlot.Vagina)):
		if(!hasReachableVagina()):
			success = false
		else:
			getBodypart(BodypartSlot.Vagina).clearOrificeFluids()
	if(hasBodypart(BodypartSlot.Anus)):
		if(!hasReachableAnus()):
			success = false
		else:
			getBodypart(BodypartSlot.Anus).clearOrificeFluids()
	if(hasBodypart(BodypartSlot.Head)):
		getBodypart(BodypartSlot.Head).clearOrificeFluids()
		
	return success

func cummedInBodypartBy(bodypartSlot, characterID, sourceType = null, amountToTransfer = 1.0):
	var result = cummedInBodypartByAdvanced(bodypartSlot, characterID, {}, sourceType, amountToTransfer)

	return result["loadSize"]

func cummedInBodypartByAdvanced(bodypartSlot, characterID, advancedData:Dictionary={}, sourceType = null, amountToTransfer = 1.0):
	var noData = {loadSize=0.0,condomBroke=false}
	if(!hasBodypart(bodypartSlot)):
		return noData
	
	var resultAmount = 0.0
	var condomBroke = false
	
	var ch = GlobalRegistry.getCharacter(characterID)

	if(advancedData.has("condomBroke") && advancedData["condomBroke"]):
		condomBroke = true
	elif(advancedData.has("condom")):
		var condomBreakChance = advancedData["condom"]
		if(ch.shouldCondomBreakWhenFucking(self, condomBreakChance)):
			condomBroke = true
		else:
			return noData
	
	if(sourceType == null):
		if(ch.isWearingStrapon()): # Strapons are preffered because we could be wearing one while having a chastity cage
			sourceType = FluidSource.Strapon
		else:
			sourceType = FluidSource.Penis
	
	if(sourceType == FluidSource.Penis && ch.hasBodypart(BodypartSlot.Penis)):
		var thebodypart = getBodypart(bodypartSlot)
		var usedBodypart = ch.getBodypart(BodypartSlot.Penis)
		
		var fluids = usedBodypart.getFluids()
		
		if(fluids != null):
			resultAmount = fluids.transferTo(thebodypart, amountToTransfer)
	elif(sourceType == FluidSource.Strapon && ch.isWearingStrapon()):
		var thebodypart = getBodypart(bodypartSlot)
		var strapon = ch.getWornStrapon()
		
		var fluids = strapon.getFluids()
		if(fluids != null):
			resultAmount = fluids.transferTo(thebodypart, amountToTransfer, 0.0, getID())
	elif(sourceType == FluidSource.Pissing):
		var thebodypart = getBodypart(bodypartSlot)
		ch.peeProduction.getFluids().transferTo(thebodypart, amountToTransfer, 100.0)
	else:
		var thebodypart = getBodypart(bodypartSlot)
		resultAmount = ch.getFluidAmount(sourceType) * amountToTransfer
		thebodypart.addFluidOrifice(ch.getFluidType(sourceType), resultAmount, ch.getFluidDNA(sourceType))
	
	if(sourceType in [FluidSource.Penis, FluidSource.Strapon]):
		skillsHolder.receivedCreampie(characterID)
		if(ch != null && resultAmount > 0.0):
			ch.getSkillsHolder().cameInsideSomeone(getID())
	
	if(!advancedData.has("noEvent") || !advancedData["noEvent"]):
		if(sourceType == FluidSource.Penis):
			var event = SexEventHelper.create(SexEvent.HoleCreampied, characterID, getID(), {
				hole = bodypartSlot,
				loadSize = resultAmount,
				knotted = (advancedData.has("knotted") && advancedData["knotted"]),
				engulfed = (advancedData.has("engulfed") && advancedData["engulfed"]),
				condomBroke = condomBroke,
			})
			ch.sendSexEvent(event)
			sendSexEvent(event)
		if(sourceType == FluidSource.Strapon):
			var event = SexEventHelper.create(SexEvent.StraponCreampied, characterID, getID(), {
				hole = bodypartSlot,
				loadSize = resultAmount,
				knotted = (advancedData.has("knotted") && advancedData["knotted"]),
				engulfed = (advancedData.has("engulfed") && advancedData["engulfed"]),
			})
			ch.sendSexEvent(event)
			sendSexEvent(event)
	
	return {loadSize=resultAmount,condomBroke=condomBroke}
	
func cummedInVaginaBy(characterID, sourceType = null, amountToTransfer = 1.0):
	return cummedInBodypartBy(BodypartSlot.Vagina, characterID, sourceType, amountToTransfer)

func cummedInAnusBy(characterID, sourceType = null, amountToTransfer = 1.0):
	return cummedInBodypartBy(BodypartSlot.Anus, characterID, sourceType, amountToTransfer)

func cummedInMouthBy(characterID, sourceType = null, amountToTransfer = 1.0):
	return cummedInBodypartBy(BodypartSlot.Head, characterID, sourceType, amountToTransfer)

func cummedInVaginaByAdvanced(characterID, advancedData:Dictionary={}, sourceType = null, amountToTransfer = 1.0):
	return cummedInBodypartByAdvanced(BodypartSlot.Vagina, characterID, advancedData, sourceType, amountToTransfer)

func cummedInAnusByAdvanced(characterID, advancedData:Dictionary={}, sourceType = null, amountToTransfer = 1.0):
	return cummedInBodypartByAdvanced(BodypartSlot.Anus, characterID, advancedData, sourceType, amountToTransfer)

func cummedInMouthByAdvanced(characterID, advancedData:Dictionary={}, sourceType = null, amountToTransfer = 1.0):
	return cummedInBodypartByAdvanced(BodypartSlot.Head, characterID, advancedData, sourceType, amountToTransfer)

func rubsVaginasWith(characterID, chanceToStealCum = 100, showMessages:bool = true):
	if(!RNG.chance(chanceToStealCum) || !OPTIONS.isContentEnabled(ContentType.CumStealing)):
		return
	
	if(!hasBodypart(BodypartSlot.Vagina)):
		return
	var ch = GlobalRegistry.getCharacter(characterID)
	if(ch == null || !ch.hasBodypart(BodypartSlot.Vagina)):
		return
	
	var orifice: Orifice = getBodypart(BodypartSlot.Vagina).getOrifice()
	var npcOrifice: Orifice = ch.getBodypart(BodypartSlot.Vagina).getOrifice()
	if(orifice == null || npcOrifice == null):
		return
	
	var success = orifice.shareFluids(npcOrifice, RNG.randf_range(0.2, 0.4), getID())
	if(showMessages && success):
		emit_signal("exchangedCumDuringRubbing", getName(), ch.getName())

	if(true):
		var event = SexEventHelper.create(SexEvent.RubbedVaginas, getID(), characterID, {
			sharedFluids = success,
		})
		ch.sendSexEvent(event)
		sendSexEvent(event)

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
	
func getOrificePreventedFromRecovering(orificeType):
	if(buffsHolder.getOrificePreventedFromRecovering(orificeType)):
		return true
	
	return false
	
func getOrificeBlocked(orificeType):
	return buffsHolder.getOrificeBlocked(orificeType)

func gotOrificeStretchedWith(bodypartSlot, insertionSize, showMessages:bool = true, stretchMult = 1.0):
	if(!hasBodypart(bodypartSlot)):
		return
	var thebodypart = getBodypart(bodypartSlot)
	
	var orifice: Orifice = thebodypart.getOrifice()
	if(orifice == null):
		return
	var oldLooseness = orifice.getLooseness()
	thebodypart.handleInsertion(insertionSize, stretchMult)
	var newLooseness = orifice.getLooseness()
	if(newLooseness > oldLooseness && showMessages):
		emit_signal("orificeBecomeMoreLoose", thebodypart.getOrificeName(), newLooseness, oldLooseness)

func gotOrificeStretchedBy(bodypartSlot, characterID, showMessages:bool = true, stretchMult = 1.0):
	if(!hasBodypart(bodypartSlot)):
		return
	
	var ch = GlobalRegistry.getCharacter(characterID)
	assert(ch != null)
	gotOrificeStretchedWith(bodypartSlot, ch.getPenisSize(), showMessages, stretchMult)

func getPenetrationFreeRoom(bodypartSlot, insertionSize):
	if(!hasBodypart(bodypartSlot)):
		return 0.0
	var thebodypart = getBodypart(bodypartSlot)
	
	var orifice: Orifice = thebodypart.getOrifice()
	if(orifice == null):
		return 0.0
	
	var goodSize = orifice.getComfortableInsertion()
	
	var diff = goodSize - insertionSize
	return diff

func getPenetrationFreeRoomBy(bodypartSlot, characterID):
	var ch = GlobalRegistry.getCharacter(characterID)
	assert(ch != null)
	return getPenetrationFreeRoom(bodypartSlot, ch.getPenisSize())

func getPenetrateChance(bodypartSlot, insertionSize):
	if(!hasBodypart(bodypartSlot)):
		return 0.0
	var thebodypart = getBodypart(bodypartSlot)
	
	var orifice: Orifice = thebodypart.getOrifice()
	if(orifice == null):
		return 0.0
	
	var goodSize = orifice.getComfortableInsertion()
	
	var diff = insertionSize - goodSize
	if(diff <= 0.0):
		return 100.0
	
	return max(500.0 / (5.0 + diff), 30.0)

func getPenetrateChanceBy(bodypartSlot, characterID, isKnotting:bool = false):
	var ch = GlobalRegistry.getCharacter(characterID)
	assert(ch != null)
	if(isKnotting && hasPerk(Perk.CumUniqueBiology)):
		return 100.0
	return getPenetrateChance(bodypartSlot, ch.getPenisSize())

func getKnottingChanceBy(bodypartSlot, characterID):
	return getPenetrateChanceBy(bodypartSlot, characterID, true)

func gotFuckedBy(bodypartSlot, characterID, showMessages:bool = true, fireSexEvent:bool = true):
	if(!hasBodypart(bodypartSlot)):
		return
	
	var ch = GlobalRegistry.getCharacter(characterID)
	assert(ch != null)
	gotOrificeStretchedWith(bodypartSlot, ch.getPenisSize(), showMessages)
	addStamina(buffsHolder.getCustom(BuffAttribute.StaminaRecoverAfterSex))
	ch.addStamina(ch.getBuffsHolder().getCustom(BuffAttribute.StaminaRecoverAfterSex))
	if(fireSexEvent):
		var event = SexEventHelper.create(SexEvent.HolePenetrated, characterID, getID(), {
			hole = bodypartSlot,
			engulfed = false,
			strapon = ch.isWearingStrapon(),
		})
		ch.sendSexEvent(event)
		sendSexEvent(event)

func gotVaginaFuckedBy(characterID, showMessages:bool = true):
	return gotFuckedBy(BodypartSlot.Vagina, characterID, showMessages)

func gotAnusFuckedBy(characterID, showMessages:bool = true):
	return gotFuckedBy(BodypartSlot.Anus, characterID, showMessages)

func gotThroatFuckedBy(characterID, showMessages:bool = true):
	return gotFuckedBy(BodypartSlot.Head, characterID, showMessages)

func getExposure() -> float:
	return buffsHolder.getExposure()

func makeNipplesSore():
	if(!hasPerk(Perk.MilkNoSoreNipples)):
		addEffect(StatusEffect.SoreNipplesAfterMilking)

func hasSoreNipples() -> bool:
	return hasEffect(StatusEffect.SoreNipplesAfterMilking)

func removeNippleSoreness():
	removeEffect(StatusEffect.SoreNipplesAfterMilking)

# PREGNANCY STUFF

func getBaseFertility() -> float:
	return 1.0

func getFertility() -> float:
	if(hasPerk(Perk.StartInfertile)):
		return 0.0
	
	var value:float = getBaseFertility()
	
	value += buffsHolder.getFertility()
	
	value *= (1.0 + buffsHolder.getCustom(BuffAttribute.FinalFertilityModifier))
	
	return value

func getBaseVirility() -> float:
	return 1.0

func getVirility() -> float:
	if(hasPerk(Perk.StartMaleInfertility)):
		return 0.0
	
	var value:float = getBaseFertility()
	
	value += buffsHolder.getVirility()
	
	value *= (1.0 + buffsHolder.getCustom(BuffAttribute.FinalVirilityModifier))
	
	return value
	
func getBaseEggsMod() -> float:
	return 1.0

func getEggsBonusMod() -> float:
	var value:float = getBaseEggsMod()
	
	value += buffsHolder.getEggsBonusMod()
	
	return value
	
func getMinEggsAmount() -> int:
	var value:int = buffsHolder.getMinEggsAmount()
	
	return Util.maxi(value, 1) 

func getCrossSpeciesCompatibility() -> float:
	var value:float = 0.0
	
	value += buffsHolder.getCrossSpeciesCompatibility()
	
	if(hasPerk(Perk.FertilityBroodmother) && value < 1.0):
		return 1.0
	
	return value

func onFluidObsorb(orificeType, cumType, howMuch, fluidDNA):
	if(menstrualCycle != null):
		menstrualCycle.obsorbCum(cumType, howMuch, fluidDNA, orificeType)

func getMenstrualCycle():
	return menstrualCycle

func isPregnant() -> bool:
	if(menstrualCycle != null):
		return menstrualCycle.isPregnant()
	return false

func isPregnantFrom(_charID:String) -> bool:
	if(menstrualCycle != null):
		return menstrualCycle.isPregnantFrom(_charID)
	return false

func isVisiblyPregnant() -> bool:
	if(menstrualCycle != null):
		return menstrualCycle.isVisiblyPregnant()
	return false

func isVisiblyPregnantFromPlayer() -> bool:
	if(menstrualCycle != null):
		return menstrualCycle.isVisiblyPregnantFromPlayer()
	return false

func isHeavilyPregnant() -> bool:
	if(menstrualCycle != null):
		return menstrualCycle.getPregnancyProgress() > 0.66
	return false

func isReadyToGiveBirth() -> bool:
	if(menstrualCycle != null):
		return menstrualCycle.isReadyToGiveBirth()
	return false

func giveBirth() -> Array:
	if(menstrualCycle == null):
		return []
	
	clearOrificeFluids()
	var bornChildren = getMenstrualCycle().giveBirth()
	for child in bornChildren:
		GM.CS.addChild(child)
	
	return bornChildren

func giveBirthWithNotification() -> Array:
	return giveBirth()

func forceOvulate() -> bool:
	if(menstrualCycle != null):
		return menstrualCycle.forceOvulate()
	return false

func forceIntoHeat():
	if(menstrualCycle != null):
		menstrualCycle.forceIntoHeat()

func forceImpregnateBy(otherCharacterID) -> bool:
	if(menstrualCycle != null):
		return menstrualCycle.forceImpregnateBy(otherCharacterID)
	return false

func getPregnancyProgress() -> float:
	if(menstrualCycle != null):
		return menstrualCycle.getPregnancyProgress()
	return 0.0

func getPregnancyLitterSize() -> int:
	if(menstrualCycle != null):
		return menstrualCycle.getLitterSize()
	return 0

func isInHeat() -> bool:
	if(menstrualCycle != null):
		return menstrualCycle.isInHeat()
	return false

func onGivingBirth(_impregnatedEggCells: Array, _newkids: Array):
	var amountPerOrifice:Dictionary = {}
	for egg in _impregnatedEggCells:
		if(!amountPerOrifice.has(egg.getOrifice())):
			amountPerOrifice[egg.getOrifice()] = 0
		amountPerOrifice[egg.getOrifice()] += 1
	
	# This is meh
	var mapping:Dictionary = {
		OrificeType.Vagina: BodypartSlot.Vagina,
		OrificeType.Anus: BodypartSlot.Anus,
		OrificeType.Throat: BodypartSlot.Head,
	}
	
	for orificeType in mapping:
		if(!amountPerOrifice.has(orificeType)):
			continue
		
		var amountToStretch:float = sqrt(amountPerOrifice[orificeType]) * 30.0
		
		gotOrificeStretchedWith(mapping[orificeType], amountToStretch)

# END OF PREGNANCY STUFF

func hasPenis():
	return hasBodypart(BodypartSlot.Penis)

func hasReachablePenis():
	if(buffsHolder.hasBuff(Buff.ChastityPenisBuff)):
		return false
	if(isWearingStrapon()): # Strapons go over the penis, blocking it
		return false
	return hasPenis()

func hasVagina():
	return hasBodypart(BodypartSlot.Vagina)

func hasReachableVagina():
	if(buffsHolder.hasBuff(Buff.ChastityVaginaBuff)):
		return false
	return hasVagina()

func hasAnus():
	return true

func hasReachableAnus():
	if(buffsHolder.hasBuff(Buff.ChastityAnusBuff)):
		return false
	return hasAnus()

func hasHair():
	return hasBodypart(BodypartSlot.Hair) && getBodypart(BodypartSlot.Hair).id != "baldhair"

func hasTail():
	return hasBodypart(BodypartSlot.Tail)
	
func hasHorns():
	return hasBodypart(BodypartSlot.Horns)

func hasNonFlatBreasts():
	if(!hasBodypart(BodypartSlot.Breasts)):
		return false
	var breasts = getBodypart(BodypartSlot.Breasts)
	
	var size = breasts.getSize()
	
	if(size > BreastsSize.FLAT):
		return true
	else:
		return false

func hasBigBreasts():
	if(!hasBodypart(BodypartSlot.Breasts)):
		return false
	var breasts = getBodypart(BodypartSlot.Breasts)
	
	var size = breasts.getSize()
	
	if(size > BreastsSize.C):
		return true
	else:
		return false

func hasSmallBreasts():
	if(!hasBodypart(BodypartSlot.Breasts)):
		return true
	var breasts = getBodypart(BodypartSlot.Breasts)
	
	var size = breasts.getSize()
	
	if(size <= BreastsSize.B):
		return true
	else:
		return false

func isLactating():
	if(!hasBodypart(BodypartSlot.Breasts)):
		return false
	var breasts: BodypartBreasts = getBodypart(BodypartSlot.Breasts)
	var production: FluidProduction = breasts.getFluidProduction()
	if(production == null):
		return false
	return production.shouldProduce()
	
func canBeMilked():
	if(!hasBodypart(BodypartSlot.Breasts)):
		return false
	var breasts: BodypartBreasts = getBodypart(BodypartSlot.Breasts)
	var production: FluidProduction = breasts.getFluidProduction()
	if(production == null):
		return false
	return production.getFluidAmount() > 0.0

func hasBreastsFullOfMilk():
	if(!hasBodypart(BodypartSlot.Breasts)):
		return false
	var breasts: BodypartBreasts = getBodypart(BodypartSlot.Breasts)
	var production: FluidProduction = breasts.getFluidProduction()
	if(production == null):
		return false
	return production.getFluidLevel() >= 1.0

func milk(howmuch = 1.0):
	if(!hasBodypart(BodypartSlot.Breasts)):
		return 0.0
	var breasts: BodypartBreasts = getBodypart(BodypartSlot.Breasts)
	var production: FluidProduction = breasts.getFluidProduction()
	if(production == null):
		return 0.0
	var howMuchMilk = production.drain(howmuch)
	production.afterMilked()
	if(howmuch >= 0.5):
		makeNipplesSore()
	if(isPlayer()):
		addSkillExperience(Skill.Milking, 20)
	return howMuchMilk

func breastFedBy(characterID, amountToTransfer = 1.0):
	var ch = GlobalRegistry.getCharacter(characterID)
	
	if(ch.hasBodypart(BodypartSlot.Breasts)):
		var thebodypart = getBodypart(BodypartSlot.Head)
		var usedBodypart = ch.getBodypart(BodypartSlot.Breasts)
		
		var fluids = usedBodypart.getFluids()
		
		if(fluids != null && thebodypart != null):
			fluids.transferTo(thebodypart, amountToTransfer)
		
		var production: FluidProduction = usedBodypart.getFluidProduction()
		if(production != null):
			production.afterMilked()
		
	if(!ch.hasPerk(Perk.MilkNoSoreNipples) && amountToTransfer >= 0.5):
		ch.addEffect(StatusEffect.SoreNipplesAfterMilking)
			
func induceLactation():
	if(!hasBodypart(BodypartSlot.Breasts)):
		return false
	
	var breasts = getBodypart(BodypartSlot.Breasts)
	breasts.induceLactation()

func stimulateLactation():
	if(!hasBodypart(BodypartSlot.Breasts)):
		return false
	
	var breasts: BodypartBreasts = getBodypart(BodypartSlot.Breasts)
	var production: Lactation = breasts.getFluidProduction()
	if(production == null):
		return false
	if(isPlayer()):
		addSkillExperience(Skill.Milking, 5)
	if(production.has_method("stimulate")):
		return production.stimulate()
	return false

func canBeSeedMilked():
	if(!hasBodypart(BodypartSlot.Penis)):
		return false
	var penis: BodypartPenis = getBodypart(BodypartSlot.Penis)
	var production: FluidProduction = penis.getFluidProduction()
	if(production == null):
		return false
	return production.getFluidAmount() > 0.0

func milkSeed(howmuch = 1.0):
	if(!hasBodypart(BodypartSlot.Penis)):
		return 0.0
	var penis: BodypartPenis = getBodypart(BodypartSlot.Penis)
	var production: FluidProduction = penis.getFluidProduction()
	if(production == null):
		return 0.0
	var howMuchSeed = production.drain(howmuch)
	production.afterMilked()
	return howMuchSeed

func hasBallsFullOfSeed():
	if(!hasBodypart(BodypartSlot.Penis)):
		return false
	var penis: BodypartPenis = getBodypart(BodypartSlot.Penis)
	var production: FluidProduction = penis.getFluidProduction()
	if(production == null):
		return false
	return production.getFluidLevel() >= 1.0

func getCumInflationLevel(checkContent:bool=true):
	if(checkContent && !OPTIONS.isContentEnabled(ContentType.CumInflation)):
		return 0.0
	
	var bodypartsToCalculate = [BodypartSlot.Head, BodypartSlot.Vagina, BodypartSlot.Anus]
	var totalAmount = 0.0

	for bodypartSlot in bodypartsToCalculate:
		if(!hasBodypart(bodypartSlot)):
			continue
		var bodypart:Bodypart = getBodypart(bodypartSlot)
		var orifice: Orifice = bodypart.getOrifice()
		if(orifice == null):
			continue
		
		totalAmount += orifice.getFluidAmount()
		
	# If we have more than 3L inside of us, anything extra makes us inflated
	var threshold = 3000.0
	var tooMuch = max(totalAmount - threshold, 0.0)
	
	return clamp(tooMuch / 2000.0, 0.0, 10.0)
# Doll stuff

func getDollParts() -> Dictionary:
	var parts = {}
	for bodypartSlot in bodyparts:
		if(bodyparts[bodypartSlot] == null):
			continue
		var bodypart: Bodypart = bodyparts[bodypartSlot]
		
		var partSlot = bodypart.getSlot()
		if(partSlot == null || partSlot == ""):
			continue
		
		var partScene = bodypart.getDoll3DScene()
		if(partScene == null || partScene == ""):
			continue
		
		parts[partSlot] = partScene
	return parts

func updateLeaking(doll: Doll3D):
	if(hasEffect(StatusEffect.BreastsFull)):
		doll.setBreastsLeaking(true)
	else:
		doll.setBreastsLeaking(false)
		
	if(hasEffect(StatusEffect.HasCumInsideVagina) && !buffsHolder.hasBuff(Buff.BlocksVaginaLeakingBuff)):
		doll.setPussyLeaking(true)
	else:
		doll.setPussyLeaking(false)

	if(hasEffect(StatusEffect.HasCumInsideAnus) && !buffsHolder.hasBuff(Buff.BlocksAnusLeakingBuff)):
		doll.setAnusLeaking(true)
	else:
		doll.setAnusLeaking(false)

func getWritingsData() -> Dictionary:
	if(hasEffect(StatusEffect.HasBodyWritings)):
		return getEffect(StatusEffect.HasBodyWritings).getDollData()
	return {}

func softUpdateDoll(doll: Doll3D):
	doll.writingsData = getWritingsData()
	
	var skinData = {}
	var bodySkinData = getSkinData()
	var fieldsToCheckSkin = ["skin", "r", "g", "b"]
	for bodypartSlot in bodyparts:
		var bodypart = getBodypart(bodypartSlot)
		if(bodypart == null):
			continue
		if(bodypart.supportsSkin()):
			var bodypartSkinData = bodypart.getSkinData()
			for field in fieldsToCheckSkin:
				if(!bodypartSkinData.has(field) || bodypartSkinData[field] == null):
					if(bodySkinData.has(field)):
						bodypartSkinData[field] = bodySkinData[field]
			
			skinData[bodypartSlot] = bodypartSkinData
	doll.setSkinData(skinData)
	if(hasEffect(StatusEffect.CoveredInCum)):
		doll.setCumAmount(getOutsideMessinessLevel())
		var dominantFluidID = getFluids().getDominantFluidID()
		if(dominantFluidID != null):
			var fluidObject = GlobalRegistry.getFluid(dominantFluidID)
			if(fluidObject != null):
				doll.setCumColor(fluidObject.getCumOverlayColor())
		else:
			doll.setCumColor(Color.white)
	else:
		doll.setCumAmount(0)
	doll.updateMaterials()
	
	doll.setArmsCuffed(false)
	doll.setLegsCuffed(false)
	doll.setState("mouth", "")
	doll.setState("muzzle", "")
	doll.setState("gloves", "")
	doll.setState("armalpha", "")
	if(bodypartHasTrait(BodypartSlot.Legs, PartTrait.LegsPlanti)):
		doll.setState("legstype", "planti")
	elif(bodypartHasTrait(BodypartSlot.Legs, PartTrait.LegsDigi)):
		doll.setState("legstype", "digi")
	elif(bodypartHasTrait(BodypartSlot.Legs, PartTrait.LegsHoofs)):
		doll.setState("legstype", "hoofs")
	else:
		doll.setState("legstype", "")
	updateLeaking(doll)
		
	if(bodypartHasTrait(BodypartSlot.Arms, PartTrait.ArmsBuff)):
		doll.setState("armstype", "buff")
	else:
		doll.setState("armstype", "")
	
	if(isReadyToPenetrate()):
		doll.setState("cock", "")
	else:
		doll.setState("cock", "limp")
	
	var breastsScale = 1.0
	if(hasBodypart(BodypartSlot.Breasts)):
		var breasts = getBodypart(BodypartSlot.Breasts)
		if(breasts.has_method("getBreastsScale")):
			breastsScale = breasts.getBreastsScale()
		doll.breastScale = breasts.getBreastsAdjustScale()
	else:
		doll.breastScale = 0.0
	doll.setBreastsScale(breastsScale)
	
	if(hasBodypart(BodypartSlot.Head)):
		var thehead = getBodypart(BodypartSlot.Head)
		if(thehead.has_method("getHeadLength")):
			doll.headLength = thehead.getHeadLength()
		else:
			doll.headLength = 0.0
	else:
		doll.headLength = 0.0
	
	var penisScale = 1.0
	var ballsScale = 1.0
	if(hasBodypart(BodypartSlot.Penis)):
		var penis = getBodypart(BodypartSlot.Penis)
		if(penis.has_method("getPenisScale")):
			penisScale = penis.getPenisScale()
		if(penis.has_method("getBallsScale")):
			ballsScale = penis.getBallsScale()
	doll.setPenisScale(penisScale)
	doll.setBallsScale(ballsScale)
	
	if(hasNonFlatBreasts()):
		doll.setState("breasts", "nonflat")
	else:
		doll.setState("breasts", "flat")

	var pregnancyValue = clamp(getPregnancyProgress(), 0.0, 1.0)
	
	var pregnancyKidAmount = getPregnancyLitterSize()
	var extraKidsMult = 1.0
	if(OPTIONS.getBellyMaxSizeDependsOnLitterSize() && pregnancyKidAmount > 1):
		# Rough values
		# Kid amount 1   2   3   4   5   6   7   8   9   10   11   12   13   14   15   16
		# Belly size 1.0 1.2 1.3 1.4 1.5 1.6 1.6 1.7 1.7 1.78 1.82 1.86 1.89 1.93 1.96 2.0
		extraKidsMult = pow(pregnancyKidAmount, 0.25)
		
	pregnancyValue *= extraKidsMult
	pregnancyValue *= OPTIONS.getBellyMaxSizeModifier()
	
	var thicknessNorm = getThickness() / 100.0
	var femNorm = getFemininity() / 100.0
	var pregnancyAddition = 0.0
	if(femNorm < 0.5):
		pregnancyAddition = -0.1 * (1.0 - (femNorm * 2.0))
	
	pregnancyValue += pregnancyAddition
	
	var cumInflationLevel = getCumInflationLevel()
	pregnancyValue += clamp(cumInflationLevel / 2.0, 0.0, 1.0)
	pregnancyValue += getCustomAttribute(BuffAttribute.InflatedBelly)
	
	pregnancyValue *= (1.0 + getCustomAttribute(BuffAttribute.BellySizeModifier))
	
	if(pregnancyValue < -0.5):
		pregnancyValue = -0.5
	
	doll.setPregnancy(pregnancyValue)
	
	var theTailScale = 1.0
	if(hasBodypart(BodypartSlot.Tail)):
		var theTail = getBodypart(BodypartSlot.Tail)
		if(theTail.has_method("getTailScale")):
			theTailScale = theTail.getTailScale()
	
	if(thicknessNorm <= 0.5):
		doll.setButtScale(1.0 - 0.2 * (1.0 - thicknessNorm * 2), theTailScale)
		doll.setThighThickness(- 0.4 * (1.0 - thicknessNorm * 2))
	else:
		doll.setButtScale(1.0 + (thicknessNorm - 0.5)/1.5, theTailScale)
		doll.setThighThickness((thicknessNorm - 0.5))
	
	doll.selfChains = []
	var wearingItems = getInventory().getAllEquippedItems()
	for inventorySlot in wearingItems:
		var item = wearingItems[inventorySlot]
		if(item == null):
			continue
		
		# Add a check here that the item is actually visible first?
		item.updateDoll(doll)
		
		var newChains = item.getChains()
		if(newChains != null):
			for selfChain in newChains:
				doll.selfChains.append([selfChain[0], selfChain[1], "self", selfChain[2]])
			#doll.selfChains.append_array(newChains)
	doll.call_deferred("checkChains")

func updateDoll(doll: Doll3D):
	softUpdateDoll(doll)
	
	var parts = getDollParts()
	
	var newAlphas = {}
	var newAttachmentAlphas = {}

	var exposedBodyparts = doll.getExposedBodyparts()

	var partsScenes = {}
	var equippedItems = getInventory().getAllEquippedItems()
	for inventorySlot in equippedItems:
		var item = equippedItems[inventorySlot]
		if(!item.shouldBeVisibleOnDoll(self, doll)):
			continue
		
		var blocksBodyparts = item.coversBodyparts()
		if(!(item.alwaysVisible() && !doll.isOnlyPenis) && exposedBodyparts!=null && exposedBodyparts.size() > 0 && blocksBodyparts != null):
			var shouldBeSkipped = false
			for exposedBodypart in exposedBodyparts:
				if(blocksBodyparts.has(exposedBodypart)):
					shouldBeSkipped = true
					break
			if(shouldBeSkipped):
				continue
		
		var alphaStuff = item.getHidesParts(self)
		if(alphaStuff != null):
			for zone in alphaStuff:
				newAlphas[zone] = true
				
		var alphaStuff2 = item.getHidesAttachments(self)
		if(alphaStuff2 != null):
			for zone in alphaStuff2:
				newAttachmentAlphas[zone] = true
		
		var riggedScenes = item.getRiggedParts(self)
		if(riggedScenes == null):
			 continue
			
		for zone in riggedScenes:
			parts[zone] = [riggedScenes[zone], item] #Hack alert
	
	for inventorySlot in equippedItems:
		var item = equippedItems[inventorySlot]
		
		var scenes = item.getUnriggedParts(self)
		if(scenes == null):
			 continue
		
		for zone in scenes:
			if(!partsScenes.has(zone)):
				partsScenes[zone] = []
			partsScenes[zone].append_array(scenes[zone])

	doll.setHiddenParts(newAlphas)
	doll.setHiddenAttachmentZones(newAttachmentAlphas)
	doll.setParts(parts)
	doll.setUnriggedParts(partsScenes)
	
func getSkillExperienceMult(skill):
	var mult = 0.0

	mult += buffsHolder.getSkillExperienceMult(skill)

	return mult

func getBestZoneForTallymark(zonelist):
	if(zonelist is int):
		return zonelist
	if(zonelist.size() == 0):
		return null
	
	var marks = {}
	if(hasEffect(StatusEffect.HasTallyMarks)):
		marks = getEffect(StatusEffect.HasTallyMarks).marks
	
	var possible = []
	for zone in zonelist:
		var zonestr = str(zone)
		var currentAmount = 0
		if(marks.has(zonestr)):
			currentAmount = marks[zonestr]
		
		var value:float = 1.0
		if(currentAmount >= 1 && currentAmount < 20):
			value = 1000.0 / float(currentAmount)
		possible.append([zone, value])
	return RNG.pickWeightedPairs(possible)

func addTallymark(zone):
	addEffect(StatusEffect.HasTallyMarks, [zone])

func addTallymarkPickBestZone(zonelist):
	var bestZone = getBestZoneForTallymark(zonelist)
	addEffect(StatusEffect.HasTallyMarks, [bestZone])
	return bestZone

func addTallymarkFace():
	return addTallymarkPickBestZone([
		BodyWritingsZone.CheekLeft,
		BodyWritingsZone.CheekRight,
	])

func addTallymarkCrotch():
	return addTallymarkPickBestZone([
		BodyWritingsZone.LowerAbdomen,
		BodyWritingsZone.HipLeft,
		BodyWritingsZone.HipRight,
		BodyWritingsZone.ButtcheekLeft,
		BodyWritingsZone.ButtcheekRight,
		BodyWritingsZone.ThighLeft,
		BodyWritingsZone.ThighRight,
	])

func addTallymarkButt():
	return addTallymarkCrotch()

func hasTallymarks():
	return hasEffect(StatusEffect.HasTallyMarks)

func getTallymarkCount() -> int:
	if(!hasTallymarks()):
		return 0
	return getEffect(StatusEffect.HasTallyMarks).totalAmount

func clearTallymarks():
	removeEffect(StatusEffect.HasTallyMarks)

func addBodywriting(zone, writingID, isPermanent:bool = false):
	addEffect(StatusEffect.HasBodyWritings, [zone, writingID, isPermanent])

func addBodywritingRandom(isPermanent:bool = false):
	var zone = BodyWritingsZone.getRandomZone()
	addBodywriting(zone, BodyWritings.getRandomWritingIDForZone(zone), isPermanent)

func addBodywritingLowerBody(isPermanent:bool = false):
	var zone = BodyWritingsZone.getRandomZoneLowerPart()
	addBodywriting(zone, BodyWritings.getRandomWritingIDForZone(zone), isPermanent)

func hasBodywritings():
	return hasEffect(StatusEffect.HasBodyWritings)

func hasPermanentBodywritings() -> bool:
	if(hasEffect(StatusEffect.HasBodyWritings)):
		var theEffect = getEffect(StatusEffect.HasBodyWritings)
		return theEffect.getPermanentAmount() > 0
	return false

func getBodywritingsCount() -> int:
	if(!hasBodywritings()):
		return 0
	return getEffect(StatusEffect.HasBodyWritings).getAmount()

func clearBodywritings(nonPermanent:bool = true, permanent:bool = false):
	if(nonPermanent && permanent):
		removeEffect(StatusEffect.HasBodyWritings)
		updateAppearance()
		return
	if(!hasEffect(StatusEffect.HasBodyWritings)):
		return
	var theEffect = getEffect(StatusEffect.HasBodyWritings)
	theEffect.removeWritings(nonPermanent, permanent)
	updateAppearance()

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

func isMuzzled():
	return buffsHolder.hasBuff(Buff.MuzzleBuff)

func hasBuff(buffID):
	return buffsHolder.hasBuff(buffID)

func canStartSex() -> bool:
	if(hasBoundArms()):
		return false
	if(hasBlockedHands()):
		return false
	#if(hasBoundLegs()): # Means there are chains around ankles but its fine
	#	return false
	#if(isOralBlocked()):
	#	return false
	return true

func invCanEquipSlot(slot):
	if(slot == InventorySlot.Penis && !hasPenis()):
		return false
	if(slot == InventorySlot.Vagina && !hasVagina()):
		return false
	
	return true

func getRestraintResistance():
	return 0.9

func getRestraintStrugglePower():
	return 1.0

func getRestraintStrugglingMinigameResult():
	var minigameResult:MinigameResult = MinigameResult.new()
	
	var strugglePower:float = getRestraintStrugglePower()
	
	# Creates a normal distribution of sorts
	var howMany = 5 # The bigger this number is, the closer the score will be to 1.0 on average
	var result:float = 0.0
	for _i in range(howMany):
		result += RNG.randf_range(0.0, 2.0)
	result /= howMany
	minigameResult.score = clamp(result, 0.0, 1.0) * strugglePower

	var epicFailChance = 5.0 - clamp(strugglePower-1.0, -1.0, 1.0) * 5.0
	if(RNG.chance(epicFailChance)):
		minigameResult.score = 0.0
		minigameResult.failedHard = true

	return minigameResult

func processStruggleTurn(isActivelyStruggling = false):
	var texts = []
	var damage = 0.0
	var addLust = 0
	var addPain = 0
	var addStamina = 0
	
	for item in getInventory().getEquppedRestraints():
		var restraintData: RestraintData = item.getRestraintData()
		var struggleData = restraintData.processStruggleTurn(self, isActivelyStruggling)
		
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

func getCustomAttribute(id):
	return buffsHolder.getCustom(id)

func getBlockArmor() -> int:
	return 20 + buffsHolder.getCustom(BuffAttribute.BlockArmor)

func getDefocusArmor() -> int:
	return 20 + buffsHolder.getCustom(BuffAttribute.DefocusArmor)

func isBodypartCovered(bodypartSlot):
	var equippedItems = inventory.getAllEquippedItems()
	for inventorySlot in equippedItems:
		var item = equippedItems[inventorySlot]
		if(item.coversBodypart(bodypartSlot)):
			return true

	return false

func afterOrgasm(_isSexEngine = false):
	if(!_isSexEngine):
		cumOnFloor()
		addLust(-lust)
	
	if(hasBodypart(BodypartSlot.Penis)):
		var penis:BodypartPenis = getBodypart(BodypartSlot.Penis)
		var production: FluidProduction = penis.getFluidProduction()
		if(production != null):
			production.fillPercent(buffsHolder.getCustom(BuffAttribute.CumGenerationAfterOrgasm))

	for zone in getSensitiveZones():
		zone.onOrgasm()

func cumOnFloor(_characterID: String = ""):
	if(hasBodypart(BodypartSlot.Penis)):
		var penis:BodypartPenis = getBodypart(BodypartSlot.Penis)
		var production: FluidProduction = penis.getFluidProduction()
		if(production != null):
			if(getWornCondom() != null):
				return cumInItem(getWornCondom())
			if(getWornPenisPump() != null):
				var result = cumInItem(getWornPenisPump()) # Collect some into the penis pump
				var returnValue = penis.getFluidProduction().drain() # Waste the rest
				
				if(_characterID != ""):
					var event = SexEventHelper.create(SexEvent.PenisPumpMilked, _characterID, getID(), {
						loadSize = result,
					})
					sendSexEvent(event)
					if(_characterID != getID()):
						var otherChar = GlobalRegistry.getCharacter(_characterID)
						if(otherChar != null):
							otherChar.sendSexEvent(event)
				return result + returnValue
			
			var returnValue = penis.getFluidProduction().drain()
			return returnValue

func cumInItem(theItem, sourceType = FluidSource.Penis, amountToTransfer = 1.0):
	if(theItem.getFluids() == null):
		return 0.0
	
	if(sourceType == FluidSource.Penis && hasBodypart(BodypartSlot.Penis)):
		var penis:BodypartPenis = getBodypart(BodypartSlot.Penis)
		var production: FluidProduction = penis.getFluidProduction()
		if(production != null):
			if(theItem.has_method("markLastUser")):
				theItem.markLastUser(getName())
			var returnValue = penis.getFluids().transferTo(theItem, amountToTransfer)
			return returnValue
	elif(sourceType == FluidSource.Pissing):
		if(theItem.has_method("markLastUser")):
			theItem.markLastUser(getName())
		var returnValue = peeProduction.getFluids().transferTo(theItem, amountToTransfer)
		return returnValue
	else:
		return theItem.getFluids().addFluid(getFluidType(sourceType), getFluidAmount(sourceType) * amountToTransfer, getFluidDNA(sourceType))

func createFilledCondom():
	var theCondom = GlobalRegistry.createItem("UsedCondom")
	cumInItem(theCondom)
	return theCondom

func lustStateFullyUndress():
	var items = getInventory().getAllEquippedItems()
	for itemSlot in items:
		var lustState = items[itemSlot].getItemState()
		if(lustState != null):
			lustState.remove()

func afterSexEnded(sexInfo):
	if(sexInfo.getTimesCame() > 0):
		addLust(-getLust())
		
		if(isPlayer()):
			addStamina(buffsHolder.getCustom(BuffAttribute.StaminaRecoverAfterSex))
			addSkillExperience(Skill.SexSlave, 30)
		
	for effectID in statusEffects.keys():
		var effect = statusEffects[effectID]
		if(effect.isSexEngineOnly):
			removeEffect(effectID)
		
	var items = getInventory().getAllEquippedItems()
	for itemSlot in items:
		var item = items[itemSlot]
		item.resetLustState()
		item.onSexEnd()
	
	#TODO: All of this should happen in sex engine endSex()?
	if(personalityChangesAfterSex() && personality != null && fetishHolder != null):
		var theFetishChangeResult:Dictionary = sexInfo.doFetishChangeCalculation()
		if(theFetishChangeResult.has("messages")):
			for message in theFetishChangeResult["messages"]:
				GM.main.addMessage(message)
		
		var resultText = sexInfo.affectPersonality(personality, fetishHolder)
		if(resultText != null && resultText != ""):
			GM.main.addMessage(resultText)
	
	if(!isPlayer()):
		addLust(-getLust())
		addPain(-getPain())
		addStamina(getMaxStamina())

	consciousness = 1.0
	arousal = 0.0
		
	updateAppearance()

func getFirstItemThatCoversBodypart(bodypartSlot):
	return getInventory().getFirstItemThatCoversBodypart(bodypartSlot)
	
func getWornCondom():
	if(getInventory().hasSlotEquipped(InventorySlot.Penis)):
		var item = getInventory().getEquippedItem(InventorySlot.Penis)
		if(item.id == "UsedCondom"):
			return item
	return null

func getWornPenisPump():
	if(getInventory().hasSlotEquipped(InventorySlot.Penis)):
		var item = getInventory().getEquippedItem(InventorySlot.Penis)
		if(item.hasTag(ItemTag.PenisPump)):
			return item
	return null

func isWearingCondom():
	return getWornCondom() != null
	
func isWearingNonEmptyCondom() -> bool:
	var theCondom = getWornCondom()
	if(theCondom == null):
		return false
	if(!theCondom.getFluids() || theCondom.getFluids().isEmpty()):
		return false
	return true

func getArousal() -> float:
	return clamp(arousal, 0.0, 1.0)

func addArousal(adda:float):
	arousal += adda
	#arousal = clamp(arousal, 0.0, 1.0)

func setArousal(newa:float):
	arousal = clamp(newa, 0.0, 1.0)

func getConsciousness() -> float:
	return consciousness

func addConsciousness(newc:float):
	consciousness += newc
	consciousness = clamp(consciousness, 0.0, 1.0)

func isLewdHorny() -> bool:
	return getLustLevel() >= 0.5 || getLust() >= 50 || getArousal() >= 0.3

func isReadyToPenetrate() -> bool:
	return isLewdHorny() || isWearingStrapon()

func getWornChastityCage():
	if(getInventory().hasSlotEquipped(InventorySlot.Penis)):
		var item = getInventory().getEquippedItem(InventorySlot.Penis)
		if(item.hasTag(ItemTag.ChastityCage)):
			return item
	return null

func isWearingChastityCage() -> bool:
	if(!getInventory().hasSlotEquipped(InventorySlot.Penis)):
		return false
	
	var item = getInventory().getEquippedItem(InventorySlot.Penis)
	if(item.hasTag(ItemTag.ChastityCage)):
		return true
	return false

func hasVirileFluidsIn(bodypartSlot:String) -> bool:
	if(!hasBodypart(bodypartSlot)):
		return false
	var bodypart = getBodypart(bodypartSlot)
	var theFluids = bodypart
	if(!theFluids):
		return false
	return theFluids.hasVirileFluids()

#example return values: some cum | a mixture of cum and girlcum | a mixture of cum, black goo and girlcum
func getBodypartContentsStringList(bodypartID):
	if(!hasBodypart(bodypartID)):
		return "some cum"
	var bodypart = getBodypart(bodypartID)
	var orifice = bodypart.getOrifice()
	if(orifice == null):
		return "some cum"
	
	var messFluids = orifice.getFluidList()
	if(messFluids == null || messFluids.size() == 0):
		return "some cum"
	
	var processedFluidNames = []
	for fluidID in messFluids:
		processedFluidNames.append(BodilyFluids.getFluidName(fluidID))
	
	if(processedFluidNames.size() == 1):
		return "some "+processedFluidNames[0]
	
	return "a mixture of "+Util.humanReadableList(processedFluidNames)

func bodypartTransferFluidsTo(bodypartID, otherCharacterID, otherBodypartID, fraction = 0.5, minAmount = 0.0):
	if(!hasBodypart(bodypartID)):
		return false
	var bodypart = getBodypart(bodypartID)
	var orifice = bodypart.getOrifice()
	if(orifice == null):
		return false
	
	var otherCharacter = GlobalRegistry.getCharacter(otherCharacterID)
	if(otherCharacter == null):
		return false
	if(!otherCharacter.hasBodypart(otherBodypartID)):
		return false
	var otherBodypart = otherCharacter.getBodypart(otherBodypartID)
	var otherOrifice = otherBodypart.getOrifice()
	if(otherOrifice == null):
		return false
	
	return orifice.transferTo(otherOrifice, fraction, minAmount, getID()) > 0.0

func bodypartTransferFluidsToAmount(bodypartID, otherCharacterID, otherBodypartID, fraction = 0.5, minAmount = 0.0):
	if(!hasBodypart(bodypartID)):
		return 0.0
	var bodypart = getBodypart(bodypartID)
	var orifice = bodypart.getOrifice()
	if(orifice == null):
		return 0.0
	
	var otherCharacter = GlobalRegistry.getCharacter(otherCharacterID)
	if(otherCharacter == null):
		return 0.0
	if(!otherCharacter.hasBodypart(otherBodypartID)):
		return 0.0
	var otherBodypart = otherCharacter.getBodypart(otherBodypartID)
	var otherOrifice = otherBodypart.getOrifice()
	if(otherOrifice == null):
		return 0.0
	
	return orifice.transferTo(otherOrifice, fraction, minAmount, getID())

func bodypartShareFluidsWith(bodypartID, otherCharacterID, otherBodypartID, fraction = 0.5):
	if(!hasBodypart(bodypartID)):
		return false
	var bodypart = getBodypart(bodypartID)
	var orifice = bodypart.getOrifice()
	if(orifice == null):
		return false
	
	var otherCharacter = GlobalRegistry.getCharacter(otherCharacterID)
	if(otherCharacter == null):
		return false
	if(!otherCharacter.hasBodypart(otherBodypartID)):
		return false
	var otherBodypart = otherCharacter.getBodypart(otherBodypartID)
	var otherOrifice = otherBodypart.getOrifice()
	if(otherOrifice == null):
		return false
	
	return orifice.shareFluids(otherOrifice, fraction, getID())

func processSexTurn():
	for effectID in statusEffects.keys():
		if(!statusEffects.has(effectID)):
			continue
		var effect = statusEffects[effectID]
		effect.processSexTurn()
		
	#buffsHolder.calculateBuffs()

func addTimedBuff(newbuff:BuffBase, seconds:int):
	for oldbuffEntry in timedBuffs:
		var oldbuff:BuffBase = oldbuffEntry[0]
		if(newbuff.id == oldbuff.id && oldbuff.canCombine(newbuff)):
			oldbuff.combine(newbuff)
			oldbuffEntry[1] = Util.maxi(oldbuffEntry[1], seconds)
			return
	
	timedBuffs.append([newbuff, seconds])

func addTimedBuffs(buffs: Array, seconds:int):
	for newbuff in buffs:
		addTimedBuff(newbuff, seconds)

func addTimedBuffTurns(newbuff:BuffBase, turns:int):
	if(!isInAFight()):
		return
	
	for oldbuffEntry in timedBuffsTurns:
		var oldbuff:BuffBase = oldbuffEntry[0]
		if(newbuff.id == oldbuff.id && oldbuff.canCombine(newbuff)):
			oldbuff.combine(newbuff)
			oldbuffEntry[1] = Util.maxi(oldbuffEntry[1], turns)
			return
	
	timedBuffsTurns.append([newbuff, turns])

func addTimedBuffsTurns(buffs: Array, turns:int):
	if(!isInAFight()):
		return
	
	for newbuff in buffs:
		addTimedBuffTurns(newbuff, turns)

func isInAFight() -> bool:
	return GM.main.isCharIDFighting(getID())

func updateNonBattleEffects():
	buffsHolder.calculateBuffs()

func getSortedBuffsDataByTime(theBuffs:Array) -> Dictionary:
	var result:Dictionary = {}
	
	for buffEntry in theBuffs:
		if(!result.has(buffEntry[1])):
			result[buffEntry[1]] = [buffEntry[0]]
		else:
			result[buffEntry[1]].append(buffEntry[0])
	
	return result

func getTimedBuffsTurns() -> Array:
	var result:Array = []
	for buffEntry in timedBuffsTurns:
		result.append(buffEntry[0])
	return result

func getTimedBuffs() -> Array:
	var result:Array = []
	for buffEntry in timedBuffs:
		result.append(buffEntry[0])
	return result

func saveBuffsData(buffs):
	var data:Array = []
	
	for buffEntry in buffs:
		var buff:BuffBase = buffEntry[0]
		var buffData = {
			"id": buff.id,
			"buffdata": buff.saveData(),
			"time": buffEntry[1],
		}
		data.append(buffData)
	return data

func loadBuffsData(data):
	var result:Array = []
	
	for buffFullData in data:
		if(!buffFullData.has("time")):
			continue
		var id = SAVE.loadVar(buffFullData, "id", "error")
		var buffdata = SAVE.loadVar(buffFullData, "buffdata", {})
		var buffTime:int = SAVE.loadVar(buffFullData, "time", 0)
		
		var buff: BuffBase = GlobalRegistry.createBuff(id)
		buff.loadData(buffdata)
		result.append([buff, buffTime])
	return result

func bodypartHasTrait(bodypartSlot, traitID, includeEquipment:bool = true):
	if(includeEquipment):
		if(bodypartSlot == BodypartSlot.Penis && isWearingStrapon()):
			var theStrapon = getWornStrapon()
			if(theStrapon.has_method("getStraponTraits")):
				var theStraponTraits:Dictionary = theStrapon.getStraponTraits()
				if(theStraponTraits.has(traitID) && theStraponTraits[traitID]):
					return true
			return false # Strapons override your penis' traits
	
	if(!hasBodypart(bodypartSlot)):
		return false
	
	var bodypart = getBodypart(bodypartSlot)
	return bodypart.hasTrait(traitID)

func hasAnyWomb():
	if(menstrualCycle == null):
		return false
	return menstrualCycle.hasAnyWomb()

func hasWombIn(bodypartSlot):
	if(!hasBodypart(bodypartSlot)):
		return false
	return getBodypart(bodypartSlot).hasWomb()

func getDefaultArtwork(_variant = []):
	return "res://Images/UI/GenericFace.png"

func adjustArtworkVariant(_variant:Array):
	pass

func hasIllegalItems():
	if(inventory.getItemsWithTag(ItemTag.Illegal).size() > 0):
		return true
	if(inventory.getEquippedItemsWithTag(ItemTag.Illegal).size() > 0):
		return true
	return false

func hasIllegalItemsInInventory():
	if(inventory.getItemsWithTag(ItemTag.Illegal).size() > 0):
		return true
	return false

func hasIllegalItemsEquipped():
	if(inventory.getEquippedItemsWithTag(ItemTag.Illegal).size() > 0):
		return true
	return false

func personalityChangesAfterSex():
	return false

func getCharacterType():
	return CharacterType.Generic

func getCharType():
	return getCharacterType()

func getCharacterPool():
	var theCharType = getCharacterType()
	if(theCharType == CharacterType.Guard):
		return CharacterPool.Guards
	if(theCharType == CharacterType.Nurse):
		return CharacterPool.Nurses
	if(theCharType == CharacterType.Inmate):
		return CharacterPool.Inmates
	if(theCharType == CharacterType.Engineer):
		return CharacterPool.Engineers
	if(theCharType == CharacterType.Generic):
		return null
	return theCharType

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

func isDynamicCharacter():
	return false

func canWearBreastPump():
	if(getInventory().hasSlotEquipped(InventorySlot.UnderwearTop)):
		return false
	
	return true

func canWearStrapon():
	if(hasPenis() && !isWearingChastityCage()):
		return false
	
	if(getInventory().hasSlotEquipped(InventorySlot.Strapon)):
		return false
	
	return true

func canWearOrWearingStrapon() -> bool:
	if(isWearingStrapon()):
		return true
	if(hasPenis() && !isWearingChastityCage()):
		return false
	if(getInventory().hasSlotEquipped(InventorySlot.Strapon)):
		return false
	return true

func hasStrapons():
	return getInventory().getItemsWithTag(ItemTag.Strapon).size() > 0

func hasChastityCages():
	return getInventory().getItemsWithTag(ItemTag.ChastityCage).size() > 0

func getChastityCages():
	return getInventory().getItemsWithTag(ItemTag.ChastityCage)

func getStrapons():
	return getInventory().getItemsWithTag(ItemTag.Strapon)

func isWearingStrapon():
	return getWornStrapon() != null

func isWearingLoadedStrapon():
	var theStrapon = getWornStrapon()
	if(theStrapon == null):
		return false
	var fluids = theStrapon.getFluids()
	if(fluids == null):
		return false
	return !fluids.isEmpty()

func getWornStrapon():
	if(getInventory().hasSlotEquipped(InventorySlot.Strapon)):
		var item = getInventory().getEquippedItem(InventorySlot.Strapon)
		if(item.hasTag(ItemTag.Strapon)):
			return item
	return null

func getStraponContentsReadableString():
	var strapon = getWornStrapon()
	if(strapon == null):
		return "cum"
	var fluids = strapon.getFluids()
	if(fluids == null):
		return false
	return Util.humanReadableList(fluids.getFluidListNames())

func removeStrapon():
	var theStrapon = getWornStrapon()
	if(theStrapon == null):
		return null
	return getInventory().removeEquippedItem(theStrapon)

func unequipStrapon():
	var theStrapon = getWornStrapon()
	if(theStrapon == null):
		return null
	return getInventory().unequipItem(theStrapon)

func doPainfullyStretchHole(_bodypart, _who = "pc") -> bool:
	return false

func doWound(_who = "pc") -> bool:
	return false

func getWoundedAmount() -> int:
	if(!hasEffect(StatusEffect.Wounded)):
		return 0
	var theEffect = getEffect(StatusEffect.Wounded)
	return theEffect.stacks

func unequipAllRestraints():
	for item in inventory.getEquppedRestraints():
		if(item.isImportant()):
			continue
		
		inventory.unequipItem(item)

func removeAllRestraints():
	for item in inventory.getEquppedRestraints():
		if(item.isImportant()):
			continue
		
		inventory.removeEquippedItem(item)

func getFluids():
	return bodyFluids

func clearBodyFluids():
	bodyFluids.clear()
	
func coverBodyWithFluid(fluidType, amount, fluidDNA = null):
	bodyFluids.addFluid(fluidType, amount, fluidDNA)
	
func cummedOnBy(characterID, sourceType = null, howMuchPercent = 1.0):
	var resultAmount = 0.0
	
	var ch = GlobalRegistry.getCharacter(characterID)
	if(sourceType == null):
		if(ch.getGender() == Gender.Female):
			sourceType = FluidSource.Vagina
		else:
			sourceType = FluidSource.Penis
	
	if(sourceType == FluidSource.Penis && ch.hasBodypart(BodypartSlot.Penis)):
		var usedBodypart = ch.getBodypart(BodypartSlot.Penis)
		var fluids = usedBodypart.getFluids()
		
		if(fluids != null):
			resultAmount = fluids.transferTo(bodyFluids, howMuchPercent)
	else:
		resultAmount = ch.getFluidAmount(sourceType)*howMuchPercent
		coverBodyWithFluid(ch.getFluidType(sourceType), resultAmount, ch.getFluidDNA(sourceType))
	
	if(true):
		var event = SexEventHelper.create(SexEvent.ReceivedFluidsOnBody, characterID, getID(), {
			fluidSource = sourceType,
			loadSize = resultAmount,
		})
		if(ch != null && ch != self):
			ch.sendSexEvent(event)
		sendSexEvent(event)
	
func pissedOnBy(_characterID, howMuch = 1.0):
	cummedOnBy(_characterID, FluidSource.Pissing, howMuch)
	
	#addEffect(StatusEffect.DrenchedInPiss)

func getOutsideMessinessLevel():
	var fluidAmount = bodyFluids.getFluidAmount()
	if(fluidAmount <= 0.0):
		return 0
	elif(fluidAmount < 100.0):
		return 1
	elif(fluidAmount < 300.0):
		return 2
	elif(fluidAmount < 500.0):
		return 3
	elif(fluidAmount < 1000.0):
		return 4
	else:
		return 5

func isCoveredInFluids():
	if(bodyFluids.isEmpty()):
		return false
	return true

func isCoveredInCum():
	return bodyFluids.hasFluidType("Cum")

func isCoveredInGirlCum():
	return bodyFluids.hasFluidType("GirlCum")

func isCoveredInPiss():
	return bodyFluids.hasFluidType("Piss")

func afterTakingAShower():
	#addStamina(30)
	clearBodyFluids()
	clearBodywritings()
	clearTallymarks()

func isTooLewd(ignoreHeat = true):
	var theExposure = getExposure()
	if(ignoreHeat && hasEffect(StatusEffect.InHeat)):
		theExposure -= 50
	
	if(theExposure > 0):
		return true
	return false

func shouldCondomBreakWhenFucking(characterPenetrated, chance: float = 20.0, showMessages = true) -> bool:
	if(!OPTIONS.isContentEnabled(ContentType.RiskyCondoms)):
		return false
	
	var character
	if(characterPenetrated is String):
		character = GlobalRegistry.getCharacter(characterPenetrated)
	else:
		character = characterPenetrated
	
	if(character.hasPerk(Perk.FertilityDesireToBreed)):
		if(RNG.chance(chance)):
			character.addPain(-20)
			if(showMessages && character.isPlayer()):
				GM.main.addMessage("You didn't even sabotage that condom.. but it still feels good..")
			return true
		
		chance = clamp((chance * 3.0), 30, 95) #limits max chance to break to 95%
		if(RNG.chance(chance) && !character.hasBlockedHands()):
			character.addPain(-20)
			if(showMessages && character.isPlayer()):
				GM.main.addMessage("Your hands sneakily sabotage the condom.. feels good..")
			return true
		return false
	
	return RNG.chance(chance)

func getBaseSkinID():
	return pickedSkin

func getBaseSkinColors():
	return [pickedSkinRColor, pickedSkinGColor, pickedSkinBColor]

func getSkinData():
	var theColors = getBaseSkinColors()
	return {
		"skin": getBaseSkinID(),
		"r": theColors[0],
		"g": theColors[1],
		"b": theColors[2],
	}

func applyRandomColors():
	var species = getSpecies()
	if(species.size() > 0):
		var randomSpecies = GlobalRegistry.getSpecies(RNG.pick(species))
		if(!randomSpecies):
			return
		var skinColors = randomSpecies.generateSkinColors()
		pickedSkinRColor = skinColors[0]
		pickedSkinGColor = skinColors[1]
		pickedSkinBColor = skinColors[2]

func applyRandomSkin():
	var species:Array = getSpecies()
	var possibleSkins:Array = []
	for speciesOne in species:
		var theSpecies = GlobalRegistry.getSpecies(speciesOne)
		if(!theSpecies):
			continue
		var skinType = theSpecies.getSkinType()
		
		for skinID in GlobalRegistry.getSkinsAllKeys():
			var theSkin = GlobalRegistry.getSkin(skinID)
			var fittingSkinTypes = theSkin.getFittingSkinTypes()
			if(fittingSkinTypes is Dictionary && fittingSkinTypes.has(skinType)):
				possibleSkins.append([skinID, fittingSkinTypes[skinType]])
	
	var newSkin = RNG.pickWeightedPairs(possibleSkins)
	
	if(newSkin != null):
		pickedSkin = newSkin

func applyRandomSkinAndColors():
	applyRandomSkin()
	applyRandomColors()

func applyRandomSkinAndColorsAndParts():
	applyRandomSkinAndColors()
	
	for bodypartID in bodyparts:
		if(bodyparts[bodypartID] == null):
			continue
		bodyparts[bodypartID].generateRandomColors(self)
		bodyparts[bodypartID].generateRandomSkinIfCan(self)

func getStatusEffectImmunity(statusEffectID):
	return buffsHolder.getStatusEffectImmunity(statusEffectID)

func checkSkins(applyRandomSkinOnFail = false):
	var theSkin = GlobalRegistry.getSkin(pickedSkin)
	if(theSkin == null):
		if(applyRandomSkinOnFail):
			applyRandomSkin()
		else:
			pickedSkin = "EmptySkin"
	
	for bodypartSlot in bodyparts:
		if(!hasBodypart(bodypartSlot)):
			continue
		
		var bodypart = getBodypart(bodypartSlot)
		if(bodypart.pickedSkin == null):
			continue
		
		if(bodypart.hasCustomSkinPattern()):
			var thePartSkin = GlobalRegistry.getPartSkin(bodypart.id, bodypart.pickedSkin)
			if(thePartSkin == null):
				bodypart.pickedSkin = null
		else:
			theSkin = GlobalRegistry.getSkin(bodypart.pickedSkin)
			if(theSkin == null):
				bodypart.pickedSkin = null

func applyBodypartsSkinData(theSkinData):
	if(theSkinData != null):
		for bodypartSlot in theSkinData:
			if(!hasBodypart(bodypartSlot)):
				continue
			var bodypart = getBodypart(bodypartSlot)
			var bodypartSkinData = theSkinData[bodypartSlot]
			if(bodypartSkinData.has("skin")):
				bodypart.pickedSkin = bodypartSkinData["skin"]
			if(bodypartSkinData.has("r")):
				bodypart.pickedRColor = bodypartSkinData["r"]
			if(bodypartSkinData.has("g")):
				bodypart.pickedGColor = bodypartSkinData["g"]
			if(bodypartSkinData.has("b")):
				bodypart.pickedBColor = bodypartSkinData["b"]

func sendInteractionEvent(_eventID:String, _args:Dictionary):
	if(isSlaveToPlayer()):
		getNpcSlavery().onInteractionEvent(_eventID, _args)
	if(isPlayer()):
		for ownerID in GM.main.RS.special:
			var theSpecialRelationship = GM.main.RS.special[ownerID]
			if(theSpecialRelationship.id == "SoftSlavery" && theSpecialRelationship.npcOwner):
				theSpecialRelationship.npcOwner.onInteractionEvent(_eventID, _args)

func sendSexEvent(event):
	onSexEvent(event)

func onSexEvent(_event : SexEvent):
	if(_event == null):
		Log.error("GOT A NULL SEX EVENT")
		return
	print(getID()+" GOT SEX EVENT "+str(_event.type)+" SOURCE:"+str(_event.sourceCharID)+" TARGET:"+str(_event.targetCharID)+" "+str(_event.data))

	getSkillsHolder().onSexEvent(_event)
	for effectID in statusEffects.keys():
		if(!statusEffects.has(effectID)):
			continue
		var effect = statusEffects[effectID]
		effect.onSexEvent(_event)
		
	var items = getInventory().getAllEquippedItems()
	for itemSlot in items:
		var item = items[itemSlot]
		item.onSexEvent(_event)
	
	var theTFHolder = getTFHolder()
	if(theTFHolder != null):
		theTFHolder.onSexEvent(_event)

func onFightStart(_contex = {}):
	beforeFightStarted() # Legacy
	
	getSkillsHolder().onFightStart(_contex)
	for effectID in statusEffects.keys():
		if(!statusEffects.has(effectID)):
			continue
		var effect = statusEffects[effectID]
		effect.onFightStart(_contex)
	
	for effectRef in GlobalRegistry.getStatusEffectsCheckedOnFightStart():
		var theRes:Array = effectRef.checkOnFightStart(self, _contex)
		if(theRes.size() > 0 && theRes[0]):
			addEffect(effectRef.id, theRes[1] if theRes.size() > 1 else [])

func processBattleTurnContex(_contex = {}):
	processBattleTurn() # Legacy
	
	getSkillsHolder().processBattleTurnContex(_contex)
	for effectID in statusEffects.keys():
		if(!statusEffects.has(effectID)):
			continue
		var effect = statusEffects[effectID]
		effect.processBattleTurnContex(_contex)

func onFightEnd(_contex = {}):
	afterFightEnded() # Legacy
	
	getSkillsHolder().onFightEnd(_contex)
	for effectID in statusEffects.keys():
		if(!statusEffects.has(effectID)):
			continue
		var effect = statusEffects[effectID]
		effect.onFightEnd(_contex)

func onSexStarted(_contex = {}):
	getSkillsHolder().onSexStarted(_contex)
	for effectID in statusEffects.keys():
		if(!statusEffects.has(effectID)):
			continue
		var effect = statusEffects[effectID]
		effect.onSexStarted(_contex)
	
func processSexTurnContex(_contex = {}):
	processSexTurn() # Legacy
	
	getSkillsHolder().processSexTurnContex(_contex)
	for effectID in statusEffects.keys():
		if(!statusEffects.has(effectID)):
			continue
		var effect = statusEffects[effectID]
		effect.processSexTurnContex(_contex)

func onSexEnded(_contex = {}):
	getSkillsHolder().onSexEnded(_contex)
	for effectID in statusEffects.keys():
		if(!statusEffects.has(effectID)):
			continue
		var effect = statusEffects[effectID]
		effect.onSexEnded(_contex)
	if(hasEnslaveQuest()):
		getEnslaveQuest().onSexEnded(_contex)
	if(isSlaveToPlayer()):
		getNpcSlavery().onSexEnded(_contex)
	var items = getInventory().getAllEquippedItems()
	for itemSlot in items:
		var item = items[itemSlot]
		item.onSexEnded(_contex)
		
func getForcedObedienceLevel() -> float:
	return buffsHolder.getCustom(BuffAttribute.ForcedObedience)

func isWearingPortalPanties():
	if(getInventory().hasSlotEquipped(InventorySlot.UnderwearBottom)):
		var item = getInventory().getEquippedItem(InventorySlot.UnderwearBottom)
		if(item.hasTag(ItemTag.PortalPanties)):
			return true
	return false

func orgasmFrom(_characterID: String):
	afterOrgasm()
	
	if(true):
		var event = SexEventHelper.create(SexEvent.Orgasmed, _characterID, getID(), {
		})
		if(_characterID != getID()):
			var ch = GlobalRegistry.getCharacter(_characterID)
			if(ch != null):
				ch.sendSexEvent(event)
		sendSexEvent(event)

func getUndressMessage(withS):
	var res = []
	var slotsToCheck = [InventorySlot.Body, InventorySlot.UnderwearTop, InventorySlot.UnderwearBottom]
	
	for slot in slotsToCheck:
		if(getInventory().hasSlotEquipped(slot)):
			var item = getInventory().getEquippedItem(slot)
			res.append(item.getTakingOffStringLong(withS))
	
	if(res.size() == 0):
		if(withS):
			return "takes all your clothes off"
		else:
			return "take all your clothes off"
	return Util.humanReadableList(res, "and also")

func isWearingInvisiblePortalPanties():
	return false

func getPortalSexHoleAvailable(_bodypartSlot):
	return false

func getWornHypnovisor():
	if(getInventory().hasSlotEquipped(InventorySlot.Eyes)):
		var item = getInventory().getEquippedItem(InventorySlot.Eyes)
		if(item.hasTag(ItemTag.Hypnovisor)):
			return item
	return null

func isWearingHypnovisor():
	return getWornHypnovisor() != null

func hasEnslaveQuest():
	return false

func getEnslaveQuest() -> NpcEnslavementQuest:
	return null

func isSlaveToPlayer():
	return false

func isSlaveTo(_charID:String) -> bool:
	if(_charID == "pc"):
		return isSlaveToPlayer()
	return false

func getNpcSlavery() -> NpcSlave:
	return null

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

func isWearingAnyUnderwear():
	return inventory.hasSlotEquipped(InventorySlot.UnderwearBottom) || inventory.hasSlotEquipped(InventorySlot.UnderwearTop)

func isInventorySlotBlocked(invslot):
	var items = getInventory().getAllEquippedItems()
	for itemSlot in items:
		var item:ItemBase = items[itemSlot]
		var itemState = item.getItemState()
		if(itemState != null && (invslot in itemState.blocksInventorySlots())):
			return true
	return false


func getDamagebleClothesZones():
	var piecesToDamage = [InventorySlot.Torso, InventorySlot.Body]
	if(RNG.chance(50)):
		piecesToDamage.append(InventorySlot.UnderwearTop)
		piecesToDamage.append(InventorySlot.UnderwearBottom)
	else:
		piecesToDamage.append(InventorySlot.UnderwearBottom)
		piecesToDamage.append(InventorySlot.UnderwearTop)
	return piecesToDamage

func canDamageClothes():
	for piece in getDamagebleClothesZones():
		if(getInventory().hasSlotEquipped(piece)):
			var item:ItemBase = getInventory().getEquippedItem(piece)
			if(item.canDamage()):
				return true
	return false

func damageClothes():
	for piece in getDamagebleClothesZones():
		if(getInventory().hasSlotEquipped(piece)):
			var item:ItemBase = getInventory().getEquippedItem(piece)
			if(item.canDamage()):
				var theResult = item.receiveDamage()
				if(theResult != null && theResult[0]):
					return [theResult[0], theResult[1], item]
	return [false]

func canRepairClothes():
	for itemSlot in getInventory().getEquippedItems():
		if(getInventory().hasSlotEquipped(itemSlot)):
			var item:ItemBase = getInventory().getEquippedItem(itemSlot)
			if(item.canRepair()):
				return true
	return false

func repairAllClothes():
	for itemSlot in getInventory().getEquippedItems():
		if(getInventory().hasSlotEquipped(itemSlot)):
			var item:ItemBase = getInventory().getEquippedItem(itemSlot)
			item.repairDamage()
	return true

func hasTightHoles():
	var maxLooseness = 0.0
	var bodypartsToCheck = [BodypartSlot.Vagina, BodypartSlot.Anus]
	
	for bodypartID in bodypartsToCheck:
		if(!hasBodypart(bodypartID)):
			continue
			
		var bodypart:Bodypart = getBodypart(bodypartID)
		
		var orifice:Orifice = bodypart.getOrifice()
		if(orifice == null):
			continue
		
		maxLooseness = max(maxLooseness, orifice.getLooseness())
	
	if(maxLooseness < 1.5):
		return true
	else:
		return false

func getRopeHarnessColor(defaultColor=Color.red):
	var theHarness = inventory.getEquippedItemByID("ropeharness")
	if(theHarness != null):
		return theHarness.clothesColor
	
	return defaultColor

func shouldBeExcludedFromEncounters() -> bool:
	return false

func canForgetCharacter() -> bool:
	return true

func supportsDefaultGiveBirthScene() -> bool:
	return true

func canMeetCharacter() -> bool:
	return true

func fillBalls(howMuch:float=1.0):
	if(!hasBodypart(BodypartSlot.Penis)):
		return
		
	var penis = getBodypart(BodypartSlot.Penis)
	if(penis != null && penis.getFluidProduction() != null):
		penis.getFluidProduction().fillPercent(howMuch)

func fillBreasts(howMuch:float=1.0):
	if(!hasBodypart(BodypartSlot.Breasts)):
		return
		
	var breasts = getBodypart(BodypartSlot.Breasts)
	if(breasts != null && breasts.getFluidProduction() != null):
		breasts.getFluidProduction().fillPercent(howMuch)

func switchBodypartSimple(bodypartID:String):
	var bodypart:Bodypart = GlobalRegistry.getBodypartRef(bodypartID)
	
	if(bodypart == null):
		return false
	
	var bodypartSlot = bodypart.getSlot()
	
	if(hasBodypart(bodypartSlot)):
		var currentPart:Bodypart = getBodypart(bodypartSlot)
		if(currentPart.id == bodypartID):
			return false
		
		var newBodypart:Bodypart = GlobalRegistry.createBodypart(bodypartID)
		newBodypart.pickedRColor = currentPart.pickedRColor
		newBodypart.pickedGColor = currentPart.pickedGColor
		newBodypart.pickedBColor = currentPart.pickedBColor
		removeBodypart(bodypartSlot)
		giveBodypart(newBodypart)
		return true
	else:
		giveBodypart(GlobalRegistry.createBodypart(bodypartID))
		return true

func getBodypartID(slot):
	if(!bodyparts.has(slot) || bodyparts[slot] == null):
		return ""
	return bodyparts[slot].id

func getInmateType():
	return InmateType.Unknown

func hasSomethingToStruggleOutOf() -> bool:
	for item in getInventory().getEquppedRestraints():
		var restraintData: RestraintData = item.getRestraintData()
		
		if(restraintData == null || !restraintData.canStruggleFinal() || !restraintData.shouldStruggle()):
			continue
		
		return true
	return false

func getRestraintsToStruggleOutOf() -> Dictionary:
	var possible = []
	var trivial = []

	for item in getInventory().getEquppedRestraints():
		var restraintData:RestraintData = item.getRestraintData()

		if(restraintData == null || !restraintData.canStruggleFinal() || !restraintData.shouldStruggle()):
			continue

		if(!restraintData.shouldDoStruggleMinigame(self)):
			trivial.append(item)
		else:
			possible.append(item)

	var restraintsToStruggleOutOf = {
		possible = possible,
		trivial = trivial,
	}

	return restraintsToStruggleOutOf

func getNextRestraintToStruggleOutOf(deterministicOrderHashInt:int = 0):
	var nextRestraintToStruggleOutOf = null

	if(deterministicOrderHashInt == 0):
		deterministicOrderHashInt = RNG.randi_range(1, 1000000)

	var restraintsToStruggleOutOf:Dictionary = getRestraintsToStruggleOutOf()

	var possible:Array = restraintsToStruggleOutOf.possible
	var trivial:Array = restraintsToStruggleOutOf.trivial

	for item in possible:
		if(item.id in ["StocksStatic", "SlutwallStatic"]):
			nextRestraintToStruggleOutOf = {
				item = item,
				isTrivial = false,
			}
			return nextRestraintToStruggleOutOf

	if(trivial.size() > 0):
		nextRestraintToStruggleOutOf = {
			item = RNG.pickHashed(trivial, deterministicOrderHashInt),
			isTrivial = true,
		}
		return nextRestraintToStruggleOutOf
	elif(possible.size() > 0):
		nextRestraintToStruggleOutOf = {
			item = RNG.pickHashed(possible, deterministicOrderHashInt),
			isTrivial = false,
		}
		return nextRestraintToStruggleOutOf
	else:
		nextRestraintToStruggleOutOf = null
		return nextRestraintToStruggleOutOf

func doStruggleOutOfRestraints(isScared:bool = false, addStats:bool = true, customActor=null, damageMult:float = 1.0, deterministicOrderHashInt:int = 0) -> Dictionary:
	var nextRestraintToStruggleOutOf = getNextRestraintToStruggleOutOf(deterministicOrderHashInt)

	if(nextRestraintToStruggleOutOf == null):
		return {}

	var whoStruggles = self
	if(customActor != null):
		whoStruggles = customActor

	var pickedItem = nextRestraintToStruggleOutOf.item
	var minigameResult:MinigameResult
	if(nextRestraintToStruggleOutOf.isTrivial):
		minigameResult = MinigameResult.new()
		minigameResult.score = 1.0
	else:
		minigameResult = whoStruggles.getRestraintStrugglingMinigameResult()

		if(isScared):
			minigameResult.score = min(minigameResult.score, min(1.0, RNG.randf_range(0.6, 1.1)))
	
	if(customActor != null):
		minigameResult.beingHelped = true
	
	var text = ""
	var restraintData: RestraintData = pickedItem.getRestraintData()
	var struggleData = restraintData.doStruggle(self, minigameResult)
	
	
	text += struggleData["text"]
	
	if(struggleData.has("damage")):
		var damage = struggleData["damage"] * damageMult
		restraintData.takeDamage(damage)
		if(damage > 0.0):
			text += ("\n{actor.You} "+("made" if customActor == null else "helped to make")+" "+str(Util.roundF(damage*100.0, 1))+"% of progress, "+str(Util.roundF(max(0.0, restraintData.getTightness()*100.0), 1))+"% left.")
		elif(damage < 0.0):
			text += ("\n{user.You} lost "+str(Util.roundF(abs(damage)*100.0, 1))+"% of progress, "+str(Util.roundF(max(0.0, restraintData.getTightness()*100.0), 1))+"% left.")
		else:
			text += ("\n{actor.You} made no progress, "+str(Util.roundF(max(0.0, restraintData.getTightness()*100.0), 1))+"% left.")
	
	if(addStats):
		if(struggleData.has("lust") && struggleData["lust"] > 0):
			whoStruggles.addLust(struggleData["lust"])
		if(struggleData.has("pain") && struggleData["pain"] > 0):
			whoStruggles.addPain(struggleData["pain"])
		if(struggleData.has("stamina") && struggleData["stamina"] != 0):
			whoStruggles.addStamina(-struggleData["stamina"])
	
	if(restraintData.shouldBeRemoved()):
		text += "\n[b]"+restraintData.getRemoveMessage()+"[/b]"
		restraintData.onStruggleRemoval()
		getInventory().removeEquippedItem(pickedItem)
		
	text = GM.ui.processString(text, {"user":getID(), "actor":whoStruggles.getID()})
	
	return {
		text=text,
		lust=(struggleData["lust"] if struggleData.has("lust") else 0),
		pain=(struggleData["pain"] if struggleData.has("pain") else 0),
		stamina=(struggleData["stamina"] if struggleData.has("stamina") else 0),
		animation = restraintData.getResistAnimation(),
	}

func getModularDialogueTags(_againstChar) -> Dictionary:
	var result:Dictionary = {}
	
	var pers:Personality = getPersonality()
	var possible:Array = []
	
	var mean = pers.getStat(PersonalityStat.Mean)
	var subby = pers.getStat(PersonalityStat.Subby)
	
	if(mean >= 0.5):
		possible.append(["mean", mean])
	if(mean <= -0.3):
		possible.append(["kind", -mean])
	if(subby >= 0.4):
		possible.append(["subby", subby])
	if(subby <= -0.4):
		possible.append(["dommy", -subby])
	possible.sort_custom(self, "sortDialogueTagsDescending")
	for pEntry in possible:
		result[pEntry[0]] = true
		
	return result
	
static func sortDialogueTagsDescending(a, b):
	if a[1] > b[1]:
		return true
	return false

func canAutoLevelUpFromFights() -> bool:
	if(!isDynamicCharacter()):
		return false
	if(shouldBeExcludedFromEncounters()):
		return false
	
	return true

func onAutoLevelUp():
	if(GM.main != null && GM.main.characterIsVisible(getID())):
		GM.main.addMessage(getName()+" has reached level "+str(getLevel()))
	
	autoSpendFreeStatPoints()

func autoSpendFreeStatPoints():
	var statWeightMap:Dictionary = {}
	for stat in Stat.getAll():
		var statValue:int = skillsHolder.getStat(stat)
		
		var statWeight:float = float(statValue)
		if(statWeight < 1.0):
			statWeight = 1.0
		statWeight = sqrt(statWeight)
		statWeightMap[stat] = statWeight
	
	while(skillsHolder.getFreeStatPoints() > 0):
		var stat = RNG.pickWeightedDict(statWeightMap)
		statWeightMap[stat] = sqrt(max(float(skillsHolder.getStat(stat)), 1.0))
		skillsHolder.increaseStatIfCan(stat)

func addFightExperienceAuto(_otherCharID:String, didWin:bool):
	if(!canAutoLevelUpFromFights()):
		return
	var otherLevel:int = 0
	var otherChar = GlobalRegistry.getCharacter(_otherCharID)
	if(otherChar != null):
		otherLevel = otherChar.getLevel()
	var pcLevel:int = 0
	if(GM.pc != null):
		pcLevel = GM.pc.getLevel()
	
	var ourLevel:int = getLevel()
	
	var autoLevelingSetting:float = OPTIONS.getSandboxNpcLeveling()
	
	var mult:float = 1.0
	
	if(autoLevelingSetting > 0.0):
		if(ourLevel > pcLevel):
			mult = 1.0/((ourLevel - pcLevel)*autoLevelingSetting + 3.0*autoLevelingSetting)
		elif(ourLevel == pcLevel):
			mult = 0.5
		else:
			mult = 1.0 + (pcLevel - ourLevel)*0.5*autoLevelingSetting
		
		if(ourLevel < otherLevel):
			mult += (otherLevel - ourLevel) * 0.2
	
	if(autoLevelingSetting >= 0.0):
		if(!didWin):
			mult *= 0.6
		
		addExperience(int(round(100.0 * mult)))

func getReputation() -> ReputationPlaceholder:
	return ReputationPlaceholder.new()

func isInmate() -> bool:
	return getCharType() == CharacterType.Inmate

func isGuard() -> bool:
	return getCharType() == CharacterType.Guard

func isNurse() -> bool:
	return getCharType() == CharacterType.Nurse

func isEngineer() -> bool:
	return getCharType() == CharacterType.Engineer

func isStaff() -> bool:
	return isGuard() || isNurse() || isEngineer()

func isLilac() -> bool:
	return isInmate() && getInmateType() == InmateType.SexDeviant

func isGeneralInmate() -> bool:
	return isInmate() && getInmateType() == InmateType.General

func isHighSecInmate() -> bool:
	return isInmate() && getInmateType() == InmateType.HighSec

func getSensitiveZones():
	var result := []
	
	if(hasBodypart(BodypartSlot.Vagina)):
		var theZone = getBodypart(BodypartSlot.Vagina).getSensitiveZone()
		if(theZone != null):
			result.append(theZone)
	if(hasBodypart(BodypartSlot.Anus)):
		var theZone = getBodypart(BodypartSlot.Anus).getSensitiveZone()
		if(theZone != null):
			result.append(theZone)
	if(hasBodypart(BodypartSlot.Penis)):
		var theZone = getBodypart(BodypartSlot.Penis).getSensitiveZone()
		if(theZone != null):
			result.append(theZone)
	if(hasBodypart(BodypartSlot.Breasts)):
		var theZone = getBodypart(BodypartSlot.Breasts).getSensitiveZone()
		if(theZone != null):
			result.append(theZone)
	return result

func hasOverstimulatedSensitiveZone() -> bool:
	for zone in getSensitiveZones():
		if(zone.isOverstimulated()):
			return true
	return false

func hasVisiblyOverstimulatedSensitiveZone() -> bool:
	for zone in getSensitiveZones():
		if(zone.isVisiblyOverstimulated()):
			return true
	return false

func isZoneOverstimulated(bodypartSlot) -> bool:
	if(!hasBodypart(bodypartSlot)):
		return false
	
	var thePart = getBodypart(bodypartSlot)
	
	if(thePart.getSensitiveZone() == null):
		return false
	
	return thePart.getSensitiveZone().isOverstimulated()

func getZoneOverstimulation(bodypartSlot) -> float:
	if(!hasBodypart(bodypartSlot)):
		return 0.0
	var thePart = getBodypart(bodypartSlot)
	if(thePart.getSensitiveZone() == null):
		return 0.0
	return thePart.getSensitiveZone().getOverstimulation()

func canZoneOrgasm(bodypartSlot) -> bool:
	if(!hasBodypart(bodypartSlot)):
		return false
	
	var thePart = getBodypart(bodypartSlot)
	
	if(thePart.getSensitiveZone() == null):
		return true
	
	return thePart.getSensitiveZone().canOrgasm()

func applyTFBodypart(bodypartSlot, data:Dictionary):
	if(!hasBodypart(bodypartSlot)):
		if(!data.has("bodypartID") || data["bodypartID"] == null || data["bodypartID"] == ""):
			return
		var newBodypart = GlobalRegistry.createBodypart(data["bodypartID"])
		if(!newBodypart):
			return
		giveBodypart(newBodypart, false)
		newBodypart.generateRandomColors(self)
		newBodypart.generateRandomSkinIfCan(self)
		newBodypart.applyTFData(data)
		return
	
	if(!data.has("bodypartID")):
		return
	if(data["bodypartID"] == null || data["bodypartID"] == ""):
		removeBodypart(bodypartSlot, false)
		return
	
	var currentPart = getBodypart(bodypartSlot)
	if(currentPart.id == data["bodypartID"]):
		currentPart.applyTFData(data)
		return
	
	var savedData = currentPart.saveDataForTF()
	var newBodypart = GlobalRegistry.createBodypart(data["bodypartID"])
	if(!newBodypart):
		return
	giveBodypart(newBodypart, false)
	newBodypart.loadDataForTF(savedData)
	newBodypart.applyTFData(data)

func saveOriginalTFData() -> Dictionary:
	return {}

func applyTFData(_data):
	pass

func loadTFVar(_data:Dictionary, _keyID:String, default):
	if(!_data.has(_keyID)):
		return default
	return _data[_keyID]

func getTFHolder():
	return null

func getTFTotalStagesSum() -> int:
	var theHolder = getTFHolder()
	if(theHolder == null):
		return 0
	return theHolder.getTotalStageSum()

func getSexGoalSubWeightModifier(_sexGoalID:String, _domID:String) -> float:
	var result:float = 1.0
	var theTFHolder = getTFHolder()
	if(theTFHolder != null):
		result *= theTFHolder.getSexGoalWeightModifier(_sexGoalID)
	
	var theNpcSlavery = getNpcSlavery()
	if(theNpcSlavery):
		result *= theNpcSlavery.getSexGoalWeightModifier(_sexGoalID)
	
	var theEnslaveQuest = getEnslaveQuest()
	if(theEnslaveQuest):
		result *= theEnslaveQuest.getSexGoalWeightModifier(_sexGoalID)
	
	var smartLocks:Array = getInventory().getAllSmartLocks()
	for smartLock in smartLocks:
		if(smartLock.id == SmartLock.SlutLock):
			result *= smartLock.getSexGoalWeightModifier(_sexGoalID)
	
	return result

func undoAllTransformations():
	var theHolder = getTFHolder()
	if(theHolder != null):
		theHolder.undoAllTransformations()

func makeAllTransformationsPermanent():
	var theHolder = getTFHolder()
	if(theHolder != null):
		theHolder.makeAllTransformationsPermanent()

func hasActiveTransformations() -> bool:
	var theHolder = getTFHolder()
	if(theHolder == null):
		return false
	return theHolder.hasActiveTransformations()

func calculateSpeciesBasedOnParts(_limit:int = 2) -> Array:
	var result:Array = []
	while(_limit > 0):
		var newBucket:Array = calculateSpeciesBasedOnPartsReq(result, 0.99 if !result.empty() else -999.9)
		if(newBucket.size() <= 0):
			break
		while(_limit > 0 && newBucket.size() > 0):
			result.append(newBucket.pop_front())
			_limit -= 1
	return result

func calculateSpeciesBasedOnPartsReq(_ignoreSpecies:Array = [], minVal:float = -9999.9) -> Array:
	#var result:Array = []
	
	var speciesScores:Dictionary = {}
	
	for bodypartSlot in bodyparts:
		var theBodypart:Bodypart = getBodypart(bodypartSlot)
		if(theBodypart == null):
			continue
		var partScores:Dictionary = theBodypart.getSpeciesScores()
		
		var isInIgnore:bool = false
		for partSpecies in partScores:
			if(_ignoreSpecies.has(partSpecies)):
				isInIgnore = true
				break
		if(isInIgnore):
			continue
		
		for partSpecies in partScores:
			if(partSpecies == Species.Any || partSpecies == Species.AnyNPC):
				continue
			if(!speciesScores.has(partSpecies)):
				speciesScores[partSpecies] = 0.0
			speciesScores[partSpecies] += partScores[partSpecies]
	
	if(speciesScores.empty()):
		return []
	
	var scoreToSpecies:Dictionary = {}
	for theSpecies in speciesScores:
		var theSpeciesObj:Species = GlobalRegistry.getSpecies(theSpecies)
		if(theSpeciesObj == null):
			continue
		
		var theSpeciesScore:float = speciesScores[theSpecies] * theSpeciesObj.calculateScoreForSpeciesCalculations(self)
		if(theSpeciesScore <= 0.0):
			continue
		if(!scoreToSpecies.has(theSpeciesScore)):
			scoreToSpecies[theSpeciesScore] = []
		scoreToSpecies[theSpeciesScore].append(theSpecies)
		
	#print(scoreToSpecies)
	
	var biggestSp:Array = []
	var biggestScore:float = minVal
	for someScore in scoreToSpecies:
		if(someScore > biggestScore):
			biggestScore = someScore
			biggestSp = scoreToSpecies[someScore]
	return biggestSp

func calculateNpcGender():
	var resultGender = NpcGender.Male
	var otherHasPenis = hasPenis()
	var otherHasVag = hasVagina()
	var otherHasTits = hasNonFlatBreasts()
	if(otherHasPenis && otherHasVag):
		resultGender = NpcGender.Herm
	elif(otherHasPenis && otherHasTits):
		resultGender = NpcGender.Shemale
	elif(otherHasPenis):
		resultGender = NpcGender.Male
	elif(otherHasVag && !otherHasTits):
		resultGender = NpcGender.Peachboy
	else:
		resultGender = NpcGender.Female
	return resultGender

func increaseBodypartSensitivity(bodypartSlot:String, howMuch:float):
	if(!hasBodypart(bodypartSlot)):
		return
	
	var bodypart = getBodypart(bodypartSlot)
	
	var zone = bodypart.getSensitiveZone()
	if(zone == null):
		return
	zone.addSensitivity(howMuch)
	
func resetSkillHolderFully():
	if(skillsHolder):
		skillsHolder.queue_free()
		skillsHolder = null
	skillsHolder = SkillsHolder.new()
	skillsHolder.setCharacter(self)
	add_child(skillsHolder)

func canApplySmartLocks() -> bool:
	return false

# Do we have any drugs in our system
func isUnderDrugsInfluence() -> bool:
	if(!timedBuffs.empty()):
		return true
	
	for statusEffectID in statusEffects:
		var theEffect = statusEffects[statusEffectID]
		
		if(theEffect.isDrugEffect()):
			return true
	
	return false

func getDrugsInfluenceAmount() -> int:
	var result:int = 0
	if(!timedBuffs.empty()):
		result += timedBuffs.size()
	
	for statusEffectID in statusEffects:
		var theEffect = statusEffects[statusEffectID]
		
		if(theEffect.isDrugEffect()):
			result += 1
	
	return result

func cancelPregnancy():
	if(!menstrualCycle):
		return
	menstrualCycle.cancelPregnancy()

func doSwallow(_fluidID:String, _amount:float, _swallowEvent:bool = true) -> Dictionary:
	var fluidObject:FluidBase = GlobalRegistry.getFluid(_fluidID)
	if(fluidObject == null):
		return {text=""}

	var resultMessage = fluidObject.onSwallow(self, _amount)
	
	if(_swallowEvent):
		var event := SexEventHelper.create(SexEvent.SwallowFluid, getID(), getID(), {
			loadSize = _amount,
			fluidID = _fluidID,
		})
		sendSexEvent(event)
	
	if(resultMessage != null && resultMessage != ""):
		return {text=resultMessage}
	return {text=""}

func calculatePowerScore(ignoreCurrentState:bool = false) -> float:
	var finalScore:float = 0.0
	
	finalScore += painThreshold() * 0.01
	finalScore += lustThreshold() * 0.01
	finalScore += getMaxStamina() * 0.005
	
	finalScore += getLevel() * 0.1
	finalScore += _getAttacks().size() * 0.1
	
	if(!ignoreCurrentState):
		finalScore *= (1.0 - getPainLevel()*0.9)
		finalScore *= (1.0 - getLustLevel()*0.8)
		finalScore *= (1.0 - getStaminaLevel()*0.5)
	
	return finalScore
