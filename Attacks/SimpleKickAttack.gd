extends Attack

func _init():
	id = "simplekickattack"
	category = Category.Physical
	aiCategory = AICategory.Offensive
	
func getVisibleName():
	return "Kick"
	
func getVisibleDesc():
	return "Kick them for 10-15 damage. May knock the enemy"
	
func _doAttack(_attacker, _reciever):
	var attackerName = _attacker.getName()
	var recieverName = _reciever.getName()
	
	if(checkMissed(_attacker, _reciever, DamageType.Physical)):
		return attackerName + " tries to kick " + recieverName + " but misses and fails completely"
	
	if(checkDodged(_attacker, _reciever, DamageType.Physical)):
		return attackerName + " tries to kick " + recieverName + " but " + recieverName + " dodges the attack masterfully"
	
	var damage = doDamage(_attacker, _reciever, DamageType.Physical, RNG.randi_range(10, 15))
	#_reciever.addEffect(StatusEffect.Bleeding)
	if(RNG.chance(10)):
		_reciever.addEffect(StatusEffect.Collapsed)
	
	return attackerName + " kicks " + recieverName + " and does "+str(damage)+" damage!"
	
func _canUse(_attacker, _reciever):
	return true

func getRequirements():
	return [["freelegs"]]
