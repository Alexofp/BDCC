extends Attack

func _init():
	id = "SentinelLatexSlam"
	category = Category.Physical
	aiCategory = AICategory.Offensive
	
func getVisibleName(_context = {}):
	return "Latex Slam"
	
func getVisibleDesc(_context = {}):
	return "Shouldn't see this"
	
func _doAttack(_attacker, _receiver, _context = {}):
	if(checkMissed(_attacker, _receiver, DamageType.Physical)):
		return genericMissMessage(_attacker, _receiver)
	
	if(checkDodged(_attacker, _receiver, DamageType.Physical)):
		return genericDodgeMessage(_attacker, _receiver)
	
	var text = "With a thunderous impact, {attacker.name} slams {attacker.his} adhesive-coated leg into {receiver.name}, causing intense pain."
	return {
		text = text,
		pain = 40,
	}
	
func _canUse(_attacker, _receiver, _context = {}):
	return true

func getAnticipationText(_attacker, _receiver):
	var text = " {attacker.name} gathers strength, preparing to unleash a powerful blow. This one will ignore your armor completely!"

	return text

func getRequirements():
	return [AttackRequirement.FreeLegs]
	

func getAttackSoloAnimation():
	return "kick"

func getRecieverArmorScaling(_attacker, _receiver, _damageType) -> float:
	return 0.0
