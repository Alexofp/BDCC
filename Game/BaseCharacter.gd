extends Node
class_name BaseCharacter

#Base class that has all the functions
signal stat_changed
var pain:int = 0
var lust:int = 0
var stamina:int = 100
var statusEffects:Dictionary = {}

# Combat stats
var initialDodgeChance = 0

var fightingState = "" # dodge, block, defocus

# used to fix the spamming of the same lust attack
var lustMemory:Dictionary = {}

func _init():
	pass

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
		panel.addBattleEffect(effect.getEffectVisibleType(), effect.getEffectName(), effect.getEffectDesc(), effect.getEffectImage())

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
	if(isBlocking()):
		if(_damageType == DamageType.Physical):
			return 10
	if(isDefocusing()):
		if(_damageType == DamageType.Lust):
			return 10
	
	return 0
	
func onDamage(_damageType, _amount):
	pass

func getDamageMultiplier(_damageType):
	var mult = 1
	for effectID in statusEffects.keys():
		var effect = statusEffects[effectID]
		mult *= effect.getDamageMultiplierMod(_damageType)
	
	return mult

func getRecieveDamageMultiplier(_damageType):
	var mult = 1
	for effectID in statusEffects.keys():
		var effect = statusEffects[effectID]
		mult *= effect.getRecievedDamageMod(_damageType)
	
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
	if(lustDamage <= -20):
		return getName() + " got very turned off by the sight"
	if(lustDamage <= -10):
		return getName() + " didn't like that at all"
	if(lustDamage <= -5):
		return getName() + " sighs and shakes their head"
	if(lustDamage == 0):
		return getName() + " didn't seem to care at all"
	if(lustDamage <= 5):
		return getName() + " seems intrigued and hides their slight blush"
	if(lustDamage <= 10):
		return getName() + " smiles eagerly and watches the show"
	if(lustDamage <= 10):
		return getName() + " smiles eagerly and carefully watches " + _enemy.getName()
	if(lustDamage <= 15):
		return getName() + " exhalled deeply while rubbing their legs together"
	if(lustDamage > 15):
		return getName() + " moans audibly, their eyes burn with desire"
