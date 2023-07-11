extends Attack

func _init():
	id = "CapDisablingShot"
	category = Category.Physical
	aiCategory = AICategory.Offensive
	aiScoreMultiplier = 0.6
	
func getVisibleName(_context = {}):
	return "Disabling shot"
	
func getVisibleDesc(_context = {}):
	return "Shouldn't see this"
	
func _doAttack(_attacker, _receiver, _context = {}):
	if(checkMissed(_attacker, _receiver, DamageType.Physical)):
		return genericMissMessage(_attacker, _receiver)
	
	if(checkDodged(_attacker, _receiver, DamageType.Physical)):
		return genericDodgeMessage(_attacker, _receiver)
	
	var text = "{attacker.name} fires a disabling shot, hitting {receiver.name}'s legs and causing excruciating pain."
	if(!_receiver.hasEffect(StatusEffect.Collapsed)):
		if(_receiver.addEffect(StatusEffect.Collapsed)):
			text += " {receiver.name} [b]collapses[/b] after the attack."
			text += "\n\n"
			text += "[say=attacker]"+RNG.pick(["Watch your legs, inmate.", "And stay down.", "That's where you belong, below me."])+"[/say]"
	
	return {
		text = text,
		pain = RNG.randi_range(30, 50),
	}
	
func _canUse(_attacker, _receiver, _context = {}):
	return true

func getAnticipationText(_attacker, _receiver):
	return "{attacker.name} lines up a shot, aiming for {receiver.name}'s legs."
	
func getAttackSoloAnimation():
	return "firepistol"

func getRequirements():
	return [AttackRequirement.FreeArms, AttackRequirement.FreeHands]

func getRecieverArmorScaling(_attacker, _receiver, _damageType) -> float:
	return 0.3
