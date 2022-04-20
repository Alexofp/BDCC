extends Attack

func _init():
	id = "stunbatonOverchargeAttack"
	category = Category.Physical
	aiCategory = AICategory.Offensive
	aiScoreMultiplier = 0.5
	
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
	
	var _damage = doDamage(_attacker, _receiver, DamageType.Physical, RNG.randi_range(40, 60))
	var _damageStamina = doDamage(_attacker, _receiver, DamageType.Stamina, RNG.randi_range(10, 20))
	#_receiver.addEffect(StatusEffect.Bleeding)

	var texts = [
		"{attacker.name}’s overcharged weapon manages to hit {receiver.name}. The strike itself wasn’t that strong but the electrical shock that came after was incredibly strong and painful, causing {receiver.name}’s muscles to tense uncontrollably.",
	]
	var text = RNG.pick(texts)
	
	text += " " + receiverDamageMessageList([[DamageType.Physical, _damage], [DamageType.Stamina, _damageStamina]])

	if(!_receiver.hasEffect(StatusEffect.Collapsed)):
		text += "\n{receiver.name} couldn’t withstand the attack and [b]dropped to the floor[/b]!"
		_receiver.addEffect(StatusEffect.Collapsed)
	
	
	return text
	
func _canUse(_attacker, _receiver):
	return true

func getRequirements():
	return [["stamina", 25]]

func getAnticipationText(_attacker, _receiver):
	return RNG.pick([
		"{attacker.name} overcharges {attacker.his} stun baton, you see it spawning a great amount of sparks and making a buzzy noise. {attacker.name} then lunges at {receiver.name}. This one will hurt a lot.",
	])
