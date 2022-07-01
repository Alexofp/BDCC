extends Attack

func _init():
	id = "kickToBallsAttack"
	category = Category.Physical
	aiCategory = AICategory.Offensive
	
func getVisibleName(_context = {}):
	return "Kick to the balls"
	
func getVisibleDesc(_context = {}):
	return "You shouldn't see this"
	
func _doAttack(_attacker, _receiver, _context = {}):
	var attackerName = _attacker.getName()
	var receiverName = _receiver.getName()
	
	if(checkMissed(_attacker, _receiver, DamageType.Physical)):
		return attackerName + " tries to kick "+receiverName+" but misses"
	
	if(checkDodged(_attacker, _receiver, DamageType.Physical)):
		return attackerName + " tries to kick "+receiverName+" but {receiver.he} dodges the attack at the last second"
	
	var _damage
	#_receiver.addEffect(StatusEffect.Bleeding)

	var text = ""
	if((_receiver.isPlayer() && _receiver.hasPenis()) || (!_receiver.isPlayer() && _receiver.getGender() != Gender.Female)):
		_damage = doDamage(_attacker, _receiver, DamageType.Physical, RNG.randi_range(30, 50))
		text += "{attacker.name} kicks {receiver.name} in the balls! It was incredibly painful.\n"
		
		if(!_receiver.hasEffect(StatusEffect.Collapsed)):
			text += "{receiver.name} holds onto {receiver.his} crotch and [b]hits the floor.[/b]\n"
			_receiver.addEffect(StatusEffect.Collapsed)
	else:
		_damage = doDamage(_attacker, _receiver, DamageType.Physical, RNG.randi_range(10, 10))
		text += "{attacker.name} manages to land a kick on {receiver.name} crotch but it wasn’t very painful.\n"
		
	
	text += receiverDamageMessage(DamageType.Physical, _damage)
	
	return text
	
func _canUse(_attacker, _receiver, _context = {}):
	return true

func getAnticipationText(_attacker, _receiver):
	return RNG.pick([
		"{attacker.name} wants to play dirty, {attacker.he} lunges forward and tries to kick {receiver.name} in the balls! If {receiver.he} has any this will be very painful.",
	])
