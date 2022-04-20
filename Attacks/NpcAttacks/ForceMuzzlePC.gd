extends Attack

func _init():
	id = "ForceMuzzlePC"
	category = Category.Physical
	aiCategory = AICategory.Defensive
	aiScoreMultiplier = 0.4
	
func getVisibleName():
	return "Force muzzle"
	
func getVisibleDesc():
	return "Shouldn't see this"
	
func _doAttack(_attacker, _receiver):
	if(checkMissed(_attacker, _receiver, DamageType.Physical)):
		return genericMissMessage(_attacker, _receiver)
	
	if(checkDodged(_attacker, _receiver, DamageType.Physical)):
		return genericDodgeMessage(_attacker, _receiver)
	
	_receiver.getInventory().forceEquipStoreOther(GlobalRegistry.createItem("basketmuzzle"))
	
	return "{attacker.name} pounces at you and manages to [b]muzzle you[/b]! You shove {attacker.him} back.\n\n[say=attacker]"+RNG.pick([
		"Much better.",
		"Bite this.",
		"Behave, inmate.",
		"What's wrong, cat got your tongue?",
	])+"[/say]"
	
func _canUse(_attacker, _receiver):
	return _receiver.isPlayer() && !_receiver.isGagged()

func getAnticipationText(_attacker, _receiver):
	return "{attacker.name} takes a step back and produces a wire basket muzzle out of one of {attacker.his} pockets. {attacker.name} plays with it in {attacker.his} hands.\n\n[say=attacker]"+RNG.pick([
		"You have the right to remain gagged.",
		"I bet you’re already drooling.",
		"C’mon, we both know you want this.",
		"Time to silence the opposition.",
	])+"[/say]"
