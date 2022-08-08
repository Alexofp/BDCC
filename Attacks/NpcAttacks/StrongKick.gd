extends Attack

func _init():
	id = "StrongKick"
	category = Category.Physical
	aiCategory = AICategory.Offensive
	
func getVisibleName(_context = {}):
	return "Strong kick"
	
func getVisibleDesc(_context = {}):
	return "Shouldn't see this"
	
func _doAttack(_attacker, _receiver, _context = {}):
	if(checkMissed(_attacker, _receiver, DamageType.Physical)):
		return genericMissMessage(_attacker, _receiver)
	
	if(checkDodged(_attacker, _receiver, DamageType.Physical)):
		return genericDodgeMessage(_attacker, _receiver)
	
	var text = "{attacker.name} kicks {receiver.name} with the power of a bucking horse."
	var _damage = doDamage(_attacker, _receiver, DamageType.Physical, RNG.randi_range(50, 60))
	text += " " + receiverDamageMessage(DamageType.Physical, _damage)
	
	if(!_receiver.hasEffect(StatusEffect.Collapsed)):
		_receiver.addEffect(StatusEffect.Collapsed)
		text += " {receiver.name} collapsed onto the ground."
	return text
	
func _canUse(_attacker, _receiver, _context = {}):
	return true

func getAnticipationText(_attacker, _receiver):
	return "{attacker.name} kicks the ground with {attacker.his} hoof and lunges forward."

