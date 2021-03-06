extends Attack

func _init():
	id = "scratchattack"
	category = Category.Physical
	aiCategory = AICategory.Offensive
	
func getVisibleName(_context = {}):
	return "Scratch"
	
func getVisibleDesc(_context = {}):
	return "You scratch the enemy for "+scaledDmgRangeStr(DamageType.Physical, 5, 15)+" damage. May cause bleeding with 50%"
	
func _doAttack(_attacker, _receiver, _context = {}):
	var attackerName = _attacker.getName()
	var receiverName = _receiver.getName()
	
	if(checkMissed(_attacker, _receiver, DamageType.Physical)):
		return attackerName + " tries to scratch " + receiverName + " but misses and fails completely"
	
	if(checkDodged(_attacker, _receiver, DamageType.Physical)):
		return attackerName + " tries to scratch " + receiverName + " but " + receiverName + " dodges the attack masterfully"
	
	var damage = 0
	damage = doDamage(_attacker, _receiver, DamageType.Physical, RNG.randi_range(5, 15))
	if(RNG.chance(50)):
		_receiver.addEffect(StatusEffect.Bleeding)
	
	var texts = [
		attackerName + " sinks "+_attacker.hisHer()+" claws into " + receiverName +" and leaves a few good scratch marks",
		attackerName + " scratches " + receiverName +" using "+_attacker.hisHer() +" claws",
	]
	var text = RNG.pick(texts)
	if(RNG.chance(50) && !_receiver.hasEffect(StatusEffect.Bleeding)):
		text += " causing "+_receiver.himHer() + " to start [color=red]bleeding[/color]"
		_receiver.addEffect(StatusEffect.Bleeding)
	
	text += "\n"+receiverDamageMessage(DamageType.Physical, damage)
	
	return text
	
func _canUse(_attacker, _receiver, _context = {}):
	return true

func getRequirements():
	return [["freearms"]]

func getAttackSoloAnimation():
	return "punch"

func getExperience():
	return [[Skill.Combat, 10]]
