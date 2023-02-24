extends Attack

func _init():
	id = "StunBatonStunPCAttack"
	category = Category.Physical
	aiCategory = AICategory.Offensive
	isWeaponAttack = true
	
func getVisibleName(_context = {}):
	return "Stun!"
	
func getVisibleDesc(_context = {}):
	var item = getItem(_context)
	if(item == null):
		return "error"
	var charges = item.getCharges()
	
	return "Use 2 stun baton's charges to stun the enemy for 2 turns and do "+scaledDmgRangeStr(DamageType.Physical, 5, 10)+" damage. 30% accuracy penalty."+"\n"+"Has "+str(charges)+" "+Util.multipleOrSingularEnding(charges, "charge")+" left"
	
func _doAttack(_attacker, _receiver, _context = {}):
	if(checkMissed(_attacker, _receiver, DamageType.Physical, 0.7)):
		return genericMissMessage(_attacker, _receiver)
	
	if(checkDodged(_attacker, _receiver, DamageType.Physical)):
		return genericDodgeMessage(_attacker, _receiver)
	
	var item = getItem(_context)
	if(item != null):
		item.useCharge(2)
	
	var texts = [
		"{attacker.name} switches the mode of {attacker.his} stun baton to 'incapacitate' and strikes {receiver.name}!",
	]
	_receiver.addEffect(StatusEffect.Stunned, [2])
	
	var text = RNG.pick(texts)
	
	return {
		text = text,
		pain = RNG.randi_range(5, 10),
	}
	
func _canUse(_attacker, _receiver, _context = {}):
	return itemExists(_context)

func getAttackSoloAnimation():
	return "stunbaton"

func getExperience():
	return [[Skill.Combat, 5]]

func getRecieverArmorScaling(_attacker, _receiver, _damageType) -> float:
	return 0.1

func getAttackerDamageMultiplierEfficiency(_attacker, _receiver, _damageType) -> float:
	return 0.0

func getRequirements():
	return [AttackRequirement.FreeArms, AttackRequirement.FreeHands]
