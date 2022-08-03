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
	var _damage = doDamage(_attacker, _receiver, DamageType.Physical, RNG.randi_range(50, 60))
	text += " " + receiverDamageMessage(DamageType.Physical, _damage)
	
	_receiver.addEffect(StatusEffect.Bleeding)
	return text
	
func _canUse(_attacker, _receiver, _context = {}):
	return true

func getAnticipationText(_attacker, _receiver):
	return "{attacker.name} lunges forward at {receiver.name}, trying to sink {attacker.his} sharp fangs into {receiver.him}!"

func getRecieverArmorScaling(_damageType) -> float:
	if(GM.pc.hasPerk(Perk.SexBiter)):
		return 4.0
	
	return 10.0
