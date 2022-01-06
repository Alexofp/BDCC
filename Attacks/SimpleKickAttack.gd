extends Attack

func _init():
	id = "simplekickattack"
	category = Category.Physical
	
func getVisibleName():
	return "Simple kick"
	
func getVisibleDesc():
	return "Kick them"
	
func _doAttack(_attacker, _reciever):
	var attackerName = _attacker.getName()
	var recieverName = _reciever.getName()
	
	var damage = _reciever.recieveDamage(DamageType.Blunt, 10)
	_reciever.addEffect(StatusEffect.Bleeding)
	if(randf() > 0.5):
		_reciever.addEffect(StatusEffect.Collapsed)
	
	var text = attackerName + " kicks " + recieverName + " and does "+str(damage)+" damage!"
	
	return text
	
func _canUse(_attacker, _reciever):
	return true
