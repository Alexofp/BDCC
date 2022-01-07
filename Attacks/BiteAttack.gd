extends Attack

func _init():
	id = "biteattack"
	category = Category.Physical
	
func getVisibleName():
	return "Bite"
	
func getVisibleDesc():
	return "60% chance to do 15-20 damage and cause bleeding"
	
func _doAttack(_attacker, _reciever):
	var attackerName = _attacker.getName()
	var recieverName = _reciever.getName()
	
	var chanceToHit = _attacker.getAttackAccuracy(DamageType.Sharp) * 0.6
	var dodgeChance = _reciever.getDodgeChance(DamageType.Sharp)
	
	if(!RNG.chance(100.0 * chanceToHit)):
		return attackerName + " tries to bite " + recieverName + " but misses and fails completely"
	
	if(RNG.chance(100.0 * dodgeChance)):
		return attackerName + " tries to bite " + recieverName + " but " + recieverName + " dodges the attack masterfully"
	
	var damage = 0
	damage = _reciever.recieveDamage(DamageType.Sharp, RNG.randi_range(15, 20))
	_reciever.addEffect(StatusEffect.Bleeding)
	
	var text = attackerName + " bites " + recieverName + " and does "+str(damage)+" damage!"
	
	return text
	
func _canUse(_attacker, _reciever):
	return true

func getRequirements():
	return [["freemouth"]]
