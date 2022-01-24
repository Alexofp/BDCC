extends Attack

func _init():
	id = "shoveattack"
	category = Category.Physical
	aiCategory = AICategory.Defensive
	
func getVisibleName():
	return "Shove"
	
func getVisibleDesc():
	return "An attempt to shove the enemy away for 5 damage. 30% miss chance"
	
func _doAttack(_attacker, _reciever):
	var attackerName = _attacker.getName()
	var recieverName = _reciever.getName()
	
	var chanceToHit = _attacker.getAttackAccuracy(DamageType.Physical) * 0.7
	chanceToHit = max(chanceToHit, 0.5)
	#var dodgeChance = _reciever.getDodgeChance(DamageType.Physical)
	
	if(!RNG.chance(100.0 * chanceToHit)):
		return attackerName + " tries to shove " + recieverName + " but misses and fails completely"
	
	if(checkDodged(_attacker, _reciever, DamageType.Physical)):
		return attackerName + " tries to shove " + recieverName + " but " + recieverName + " dodges the attack masterfully"
	
	var damage = doDamage(_attacker, _reciever, DamageType.Physical, 5)
	#_reciever.addEffect(StatusEffect.Bleeding)
	_reciever.addEffect(StatusEffect.Collapsed)
	
	return attackerName + " shoves " + recieverName + " away and does "+str(damage)+" damage!"
	
func _canUse(_attacker, _reciever):
	return true

func getRequirements():
	return []
