extends Attack

func _init():
	id = "PunchPCAttack"
	category = Category.Physical
	aiCategory = AICategory.Offensive
	isPlayerAttack = true
	attackPriority = 30

func canScratch(_pc) -> bool:
	if(_pc.hasPerk(Perk.CombatScratching) && !_pc.hasBlockedHands()):
		return true
	return false

func getVisibleName(_context = {}):
	if(GM.pc != null && is_instance_valid(GM.pc) && canScratch(GM.pc)):
		return "Scratch"
	return "Punch"
	
func getVisibleDesc(_context = {}):
	return "You do a combo of 2 punches, each one dealing "+scaledDmgRangeStr(DamageType.Physical, 5, 10)+" damage"
	
func _doAttack(_attacker, _receiver, _context = {}):
	if(checkMissed(_attacker, _receiver, DamageType.Physical)):
		return genericMissMessage(_attacker, _receiver)
	
	if(checkDodged(_attacker, _receiver, DamageType.Physical)):
		return genericDodgeMessage(_attacker, _receiver)

	var texts = [
		"{attacker.name} manages to land a few "+("strong punches" if !canScratch(_attacker) else "good scratches")+" on {receiver.name}",
	]
	var text = RNG.pick(texts)
	
	if(RNG.chance(50)):
		if(canScratch(_attacker) && _receiver.addEffect(StatusEffect.Bleeding)):
			text += "Sharp claws caused {receiver.him} to start [color=red]bleeding[/color]."
		
	return {
		text = text,
		pain = RNG.randi_range(5,10) + RNG.randi_range(5,10),
	}
	
func _canUse(_attacker, _receiver, _context = {}):
	return true

func getRequirements():
	return [AttackRequirement.FreeArms]

func getAttackSoloAnimation():
	return "punch"

func getExperience():
	return [[Skill.Combat, 10]]

func getAnticipationText(_attacker, _receiver):
	return "{attacker.name} is about to punch {receiver.name}!"

func getAttackerDamageMultiplierEfficiency(_attacker, _receiver, _damageType) -> float:
	return 2.0
