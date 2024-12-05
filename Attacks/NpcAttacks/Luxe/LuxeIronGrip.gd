extends Attack

func _init():
	id = "LuxeIronGrip"
	category = Category.Physical
	aiCategory = AICategory.Offensive
	
func getVisibleName(_context = {}):
	return "Iron grip"
	
func getVisibleDesc(_context = {}):
	return "Shouldn't see this"
	
func _doAttack(_attacker, _receiver, _context = {}):
	if(checkMissed(_attacker, _receiver, DamageType.Physical)):
		addLuxeRage(_attacker, 0.25)
		return genericMissMessage(_attacker, _receiver)
	
	if(checkDodged(_attacker, _receiver, DamageType.Physical)):
		addLuxeRage(_attacker, 0.25)
		return genericDodgeMessage(_attacker, _receiver)
	
	var text = "{attacker.name}’s hand clamps around your throat like a vice, cutting off your air as {attacker.he} lifts you off the ground. Your vision swims as {attacker.his} grip tightens, bruising your windpipe before {attacker.he} slams you into the ground."
	return {
		text = text,
		pain = 10,
		stamina = 15,
	}
	
func _canUse(_attacker, _receiver, _context = {}):
	return true

func getAnticipationText(_attacker, _receiver):
	var text = "{attacker.name}’s eyes narrow as {attacker.he} approaches, {attacker.his} glowing fur tips flaring faintly. His claws flex, ready to seize you."

	return text

func getRequirements():
	return [AttackRequirement.FreeArms]
	

func getAttackSoloAnimation():
	return "punch"

func getRecieverArmorScaling(_attacker, _receiver, _damageType) -> float:
	return 1.0

func addLuxeRage(_attacker, howMuch:float):
	if(_attacker.hasEffect("LuxeRage")):
		_attacker.getEffect("LuxeRage").addRage(howMuch)
