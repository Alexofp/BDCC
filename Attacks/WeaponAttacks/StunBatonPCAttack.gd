extends Attack

func _init():
	id = "StunBatonPCAttack"
	category = Category.Physical
	aiCategory = AICategory.Offensive
	isWeaponAttack = true
	
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
	
	var damageRange = [0,0]
	
	var item = getItem(_context)
	if(item != null):
		damageRange = item.getDamageRange()
		item.useCharge()
	
	var texts = [
		"{attacker.name} strikes {receiver.name} with the stun baton.",
	]
	var text = RNG.pick(texts)
	
	return {
		text = text,
		pain = RNG.randi_range(damageRange[0], damageRange[1]),
	}
	
func _canUse(_attacker, _receiver, _context = {}):
	return itemExists(_context)

func getAttackSoloAnimation():
	return "stunbaton"

func getExperience():
	return [[Skill.Combat, 5]]

func getRecieverArmorScaling(_attacker, _receiver, _damageType) -> float:
	return 0.5

func getAttackerDamageMultiplierEfficiency(_attacker, _receiver, _damageType) -> float:
	return 0.0

func getRequirements():
	return [AttackRequirement.FreeArms, AttackRequirement.FreeHands]
