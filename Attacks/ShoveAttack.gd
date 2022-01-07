extends Attack

func _init():
	id = "shoveattack"
	category = Category.Physical
	
func getVisibleName():
	return "Shove"
	
func getVisibleDesc():
	return "An attempt to shove the enemy away for 5 damage\n50% to miss"
	
func _doAttack(_attacker, _reciever):
	var attackerName = _attacker.getName()
	var recieverName = _reciever.getName()
	
	var chanceToHit = _attacker.getAttackAccuracy(DamageType.Blunt) * 0.5
	chanceToHit = max(chanceToHit, 0.5)
	var dodgeChance = _reciever.getDodgeChance(DamageType.Blunt)
	
	if(!RNG.chance(100.0 * chanceToHit)):
		return attackerName + " tries to shove " + recieverName + " but misses and fails completely"
	
	if(RNG.chance(100.0 * dodgeChance)):
		return attackerName + " tries to shove " + recieverName + " but " + recieverName + " dodges the attack masterfully"
	
	var damage = _reciever.recieveDamage(DamageType.Blunt, RNG.randi_range(5,5))
	#_reciever.addEffect(StatusEffect.Bleeding)
	_reciever.addEffect(StatusEffect.Collapsed)
	
	return attackerName + " shoves " + recieverName + " away and does "+str(damage)+" damage!"
	
func _canUse(_attacker, _reciever):
	return true

func getRequirements():
	return []
