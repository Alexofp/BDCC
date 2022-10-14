extends Attack

func _init():
	id = "StrongBite"
	category = Category.Physical
	aiCategory = AICategory.Offensive
	
func getVisibleName(_context = {}):
	return "Strong bite"
	
func getVisibleDesc(_context = {}):
	return "Shouldn't see this"
	
func _doAttack(_attacker, _receiver, _context = {}):
	if(checkMissed(_attacker, _receiver, DamageType.Physical)):
		return genericMissMessage(_attacker, _receiver)
	
	if(checkDodged(_attacker, _receiver, DamageType.Physical)):
		return genericDodgeMessage(_attacker, _receiver)
	
	var text = "{attacker.name} manages to bite {receiver.name}, making them [color=red]bleed[/color]!"
	_receiver.addEffect(StatusEffect.Bleeding)
	
	return {
		text = text,
		pain = RNG.randi_range(50, 60),
	}
	
func _canUse(_attacker, _receiver, _context = {}):
	return true

func getAnticipationText(_attacker, _receiver):
	return "{attacker.name} lunges forward at {receiver.name}, trying to sink {attacker.his} sharp fangs into {receiver.him}!"

func getRecieverArmorScaling(_attacker, _receiver, _damageType) -> float:
	if(_attacker.hasPerk(Perk.SexBiter)):
		return 4.0
	
	return 10.0

func getAttackSoloAnimation():
	return "bite"

func getRequirements():
	return [AttackRequirement.CanBite]
