extends Attack

func _init():
	id = "CapTacticalStrike"
	category = Category.Physical
	aiCategory = AICategory.Defensive
	aiScoreMultiplier = 0.6
	
func getVisibleName(_context = {}):
	return "Tactical Strike"
	
func getVisibleDesc(_context = {}):
	return "Shouldn't see this"
	
func _doAttack(_attacker, _receiver, _context = {}):
	if(checkMissed(_attacker, _receiver, DamageType.Physical)):
		return genericMissMessage(_attacker, _receiver)
	
	if(checkDodged(_attacker, _receiver, DamageType.Physical)):
		return genericDodgeMessage(_attacker, _receiver)
	
	var text = "{attacker.name} lunges forward, delivering a powerful blow to {receiver.name}, inflicting significant pain."
	if(!_receiver.hasEffect(StatusEffect.Stunned)):
		if(_receiver.addEffect(StatusEffect.Stunned)):
			text += " The sudden attack [b]stunned[/b] {receiver.name}."
			text += "\n\n"
			text += "[say=attacker]"+RNG.pick(["Why are you still fighting?", "And this isn't even a punishment yet.", "Submit. Now."])+"[/say]"
	
	return {
		text = text,
		pain = RNG.randi_range(10, 20),
	}
	
func _canUse(_attacker, _receiver, _context = {}):
	return true

func getAnticipationText(_attacker, _receiver):
	return "{attacker.name} prepares to strike {receiver.name} with the handle of {attacker.his} weapon!"
	
func getAttackSoloAnimation():
	return "holdpistol"

func getRequirements():
	return [AttackRequirement.FreeArms, AttackRequirement.FreeHands]

#func getRecieverArmorScaling(_attacker, _receiver, _damageType) -> float:
#	return 0.1
