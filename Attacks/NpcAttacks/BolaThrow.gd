extends Attack

func _init():
	id = "BolaThrow"
	category = Category.Physical
	aiCategory = AICategory.Offensive
	
func getVisibleName(_context = {}):
	return "Throw bola"
	
func getVisibleDesc(_context = {}):
	return "Shouldn't see this"
	
func _doAttack(_attacker, _receiver, _context = {}):
	if(checkMissed(_attacker, _receiver, DamageType.Physical)):
		return genericMissMessage(_attacker, _receiver)
	
	if(checkDodged(_attacker, _receiver, DamageType.Physical)):
		return genericDodgeMessage(_attacker, _receiver)
	
	var text = "The bola wraps around {receiver.name}'s legs and makes {receiver.him} trip!"
	var _damage = doDamage(_attacker, _receiver, DamageType.Physical, RNG.randi_range(10, 20))
	text += " " + receiverDamageMessage(DamageType.Physical, _damage)
	
	_receiver.addEffect(StatusEffect.Collapsed)
	return text
	
func _canUse(_attacker, _receiver, _context = {}):
	if(_receiver.hasEffect(StatusEffect.Collapsed)):
		return false
	
	return true

func getAnticipationText(_attacker, _receiver):
	return "{attacker.name} throws a bola at {receiver.name}’s feet!"

