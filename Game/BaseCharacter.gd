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
var pain:int = 0
var lust:int = 0
var stamina:int = 100
var statusEffects:Dictionary = {}
var inventory: Inventory
var buffsHolder: BuffsHolder

# Combat stats
var initialDodgeChance = 0

var fightingState = "" # dodge, block, defocus

# used to fix the spamming of the same lust attack
var lustMemory:Dictionary = {}

func _init():
	name = "BaseCharacter"

func _ready():
	inventory = Inventory.new()
	add_child(inventory)
	var _con = inventory.connect("equipped_items_changed", self, "onEquippedItemsChange")
	buffsHolder = BuffsHolder.new()
	buffsHolder.setCharacter(self)
	add_child(buffsHolder)
	stamina = getMaxStamina()
	#resetToDefault()

# Skips armor checks etc
func addPain(_p: int):
	pain += _p
	if(pain > painThreshold()):
		pain = painThreshold()
	if(pain < 0):
		pain = 0
		
	emit_signal("stat_changed")

# Skips armor checks
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
	
func getMaxStamina() -> int:
	return 100
	
func getName() -> String:
	return name
	
func getSmallDescription() -> String:
	return "Test test test"

func painThreshold():
	return 100

func lustThreshold():
	return 100

func addEffect(effectID: String, args = []):
	if(statusEffects.has(effectID)):
		statusEffects[effectID].combine(args)
		return
	
	var effect = GlobalRegistry.getStatusEffect(effectID)
	effect.setCharacter(self)
	effect.initArgs(args)
	
	statusEffects[effectID] = effect

func hasEffect(effectID: String):
	return statusEffects.has(effectID)
	
func removeEffect(effectID: String):
	if(statusEffects.has(effectID)):
		statusEffects[effectID].queue_free()
		var _wasremoved = statusEffects.erase(effectID)
	
func getStatusEffects():
	return statusEffects
	
func saveStatusEffectsData():
	var data = {}
	for effectID in statusEffects:
		data[effectID] = statusEffects[effectID].saveData()
	return data
	
func loadStatusEffectsData(data):
	for effectID in data:
		var effect = GlobalRegistry.getStatusEffect(effectID)
		effect.setCharacter(self)
		statusEffects[effectID] = effect
		
		effect.loadData(data[effectID])
	
func updateEffectPanel(panel: StatusEffectsPanel):
	panel.clearBattleEffects()
	for effectID in statusEffects.keys():
		var effect = statusEffects[effectID]
		panel.addBattleEffect(effect.getIconColor(), effect.getEffectName(), effect.getEffectDesc(), effect.getEffectImage())

func processBattleTurn():
	for effectID in statusEffects.keys():
		var effect = statusEffects[effectID]
		effect.processBattleTurn()
		
	for topic in lustMemory.keys():
		lustMemory[topic] -= 1
		if(lustMemory[topic] <= 0):
			var _x = lustMemory.erase(topic)
		

func afterFightEnded():
	print(getName()+" my fight has ended")
	
	for effectID in statusEffects.keys():
		var effect = statusEffects[effectID]
		if(effect.isBattleOnly):
			removeEffect(effectID)
	
func isPlayer():
	return false

func _getAttacks():
	return ["baseattack"]
	
func getAttacks():
	return _getAttacks()
	
func getArmor(_damageType):
	var armor = 0
	if(isBlocking()):
		if(_damageType == DamageType.Physical):
			armor += 10
	if(isDefocusing()):
		if(_damageType == DamageType.Lust):
			armor += 10
	
	armor += buffsHolder.getArmor(_damageType)
	
	return armor
	
func calculateBuffs():
	buffsHolder.calculateBuffs()
	
func onEquippedItemsChange():
	calculateBuffs()
	
func onDamage(_damageType, _amount):
	pass

func getDamageMultiplier(_damageType):
	var mult = 1
	for effectID in statusEffects.keys():
		var effect = statusEffects[effectID]
		mult *= effect.getDamageMultiplierMod(_damageType)
	
	mult *= buffsHolder.getDealDamageMult(_damageType)
	
	return mult

