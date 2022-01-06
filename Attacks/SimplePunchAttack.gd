extends Attack

func _init():
	id = "simplepunchattack"
	category = Category.Physical
	
func getVisibleName():
	return "Simple punch"
	
func getVisibleDesc():
	return "Punch them"
	
func _doAttack(_attacker, _reciever):
	var attackerName = _attacker.getName()
	var recieverName = _reciever.getName()
	
	var damage = _reciever.recieveDamage(DamageType.Blunt, 6)
	damage += _reciever.recieveDamage(DamageType.Blunt, 6)
	
	var text = attackerName + " punches " + recieverName + " a few times and does "+str(damage)+" damage!"
	
	return text
	
func _canUse(_attacker, _reciever):
	return true

func getRequirements():
	return [["freearms"]]
