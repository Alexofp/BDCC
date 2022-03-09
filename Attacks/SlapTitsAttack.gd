extends Attack

func _init():
	id = "slapTitsAttack"
	category = Category.Lust
	aiCategory = AICategory.Lust
	
func getVisibleName():
	return "Slap tits"
	
func getVisibleDesc():
	return "You shouldn't see this"
	
func _doAttack(_attacker, _reciever):
	var attackerName = _attacker.getName()
	var recieverName = _reciever.getName()
	
	if(checkMissed(_attacker, _reciever, DamageType.Physical)):
		return attackerName + " tries to slap "+recieverName+"'s tits but misses"
	
	if(checkDodged(_attacker, _reciever, DamageType.Physical)):
		return attackerName + " tries to slap "+recieverName+"'s tits but " + recieverName + " dodges the attack at the last second"
	
	var _damage = 0
	var _damageLust = doDamage(_attacker, _reciever, DamageType.Lust, RNG.randi_range(20, 30))
	#_reciever.addEffect(StatusEffect.Bleeding)

	var text = ""
	if((_reciever.isPlayer() && _reciever.hasBigBreasts()) || (!_reciever.isPlayer() && _reciever.getGender() != BaseCharacter.Gender.Male)):
		_damage = doDamage(_attacker, _reciever, DamageType.Physical, RNG.randi_range(20, 20))
		text += "{receiver.name}’s big tits received a painful smack! {attacker.name} also managed to hit the sensitive nips.\n"
	else:
		_damage = doDamage(_attacker, _reciever, DamageType.Physical, RNG.randi_range(1, 5))
		text += "{receiver.name} didn’t even feel the smack but {attacker.name}’s hand did manage to hit the sensitive nips.\n"
		
	
	text += recieverDamageMessageList([[DamageType.Physical, _damage], [DamageType.Lust, _damageLust]])
	
	return text
	
func _canUse(_attacker, _reciever):
	return true

func getAnticipationText(_attacker, _reciever):
	return RNG.pick([
		"{attacker.name} rushes at {receiver.name} and aims to slap {receiver.his} tits!",
	])
