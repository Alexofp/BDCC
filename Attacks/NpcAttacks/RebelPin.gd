extends Attack

func _init():
	id = "RebelPin"
	category = Category.Physical
	aiCategory = AICategory.Offensive
	aiScoreMultiplier = 1.5
	
func getVisibleName(_context = {}):
	return "Rebel pin"
	
func getVisibleDesc(_context = {}):
	return "Shouldn't see this"
	
func _doAttack(_attacker, _receiver, _context = {}):
	if(checkMissed(_attacker, _receiver, DamageType.Physical)):
		return genericMissMessage(_attacker, _receiver)
	
	if(checkDodged(_attacker, _receiver, DamageType.Physical)):
		return genericDodgeMessage(_attacker, _receiver)
	
	var text = "{attacker.name} manages to pin {receiver.name} to the floor with {attacker.his} powerful thighs before landing a few powerful hits!"
	text += "\n\n"
	text += RNG.pick([
		"[say=attacker]Pathetic.[/say]",
		"[say=attacker]Beating you up is so easy.[/say]",
		"[say=attacker]Had enough yet?[/say]",
	])
	text += "\n\nOw!"
	
	return {
		text = text,
		pain = RNG.randi_range(80, 100),
	}
	
func _canUse(_attacker, _receiver, _context = {}):
	if(!_receiver.hasEffect(StatusEffect.Collapsed)):
		return false
	
	return true

func getAnticipationText(_attacker, _receiver):
	return "{attacker.name} tries to pin {receiver.name} in place, this one will hurt!"

func getRequirements():
	return [AttackRequirement.FreeLegs]
