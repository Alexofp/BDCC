extends Attack

func _init():
	id = "simplepunchattack"
	category = Category.Physical
	aiCategory = AICategory.Offensive
	
func getVisibleName(_context = {}):
	return "Punch"
	
func getVisibleDesc(_context = {}):
	return "You do a combo of 2 punches, each one dealing "+scaledDmgRangeStr(DamageType.Physical, 5, 10)+" damage"
	
func _doAttack(_attacker, _receiver, _context = {}):
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
	
func _canUse(_attacker, _receiver, _context = {}):
	return true

func getRequirements():
	return [["freearms"]]

func getAttackSoloAnimation():
	return "punch"

func getExperience():
	return [[Skill.Combat, 10]]
