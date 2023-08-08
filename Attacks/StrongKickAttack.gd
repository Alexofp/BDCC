extends Attack

func _init():
	id = "strongkickattack"
	category = Category.Special
	aiCategory = AICategory.Offensive
	
func getVisibleName(_context = {}):
	return "Strong kick"
	
func getVisibleDesc(_context = {}):
	return "Sacrifice 25 stamina to do a very powerful kick doing "+scaledDmgStr(DamageType.Physical, 20)+" damage and knocking the opponent"
	
func _doAttack(_attacker, _receiver, _context = {}):
	var attackerName = _attacker.getName()
	var receiverName = _receiver.getName()
	
	var text = attackerName + " uses "+_attacker.hisHer()+" full strength to kick " + receiverName + ". "
	
	if(!_receiver.hasEffect(StatusEffect.Collapsed)):
		if(_receiver.addEffect(StatusEffect.Collapsed)):
			text += "\n[b]"+receiverName+" loses "+_receiver.hisHer()+" balance and collapses onto the floor[/b]"
		
	
	return {
		text = text,
		pain = RNG.randi_range(20, 20),
	}
	
func _canUse(_attacker, _receiver, _context = {}):
	return true

func getRequirements():
	return [[AttackRequirement.Stamina, 25], AttackRequirement.FreeLegs]

func getAttackSoloAnimation():
	return "kick"

func getExperience():
	return [[Skill.Combat, 20]]
