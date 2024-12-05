extends Attack

func _init():
	id = "LuxePredatorsRush"
	category = Category.Physical
	aiCategory = AICategory.Offensive
	
func getVisibleName(_context = {}):
	return "Predator's Rush"
	
func getVisibleDesc(_context = {}):
	return "Shouldn't see this"
	
func _doAttack(_attacker, _receiver, _context = {}):
	if(checkMissed(_attacker, _receiver, DamageType.Physical)):
		addLuxeRage(_attacker, 0.25)
		return genericMissMessage(_attacker, _receiver)
	
	if(checkDodged(_attacker, _receiver, DamageType.Physical)):
		addLuxeRage(_attacker, 0.25)
		return genericDodgeMessage(_attacker, _receiver)
	
	var text = "{attacker.name} launches himself at you with terrifying speed, {attacker.his} shoulder slamming into your chest. The impact sends you sprawling, gasping for breath as pain flares through your ribs."
	
	if(_receiver.addEffect(StatusEffect.Weakness, [2])):
		text += " [b]You feel weak![/b]"
	if(RNG.chance(40) && _receiver.addEffect(StatusEffect.Collapsed)):
		text += " [b]You collapse![/b]"
		
	return {
		text = text,
		pain = 20,
	}
	
func _canUse(_attacker, _receiver, _context = {}):
	return true

func getAnticipationText(_attacker, _receiver):
	var text = "{attacker.name} crouches low, {attacker.his} muscles tensing like coiled steel. {attacker.His} glowing fur begins to shimmer brighter as {attacker.he} prepares to pounce."

	return text

func getRequirements():
	return [AttackRequirement.FreeLegs]
	

func getAttackSoloAnimation():
	return "shove"

func getRecieverArmorScaling(_attacker, _receiver, _damageType) -> float:
	return 1.0

func addLuxeRage(_attacker, howMuch:float):
	if(_attacker.hasEffect("LuxeRage")):
		_attacker.getEffect("LuxeRage").addRage(howMuch)
