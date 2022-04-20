extends Attack

func _init():
	id = "stunbatonAttack"
	category = Category.Physical
	aiCategory = AICategory.Offensive
	
func getVisibleName():
	return "Use the stunbaton"
	
func getVisibleDesc():
	return "You shouldn't see this"
	
func _doAttack(_attacker, _receiver):
	var attackerName = _attacker.getName()
	var receiverName = _receiver.getName()
	
	if(checkMissed(_attacker, _receiver, DamageType.Physical)):
		return attackerName + " swings "+_attacker.hisHer()+" stunbaton but misses"
	
	if(checkDodged(_attacker, _receiver, DamageType.Physical)):
		return attackerName + " swings "+_attacker.hisHer()+" stunbaton but " + receiverName + " dodges the attack at the last second"
	
	var _damage = doDamage(_attacker, _receiver, DamageType.Physical, RNG.randi_range(20, 40))
	#_receiver.addEffect(StatusEffect.Bleeding)

	var texts = [
		"{attacker.name} lands a strike on {receiver.name} with a stun baton, sending a painful shock through {receiver.his} body",
		"{attacker.name}’s stun baton hits {receiver.name} causing a huge spike of pain.",
		"{attacker.name} lands {attacker.his} attack, sending an electric shock through {receiver.name}’s body.",
	]
	var text = RNG.pick(texts)
	
	text += " " + receiverDamageMessage(DamageType.Physical, _damage)
	
	return text
	
func _canUse(_attacker, _receiver):
	return true

func getAnticipationText(_attacker, _receiver):
	return RNG.pick([
		"{attacker.name} increases the grip on {attacker.his} stun baton and lunges forward, weapon first.",
		"{attacker.name} swings {attacker.his} stun baton at {receiver.name}, aiming for {receiver.his} exposed areas where it would have the most effect.",
		"{attacker.name}’s stun baton makes sparks as {attacker.he} prepares to strike {receiver.name}.",
	])
