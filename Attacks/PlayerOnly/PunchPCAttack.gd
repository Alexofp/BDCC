extends Attack

func _init():
	id = "PunchPCAttack"
	category = Category.Physical
	aiCategory = AICategory.Offensive
	
func getVisibleName():
	if(GM.pc.hasPerk(Perk.CombatScratching)):
		return "Scratch"
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
	
	if(RNG.chance(50)):
		if(_attacker.getSkillsHolder().hasPerk(Perk.CombatScratching)):
			_receiver.addEffect(StatusEffect.Bleeding)
			text += "Sharp claws caused "+_receiver.himHer() + " to start [color=red]bleeding[/color]. "
		
	text += receiverDamageMessage(DamageType.Physical, damage)
	
	return text
	
func _canUse(_attacker, _receiver):
	return true

func getRequirements():
	return [["freearms"]]

func getAttackAnimation():
	return TheStage.Punch

func getAttackSoloAnimation():
	return "punch"

func getExperience():
	return [[Skill.Combat, 10]]
