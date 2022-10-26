extends Attack

func _init():
	id = "TailSwipe"
	category = Category.Physical
	aiCategory = AICategory.Offensive
	
func getVisibleName(_context = {}):
	return "Tail swipe"
	
func getVisibleDesc(_context = {}):
	return "Shouldn't see this"
	
func _doAttack(_attacker, _receiver, _context = {}):
	if(checkMissed(_attacker, _receiver, DamageType.Physical)):
		return genericMissMessage(_attacker, _receiver)
	
	if(checkDodged(_attacker, _receiver, DamageType.Physical)):
		return genericDodgeMessage(_attacker, _receiver)
	
	var text = "{attacker.name} whips {receiver.name}’s legs with {attacker.his} tail and then makes {receiver.him} trip!"
	_receiver.addEffect(StatusEffect.Collapsed)
	
	return {
		text = text,
		pain = 10,
	}
	
func _canUse(_attacker, _receiver, _context = {}):
	if(_receiver.hasEffect(StatusEffect.Collapsed)):
		return false
	
	return true

func getAnticipationText(_attacker, _receiver):
	return "{attacker.name} uses {attacker.his} tail to swipe the ground from under {receiver.name}’s feet!"

func getRequirements():
	return [AttackRequirement.FreeLegs]

