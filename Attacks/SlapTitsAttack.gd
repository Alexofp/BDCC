extends Attack

func _init():
	id = "slapTitsAttack"
	category = Category.Lust
	aiCategory = AICategory.Lust
	
func getVisibleName(_context = {}):
	return "Slap tits"
	
func getVisibleDesc(_context = {}):
	return "You shouldn't see this"
	
func _doAttack(_attacker, _receiver, _context = {}):
	var attackerName = _attacker.getName()
	var receiverName = _receiver.getName()
	
	if(checkMissed(_attacker, _receiver, DamageType.Physical)):
		return attackerName + " tries to slap "+receiverName+"'s tits but misses"
	
	if(checkDodged(_attacker, _receiver, DamageType.Physical)):
		return attackerName + " tries to slap "+receiverName+"'s tits but " + receiverName + " dodges the attack at the last second"
	
	var _damage = 0
	var _damageLust = doDamage(_attacker, _receiver, DamageType.Lust, RNG.randi_range(20, 30))
	#_receiver.addEffect(StatusEffect.Bleeding)

	var text = ""
	if((_receiver.isPlayer() && _receiver.hasBigBreasts()) || (!_receiver.isPlayer() && _receiver.getGender() != Gender.Male)):
		_damage = doDamage(_attacker, _receiver, DamageType.Physical, RNG.randi_range(20, 20))
		text += "{receiver.name}’s big tits received a painful smack! {attacker.name} also managed to hit the sensitive nips.\n"
	else:
		_damage = doDamage(_attacker, _receiver, DamageType.Physical, RNG.randi_range(1, 5))
		text += "{receiver.name} didn’t even feel the smack but {attacker.name}’s hand did manage to hit the sensitive nips.\n"
		
	
	text += receiverDamageMessageList([[DamageType.Physical, _damage], [DamageType.Lust, _damageLust]])
	
	return text
	
func _canUse(_attacker, _receiver, _context = {}):
	return true

func getAnticipationText(_attacker, _receiver):
	return RNG.pick([
		"{attacker.name} rushes at {receiver.name} and aims to slap {receiver.his} tits!",
	])
