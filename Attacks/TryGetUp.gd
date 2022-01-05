extends Attack

func _init():
	id = "trygetupattack"
	category = Category.Physical
	
func getVisibleName():
	return "Try to get up"
	
func getVisibleDesc():
	return "You shouldn't see this"
	
func _doAttack(_attacker, _reciever):
	var attackerName = _attacker.getName()
	#var recieverName = _reciever.getName()
	
	var success = false
	if(randf() > 0.5):
		_attacker.removeEffect(StatusEffect.Collapsed)
		success = true
	
	var text
	if(success):
		text = attackerName + " wastes their turn but they manage to get up off the ground"
	else:
		text = attackerName + " tries to get up but fails miserably"
	
	return text
	
func _canUse(_attacker, _reciever):
	return _attacker.hasEffect(StatusEffect.Collapsed)
