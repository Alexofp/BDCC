extends Attack

func _init():
	id = "stunbatonOverchargeAttack"
	category = Category.Physical
	aiCategory = AICategory.Offensive
	aiScoreMultiplier = 0.5
	
func getVisibleName(_context = {}):
	return "Use the stunbaton"
	
func getVisibleDesc(_context = {}):
	return "You shouldn't see this"
	
func _doAttack(_attacker, _receiver, _context = {}):
	if(checkMissed(_attacker, _receiver, DamageType.Physical)):
		return genericMissMessage(_attacker, _receiver)
	
	if(checkDodged(_attacker, _receiver, DamageType.Physical)):
		return genericDodgeMessage(_attacker, _receiver)
		
	var texts = [
		"{attacker.name}’s overcharged weapon manages to hit {receiver.name}. The strike itself wasn’t that strong but the electrical shock that came after was incredibly strong and painful, causing {receiver.name}’s muscles to tense uncontrollably.",
	]
	var text = RNG.pick(texts)
	
	if(!_receiver.hasEffect(StatusEffect.Collapsed) && _receiver.addEffect(StatusEffect.Collapsed)):
		text += "\n{receiver.name} couldn’t withstand the attack and [b]dropped to the floor[/b]!"
	
	return {
		text = text,
		pain = RNG.randi_range(40, 60),
		stamina = RNG.randi_range(10, 20),
	}
	
func _canUse(_attacker, _receiver, _context = {}):
	return true

func getAnticipationText(_attacker, _receiver):
	return RNG.pick([
		"{attacker.name} overcharges {attacker.his} stun baton, you see it spawning a great amount of sparks and making a buzzy noise. {attacker.name} then lunges at {receiver.name}. This one will hurt a lot.",
	])

func getRequirements():
	return [[AttackRequirement.Stamina, 25], AttackRequirement.FreeArms, AttackRequirement.FreeHands]

func getAttackSoloAnimation():
	return "stunbaton"
