extends Attack

func _init():
	id = "StunBatonStunPCAttack"
	category = Category.Physical
	aiCategory = AICategory.Offensive
	
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
	
	var damage = 0
	
	var item = getItem(_context)
	if(item != null):
		#var damageRange = item.getDamageRange()
		damage = doDamage(_attacker, _receiver, DamageType.Physical, RNG.randi_range(5, 10))
		
		item.useCharge(2)
	
	var texts = [
		"{attacker.name} switches the mode of {attacker.his} stun baton to 'incapacitate' and strikes {receiver.name}!",
	]
	_receiver.addEffect(StatusEffect.Stunned, [2])
	
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
