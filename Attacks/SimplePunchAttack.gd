extends Attack

func _init():
	id = "simplepunchattack"
	category = Category.Physical
	
func getVisibleName():
	return "Punch"
	
func getVisibleDesc():
	return "You do a combo of 2 punches in a row, each one 5-10 damage"
	
func _doAttack(_attacker, _reciever):
	var attackerName = _attacker.getName()
	var recieverName = _reciever.getName()
	
	var chanceToHit = _attacker.getAttackAccuracy(DamageType.Physical)
	var dodgeChance = _reciever.getDodgeChance(DamageType.Physical)
	
	if(!RNG.chance(100.0 * chanceToHit)):
		return attackerName + " tries to punch " + recieverName + " but misses and fails completely"
	
	if(RNG.chance(100.0 * dodgeChance)):
		return attackerName + " tries to punch " + recieverName + " but " + recieverName + " dodges the attack masterfully"
	
	var damage = 0
	damage = doDamage(_attacker, _reciever, DamageType.Physical, RNG.randi_range(5,10))
	damage += doDamage(_attacker, _reciever, DamageType.Physical, RNG.randi_range(5,10))
	
	var text = attackerName + " punches " + recieverName + " a few times and does "+str(damage)+" damage!"
	
	return text
	
func _canUse(_attacker, _reciever):
	return true

func getRequirements():
	return [["freearms"]]
