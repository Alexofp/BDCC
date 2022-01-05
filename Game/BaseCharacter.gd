extends Node
class_name BaseCharacter

#Base class that has all the functions
signal stat_changed
var pain:int = 0
var lust:int = 0
var stamina:int = 100
var statusEffects:Dictionary = {}

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
	
# Should include armor checks and return amount of pain actually added
func recievePain(addpain: int):	
	var oldpain = pain

	addPain(addpain)
	
	var actualAddpain = pain - oldpain
	return actualAddpain

func painThreshold():
	return 100

func lustThreshold():
	return 100

# Should include armor checks and return amount of lust actually added
func recieveLust(addlust: int):	
	var oldlust = lust

	addLust(addlust)
	
	var actualAddlust = lust - oldlust
	return actualAddlust

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
	
func updateEffectPanel(panel: StatusEffectsPanel):
	panel.clearBattleEffects()
	for effectID in statusEffects.keys():
		var effect = statusEffects[effectID]
		panel.addBattleEffect(effect.getEffectVisibleType(), effect.getEffectName(), effect.getEffectDesc(), effect.getEffectImage())

func processBattleTurn():
	for effectID in statusEffects.keys():
		var effect = statusEffects[effectID]
		effect.processBattleTurn()

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
