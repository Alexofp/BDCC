extends Attack

func _init():
	id = "simplepunchattack"
	category = Category.Physical
	aiCategory = AICategory.Offensive
	
func getVisibleName():
	return "Punch"
	
func getVisibleDesc():
	return "You do a combo of 2 punches, each one dealing "+scaledDmgRangeStr(DamageType.Physical, 5, 10)+" damage"
	
func _doAttack(_attacker, _receiver):
	var attackerName = _attacker.getName()
	var receiverName = _receiver.getName()
	
	if(checkMissed(_attacker, _receiver, DamageType.Physical)):
		return attackerName + " tries to punch " + receiverName + " but misses and fails completely"
	
	if(checkDodged(_attacker, _receiver, DamageType.Physical)):
		return attackerName + " tries to punch " + receiverName + " but " + receiverName + " dodges just in time"
	
	var damage = 0
	damage = doDamage(_attacker, _receiver, DamageType.Physical, RNG.randi_range(5,10))
	damage += doDamage(_attacker, _receiver, DamageType.Physical, RNG.randi_range(5,10))
	
	var texts = [
		attackerName + " manages to land a few strong punches on " + receiverName + ". ",
	]
	var text = RNG.pick(texts)
	
	text += receiverDamageMessage(DamageType.Physical, damage)
	
	return text
	
func _canUse(_attacker, _receiver):
	return true

func getRequirements():
	return [["freearms"]]

func getAttackAnimation():
	return TheStage.Punch

func getExperience():
	return [[Skill.Combat, 10]]
