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
	if(RNG.chance(70)):
		_attacker.removeEffect(StatusEffect.Collapsed)
		success = true
	
	var text
	if(success):
		text = attackerName + " wastes "+_attacker.hisHer()+" turn but "+_attacker.heShe()+" manages to get up"
	else:
		text = attackerName + " tries to get up but fails to do so in time"
	
	return text
	
func _canUse(_attacker, _reciever):
	return _attacker.hasEffect(StatusEffect.Collapsed)

func canBeDodgedByPlayer(_attacker, _reciever):
	return false

func getAIScore(_attacker, _reciever):
	if(_attacker.hasEffect(StatusEffect.Collapsed)):
		return 5.0
	return 0.0
