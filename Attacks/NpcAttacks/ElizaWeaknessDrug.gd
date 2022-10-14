extends Attack

func _init():
	id = "ElizaWeaknessDrug"
	category = Category.Special
	aiCategory = AICategory.Defensive
	
func getVisibleName(_context = {}):
	return "Weakness drug"
	
func getVisibleDesc(_context = {}):
	return "Shouldn't see this"
	
func _doAttack(_attacker, _receiver, _context = {}):
	if(checkMissed(_attacker, _receiver, DamageType.Stamina)):
		return genericMissMessage(_attacker, _receiver)
	
	if(checkDodged(_attacker, _receiver, DamageType.Stamina)):
		return genericDodgeMessage(_attacker, _receiver)
	
	var text = "{attacker.name} manages to stick a syringe into your neck! Your muscles refuse to tense up, you suddenly feel very weak!"
	_receiver.addEffect(StatusEffect.Weakness)
	return {
		text = text,
		stamina = 10,
	}
	
func _canUse(_attacker, _receiver, _context = {}):
	return true

func getAnticipationText(_attacker, _receiver):
	return "{attacker.name} grabs a syringe with a cyan-colored drug inside off {attacker.his} belt and pounces at you."

func getRequirements():
	return [AttackRequirement.FreeArms, AttackRequirement.FreeHands]

