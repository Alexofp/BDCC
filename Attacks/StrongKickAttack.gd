extends Attack

func _init():
	id = "strongkickattack"
	category = Category.Special
	
func getVisibleName():
	return "Strong kick"
	
func getVisibleDesc():
	return "Kick them"
	
func _doAttack(_attacker, _reciever):
	var attackerName = _attacker.getName()
	var recieverName = _reciever.getName()
	
	var damage = _reciever.recieveDamage(DamageType.Blunt, 20)
	_reciever.addEffect(StatusEffect.Bleeding)
	
	var text = attackerName + " kicks " + recieverName + " and does "+str(damage)+" damage!"
	
	return text
	
func _canUse(_attacker, _reciever):
	return true

func getRequirements():
	return [["stamina", 40]]
