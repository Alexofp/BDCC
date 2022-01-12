extends Attack

func _init():
	id = "biteattack"
	category = Category.Physical
	aiCategory = AICategory.Offensive
	
func getVisibleName():
	return "Bite"
	
func getVisibleDesc():
	return "60% chance to do 15-20 damage and cause bleeding"
	
func _doAttack(_attacker, _reciever):
	var attackerName = _attacker.getName()
	var recieverName = _reciever.getName()
	
	if(checkMissed(_attacker, _reciever, DamageType.Physical, 0.6)):
		return attackerName + " tries to bite " + recieverName + " but misses and fails completely"
	
	if(checkDodged(_attacker, _reciever, DamageType.Physical)):
		return attackerName + " tries to bite " + recieverName + " but " + recieverName + " dodges the attack masterfully"
	
	var damage = 0
	damage = doDamage(_attacker, _reciever, DamageType.Physical, RNG.randi_range(15, 20))
	_reciever.addEffect(StatusEffect.Bleeding)
	
	var text = attackerName + " bites " + recieverName + " and does "+str(damage)+" damage!"
	
	return text
	
func _canUse(_attacker, _reciever):
	return true

func getRequirements():
	return [["freemouth"]]
