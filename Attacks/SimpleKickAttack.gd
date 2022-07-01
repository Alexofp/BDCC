extends Attack

func _init():
	id = "simplekickattack"
	category = Category.Physical
	aiCategory = AICategory.Offensive
	
func getVisibleName(_context = {}):
	return "Kick"
	
func getVisibleDesc(_context = {}):
	return "Kick them for "+scaledDmgRangeStr(DamageType.Physical, 10, 15)+" damage. May knock the opponent down with a low chance"
	
func _doAttack(_attacker, _receiver, _context = {}):
	var attackerName = _attacker.getName()
	var receiverName = _receiver.getName()
	
	if(checkMissed(_attacker, _receiver, DamageType.Physical)):
		return attackerName + " tries to kick " + receiverName + " but misses"
	
	if(checkDodged(_attacker, _receiver, DamageType.Physical)):
		return attackerName + " tries to kick " + receiverName + " but " + receiverName + " dodges the attack"
	
	var damage = doDamage(_attacker, _receiver, DamageType.Physical, RNG.randi_range(10, 15))
	#_receiver.addEffect(StatusEffect.Bleeding)

	var texts = [
		attackerName + " kicks " + receiverName + ". "
	]
	var text = RNG.pick(texts)
	
	text += receiverDamageMessage(DamageType.Physical, damage)
	
	if(RNG.chance(20) && !_receiver.hasEffect(StatusEffect.Collapsed)):
		text += "\n[b]"+receiverName+" loses "+_receiver.hisHer()+" balance and collapses onto the floor[/b]"
		_receiver.addEffect(StatusEffect.Collapsed)
	
	return text
	
func _canUse(_attacker, _receiver, _context = {}):
	return true

func getRequirements():
	return [["freelegs"]]

func getAnticipationText(_attacker, _receiver):
	return _attacker.getName() + " lunges forward and tries to kick you"

func getAttackSoloAnimation():
	return "kick"

func getExperience():
	return [[Skill.Combat, 10]]
