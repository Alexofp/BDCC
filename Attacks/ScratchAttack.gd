extends Attack

func _init():
	id = "scratchattack"
	category = Category.Physical
	
func getVisibleName():
	return "Scratch"
	
func getVisibleDesc():
	return "You do a combo of 2 scratches in a row, each one 5-8 damage\nmay cause bleeding with 20%"
	
func _doAttack(_attacker, _reciever):
	var attackerName = _attacker.getName()
	var recieverName = _reciever.getName()
	
	var chanceToHit = _attacker.getAttackAccuracy(DamageType.Sharp)
	var dodgeChance = _reciever.getDodgeChance(DamageType.Sharp)
	
	if(!RNG.chance(100.0 * chanceToHit)):
		return attackerName + " tries to scratch " + recieverName + " but misses and fails completely"
	
	if(RNG.chance(100.0 * dodgeChance)):
		return attackerName + " tries to scratch " + recieverName + " but " + recieverName + " dodges the attack masterfully"
	
	var damage = 0
	damage = _reciever.recieveDamage(DamageType.Sharp, RNG.randi_range(5,8))
	damage += _reciever.recieveDamage(DamageType.Sharp, RNG.randi_range(5,8))
	if(RNG.chance(20)):
		_reciever.addEffect(StatusEffect.Bleeding)
	
	var text = attackerName + " scratches " + recieverName + " a few times and does "+str(damage)+" damage!"
	
	return text
	
func _canUse(_attacker, _reciever):
	return true

func getRequirements():
	return [["freearms"]]
