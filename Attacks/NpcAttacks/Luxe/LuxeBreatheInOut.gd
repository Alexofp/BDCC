extends Attack

func _init():
	id = "LuxeBreatheInOut"
	category = Category.Physical
	aiCategory = AICategory.Offensive
	
func getVisibleName(_context = {}):
	return "Breath in and out"
	
func getVisibleDesc(_context = {}):
	return "Shouldn't see this"
	
func _doAttack(_attacker, _receiver, _context = {}):
	var text = "{attacker.name} feels {attacker.his} chest tightening. {attacker.He} uses {attacker.his} turn to close {attacker.his} eyes and steady {attacker.his} breathing."
	
	text += "\n\n"
	text += "[say=attacker]"+RNG.pick([
		"I learned to control it.",
		"I won't make it easy for you.",
		"I'm not gonna die because of you.",
		]) + "[/say]"
	
	addLuxeRage(_attacker, -2.5)
	return {
		text = text,
	}
	
func _canUse(_attacker, _receiver, _context = {}):
	if(getLuxeRage(_attacker) < 1.5):
		return false
	
	return true

func canBeDodgedByPlayer(_attacker, _receiver):
	return false
	
func getRequirements():
	return [AttackRequirement.CanTalk]
	
func getRecieverArmorScaling(_attacker, _receiver, _damageType) -> float:
	return 1.0

func addLuxeRage(_attacker, howMuch:float):
	if(_attacker.hasEffect("LuxeRage")):
		_attacker.getEffect("LuxeRage").addRage(howMuch)

func getLuxeRage(_attacker) -> float:
	if(_attacker.hasEffect("LuxeRage")):
		return _attacker.getEffect("LuxeRage").rage
	return 0.0
