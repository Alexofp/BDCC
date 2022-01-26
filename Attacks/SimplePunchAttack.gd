extends Attack

func _init():
	id = "simplepunchattack"
	category = Category.Physical
	aiCategory = AICategory.Offensive
	
func getVisibleName():
	return "Punch"
	
func getVisibleDesc():
	return "You do a combo of 2 punches, each one dealing 5-10 damage"
	
func _doAttack(_attacker, _reciever):
	var attackerName = _attacker.getName()
	var recieverName = _reciever.getName()
	
	if(checkMissed(_attacker, _reciever, DamageType.Physical)):
		return attackerName + " tries to punch " + recieverName + " but misses and fails completely"
	
	if(checkDodged(_attacker, _reciever, DamageType.Physical)):
		return attackerName + " tries to punch " + recieverName + " but " + recieverName + " dodges just in time"
	
	var damage = 0
	damage = doDamage(_attacker, _reciever, DamageType.Physical, RNG.randi_range(5,10))
	damage += doDamage(_attacker, _reciever, DamageType.Physical, RNG.randi_range(5,10))
	
	var texts = [
		attackerName + " manages to land a few strong punches on " + recieverName + " doing "+str(damage)+" damage!",
	]
	var text = RNG.pick(texts)
	
	return text
	
func _canUse(_attacker, _reciever):
	return true

func getRequirements():
	return [["freearms"]]
