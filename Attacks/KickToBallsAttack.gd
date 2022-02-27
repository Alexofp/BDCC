extends Attack

func _init():
	id = "kickToBallsAttack"
	category = Category.Physical
	aiCategory = AICategory.Offensive
	
func getVisibleName():
	return "Kick to the balls"
	
func getVisibleDesc():
	return "You shouldn't see this"
	
func _doAttack(_attacker, _reciever):
	var attackerName = _attacker.getName()
	var recieverName = _reciever.getName()
	
	if(checkMissed(_attacker, _reciever, DamageType.Physical)):
		return attackerName + " tries to kick "+recieverName+" but misses"
	
	if(checkDodged(_attacker, _reciever, DamageType.Physical)):
		return attackerName + " tries to kick "+recieverName+" but {receiver.he} dodges the attack at the last second"
	
	var _damage
	#_reciever.addEffect(StatusEffect.Bleeding)

	var text = ""
	if((_reciever.isPlayer() && _reciever.hasPenis()) || (!_reciever.isPlayer() && _reciever.getGender() != BaseCharacter.Gender.Female)):
		_damage = doDamage(_attacker, _reciever, DamageType.Physical, RNG.randi_range(30, 50))
		text += "{attacker.name} kicks {receiver.name} in the balls! It was incredibly painful.\n"
		
		if(!_reciever.hasEffect(StatusEffect.Collapsed)):
			text += "{receiver.name} holds onto {receiver.his} crotch and hits the floor.\n"
			_reciever.addEffect(StatusEffect.Collapsed)
	else:
		_damage = doDamage(_attacker, _reciever, DamageType.Physical, RNG.randi_range(10, 10))
		text += "{attacker.name} manages to land a kick on {receiver.name} crotch but it wasn’t very painful.\n"
		
	
	text += "{receiver.name} received "+str(_damage)+" pain"
	
	return text
	
func _canUse(_attacker, _reciever):
	return true

func getAnticipationText(_attacker, _reciever):
	return RNG.pick([
		"{attacker.name} wants to play dirty, {attacker.he} lunges forward and tries to kick {receiver.name} in the balls! If {receiver.he} has any this will be very painful.",
	])
