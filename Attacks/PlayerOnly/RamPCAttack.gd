extends Attack

func _init():
	id = "RamPCAttack"
	category = Category.Special
	aiCategory = AICategory.Offensive
	
func getVisibleName(_context = {}):
	return "Ram"
	
func getVisibleDesc(_context = {}):
	return "Ram them for "+scaledDmgRangeStr(DamageType.Physical, 10, 15)+" damage. Uses 50 stamina\n\nWill knock the opponent down and stun them for 2 turns.\n\nGood against armored opponents"
	
func _doAttack(_attacker, _receiver, _context = {}):
	if(checkMissed(_attacker, _receiver, DamageType.Physical)):
		return genericMissMessage(_attacker, _receiver, "ram")
	
	if(checkDodged(_attacker, _receiver, DamageType.Physical)):
		return genericDodgeMessage(_attacker, _receiver, "ram")
	
	var texts = [
		"{attacker.name} rams {receiver.name}."
	]
	var text = RNG.pick(texts)
	
	if(_receiver.addEffect(StatusEffect.Collapsed)):
		text += "\n[b]{receiver.name} loses {receiver.his} balance and collapses onto the floor[/b]."
		
	if(_receiver.addEffect(StatusEffect.Stunned, [2])):
		text += "\n[b]{receiver.name} is stunned![/b]"
	
	return {
		text = text,
		pain = RNG.randi_range(10, 15),
	}
	
func _canUse(_attacker, _receiver, _context = {}):
	return true

func getRequirements():
	return [[AttackRequirement.Stamina, 50]]

func getAnticipationText(_attacker, _receiver):
	return "{attacker.name} lunges forward and tries to kick you"

func getAttackSoloAnimation():
	return "shove"

func getExperience():
	return [[Skill.Combat, 10]]

func getRecieverArmorScaling(_attacker, _receiver, _damageType) -> float:
	return 0.0
