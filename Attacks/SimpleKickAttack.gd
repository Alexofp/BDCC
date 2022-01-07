extends Attack

func _init():
	id = "simplekickattack"
	category = Category.Physical
	
func getVisibleName():
	return "Kick"
	
func getVisibleDesc():
	return "Kick them for 10-15 damage. May knock the enemy"
	
func _doAttack(_attacker, _reciever):
	var attackerName = _attacker.getName()
	var recieverName = _reciever.getName()
	
	var chanceToHit = _attacker.getAttackAccuracy(DamageType.Blunt)
	var dodgeChance = _reciever.getDodgeChance(DamageType.Blunt)
	
	if(!RNG.chance(100.0 * chanceToHit)):
		return attackerName + " tries to kick " + recieverName + " but misses and fails completely"
	
	if(RNG.chance(100.0 * dodgeChance)):
		return attackerName + " tries to kick " + recieverName + " but " + recieverName + " dodges the attack masterfully"
	
	var damage = _reciever.recieveDamage(DamageType.Blunt, RNG.randi_range(10,15))
	#_reciever.addEffect(StatusEffect.Bleeding)
	if(RNG.chance(10)):
		_reciever.addEffect(StatusEffect.Collapsed)
	
	return attackerName + " kicks " + recieverName + " and does "+str(damage)+" damage!"
	
func _canUse(_attacker, _reciever):
	return true

func getRequirements():
	return [["freelegs"]]
