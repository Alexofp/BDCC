extends Attack

func _init():
	id = "stunbatonAttack"
	category = Category.Physical
	aiCategory = AICategory.Offensive
	
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
		"{attacker.name} lands a strike on {receiver.name} with a stun baton, sending a painful shock through {receiver.his} body",
		"{attacker.name}’s stun baton hits {receiver.name} causing a huge spike of pain.",
		"{attacker.name} lands {attacker.his} attack, sending an electric shock through {receiver.name}’s body.",
	]
	var text = RNG.pick(texts)
	
	return {
		text = text,
		pain = RNG.randi_range(20, 40),
	}
	
func _canUse(_attacker, _receiver, _context = {}):
	return true

func getAnticipationText(_attacker, _receiver):
	return RNG.pick([
		"{attacker.name} increases the grip on {attacker.his} stun baton and lunges forward, weapon first.",
		"{attacker.name} swings {attacker.his} stun baton at {receiver.name}, aiming for {receiver.his} exposed areas where it would have the most effect.",
		"{attacker.name}’s stun baton makes sparks as {attacker.he} prepares to strike {receiver.name}.",
	])

func getRequirements():
	return [AttackRequirement.FreeArms, AttackRequirement.FreeHands]

func getAttackSoloAnimation():
	return "stunbaton"