func getRecieveDamageMultiplier(_damageType):
	var mult = 1
	for effectID in statusEffects.keys():
		var effect = statusEffects[effectID]
		mult *= effect.getRecievedDamageMod(_damageType)
		
	mult *= buffsHolder.getRecieveDamageMult(_damageType)
	
	return mult

func getDodgeChance(_damageType):
	if(isDodging()):
		return 1
	
	var mult = initialDodgeChance
	for effectID in statusEffects.keys():
		var effect = statusEffects[effectID]
		mult *= effect.getDodgeMod(_damageType)

	return mult
	
func getAttackAccuracy(_damageType):
	var mult = 1
	for effectID in statusEffects.keys():
		var effect = statusEffects[effectID]
		mult *= effect.getAccuracyMod(_damageType)
	
	return mult
	
func recieveDamage(damageType, amount: int):
	var mult = getRecieveDamageMultiplier(damageType)
	var newdamage = amount * mult
	
	if(amount > 0):
		newdamage -= getArmor(damageType)
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
		return actualAddstamina
		
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

func doRememberTopic(topicName, howLong = 1):
	lustMemory[topicName] = howLong + 1

func remembersTopic(topicName):
	return lustMemory.has(topicName)

func reactTease():
	return 1

func reactGrope():
	if(lust < 50):
		return 0
	
	return 1

func reactSelfHumiliation(_topic):
	if(remembersTopic(_topic)):
		return 0.1
	
	if(_topic == Attack.LustTopic.selfUseMe):
		doRememberTopic(_topic)
		return 2
	
	return 0

func reactHumiliation(_topic):
	if(remembersTopic(_topic)):
		return -2
	
	if(_topic == Attack.LustTopic.humYouSlut):
		doRememberTopic(_topic)
		return -1
	
	return 0

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
		return "#3E84E0"
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

func getSpecies():
	return []

func getSpeciesFullName():
	var species = getSpecies()
	return Util.getSpeciesName(species)
	
func getFightIntro(_battleName):
	return "Plase change the fight intro"

func getFightState(_battleName):
	if(getPain() > getLust()):
		var mypain = getPain()
		
		if(mypain >= 70):
			return getName() + " constantly grunts from pain. "+heShe()+" can barely stand at this point, all "+hisHer()+" bruises are really wearing "+himHer()+" down"
		if(mypain >= 50):
			return getName() + " looks pretty beat up and "+hisHer()+" face shows it but "+heShe()+" is still standing strong"
		if(mypain >= 25):
			return getName() + " has a bruise there and there but "+heShe()+" clearly won't give up the fight any time soon"
	else:
		var mylust = getLust()
		
		if(mylust >= 70):
			return getName() + " keeps moaning to "+himselfHerself()+" and can't hide the arousal anymore, "+heShe()+" blatantly gropes and rubs "+hisHer()+" body in front of you"
		if(mylust >= 50):
			return getName() + " breathes warmly, "+hisHer()+" blush starts to shine through, "+ heShe()+" is lusty and "+hisHer()+" eyes show it"
		if(mylust >= 25):
			return getName() + " looks alright but you notice some desire in "+hisHer()+" eyes"
		
	return getName() + " looks completely fine, no visible bruises or signs of lust"

func getBodypartTooltipName(_bodypartSlot):
	return "error"

func getBodypartTooltipInfo(_bodypartSlot):
	return "error"

func getFluidType(fluidSource):
	if(fluidSource == BodilyFluids.FluidSource.Penis):
		return BodilyFluids.FluidType.Cum
	if(fluidSource == BodilyFluids.FluidSource.Vagina):
		return BodilyFluids.FluidType.GirlCum
		
	return null

func getFluidAmount(fluidSource):
	if(fluidSource == BodilyFluids.FluidSource.Penis):
		return 100.0
	if(fluidSource == BodilyFluids.FluidSource.Vagina):
		return 200.0
		
	return 0.0

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
