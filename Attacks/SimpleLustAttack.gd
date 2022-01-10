extends Attack

func _init():
	id = "simplelustattack"
	category = Category.Lust
	
func getVisibleName():
	return "Simple lust attack"
	
func getVisibleDesc():
	return "You flash the enemy I dunno"
	
func _doAttack(_attacker, _reciever):
	var attackerName = _attacker.getName()
	var recieverName = _reciever.getName()
	
	var damage = doDamage(_attacker, _reciever, DamageType.Lust, 10)
	#_reciever.addEffect(StatusEffect.Bleeding)
	
	var text = attackerName + " lusts " + recieverName + " and does "+str(damage)+" lust damage!"
	
	return text
	
func _canUse(_attacker, _reciever):
	return true
