extends Attack

func _init():
	id = "RebelThrow"
	category = Category.Physical
	aiCategory = AICategory.Offensive
	
func getVisibleName(_context = {}):
	return "Rebel throw"
	
func getVisibleDesc(_context = {}):
	return "Shouldn't see this"
	
func _doAttack(_attacker, _receiver, _context = {}):
	if(checkMissed(_attacker, _receiver, DamageType.Physical)):
		return genericMissMessage(_attacker, _receiver)
	
	if(checkDodged(_attacker, _receiver, DamageType.Physical)):
		return genericDodgeMessage(_attacker, _receiver)
	
	var text = "{attacker.name} manages to get a good grasp on {receiver.name} and then picks them off the floor before throwing them a few meters back!"
	text += "\n\n"
	text += RNG.pick([
		"[say=attacker]And don’t get up.[/say]",
		"[say=attacker]And stay like that.[/say]",
		"[say=attacker]Who said you can stand.[/say]",
	])
	text += "\n\n"
	
	_receiver.addEffect(StatusEffect.Collapsed)
	return {
		text = text,
		pain = RNG.randi_range(20, 20),
	}
	
func _canUse(_attacker, _receiver, _context = {}):
	if(_receiver.hasEffect(StatusEffect.Collapsed)):
		return false
	
	return true

func getAnticipationText(_attacker, _receiver):
	return "{attacker.name} tries to grab {receiver.name}!"

func getRequirements():
	return [AttackRequirement.FreeArms, AttackRequirement.FreeHands]
