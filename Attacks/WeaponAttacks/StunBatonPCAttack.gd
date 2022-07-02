extends Attack

func _init():
	id = "StunBatonPCAttack"
	category = Category.Physical
	aiCategory = AICategory.Offensive
	
func getVisibleName(_context = {}):
	var item = getItem(_context)
	if(item == null):
		return "error"
	
	return item.getVisibleName()
	
func getVisibleDesc(_context = {}):
	var item = getItem(_context)
	if(item == null):
		return "error"
	
	return item.getVisisbleDescription()
	
func _doAttack(_attacker, _receiver, _context = {}):
	if(checkMissed(_attacker, _receiver, DamageType.Physical)):
		return genericMissMessage(_attacker, _receiver)
	
	if(checkDodged(_attacker, _receiver, DamageType.Physical)):
		return genericDodgeMessage(_attacker, _receiver)
	
	var damage = 0
	
	var item = getItem(_context)
	if(item != null):
		var damageRange = item.getDamageRange()
		damage = doDamage(_attacker, _receiver, DamageType.Physical, RNG.randi_range(damageRange[0], damageRange[1]))
		
		item.useCharge()
	
	var texts = [
		"{attacker.name} strikes {receiver.name} with the stun baton.",
	]
	var text = RNG.pick(texts)
	
	text += " "+receiverDamageMessage(DamageType.Physical, damage)
	
	return text
	
func _canUse(_attacker, _receiver, _context = {}):
	return true

func getRequirements():
	return [["freearms"]]

func getAttackSoloAnimation():
	return "stunbaton"

func getExperience():
	return [[Skill.Combat, 5]]
