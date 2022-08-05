extends Attack

func _init():
	id = "AxisGrab"
	category = Category.Lust
	aiCategory = AICategory.Lust
	
func getVisibleName(_context = {}):
	return "Axis grab"
	
func getVisibleDesc(_context = {}):
	return "Shouldn't see this"
	
func _doAttack(_attacker, _receiver, _context = {}):
	if(checkMissed(_attacker, _receiver, DamageType.Physical)):
		return genericMissMessage(_attacker, _receiver)
	
	if(checkDodged(_attacker, _receiver, DamageType.Physical)):
		return genericDodgeMessage(_attacker, _receiver)
	
	var text = "{attacker.name} grabs {receiver.name} by the head and pulls it down to {attacker.his} crotch, letting {receiver.name} feel the bulge and sniff its arousing scent."
	var _damage = doDamage(_attacker, _receiver, DamageType.Lust, RNG.randi_range(50, 50))
	text += " " + receiverDamageMessage(DamageType.Lust, _damage)
	return text
	
func _canUse(_attacker, _receiver, _context = {}):
	return true

func getAnticipationText(_attacker, _receiver):
	var text = "{attacker.name} is trying to get a grasp on {receiver.name}!"

	return text
