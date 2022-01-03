extends Attack

func _init():
	id = "simplekickattack"
	
func _doAttack(_attacker, _reciever):
	var attackerName = _attacker.getName()
	var recieverName = _reciever.getName()
	
	var damage = _reciever.recievePain(10)
	_reciever.addEffect(StatusEffect.Bleeding)
	
	var text = attackerName + " kicks " + recieverName + " and does "+str(damage)+" damage!"
	
	return text
	
func _canUse(_attacker, _reciever):
	return true
