extends Attack

func _init():
	id = "ShivAttack"
	category = Category.Physical
	aiCategory = AICategory.Offensive
	
func getVisibleName(_context = {}):
	return "Shiv"
	
func getVisibleDesc(_context = {}):
	return "Shouldn't see this"
	
func _doAttack(_attacker, _receiver, _context = {}):
	if(checkMissed(_attacker, _receiver, DamageType.Physical)):
		return genericMissMessage(_attacker, _receiver)
	
	if(checkDodged(_attacker, _receiver, DamageType.Physical)):
		return genericDodgeMessage(_attacker, _receiver)
	
	var text = "{attacker.name} manages to leave a few cuts on {receiver.name}, causing {receiver.him} to [color=red]bleed[/color]!"
	var _damage = doDamage(_attacker, _receiver, DamageType.Physical, RNG.randi_range(20, 30))
	text += " " + receiverDamageMessage(DamageType.Physical, _damage)
	
	_receiver.addEffect(StatusEffect.Bleeding)
	return text
	
func _canUse(_attacker, _receiver, _context = {}):
	return true

func getAnticipationText(_attacker, _receiver):
	return "{attacker.name} dashes towards {receiver.name} and tries to cut {receiver.him} with {attacker.his} shiv!"
