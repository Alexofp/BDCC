extends Attack

func _init():
	id = "ForceRingGagPC"
	category = Category.Physical
	aiCategory = AICategory.Defensive
	aiScoreMultiplier = 0.4
	
func getVisibleName():
	return "Force ringgag"
	
func getVisibleDesc():
	return "Shouldn't see this"
	
func _doAttack(_attacker, _reciever):
	if(checkMissed(_attacker, _reciever, DamageType.Physical)):
		return genericMissMessage(_attacker, _reciever)
	
	if(checkDodged(_attacker, _reciever, DamageType.Physical)):
		return genericDodgeMessage(_attacker, _reciever)
	
	_reciever.getInventory().forceEquipStoreOther(GlobalRegistry.createItem("ringgag"))
	
	return "{attacker.name} pounces at you and manages to [b]force a ring gag into your mouth[/b]! You manage to shove {attacker.him} back.\n\n[say=attacker]"+RNG.pick([
		"Much better.",
		"Bite this.",
		"Behave, inmate.",
		"What's wrong, cat got your tongue?",
	])+"[/say]"
	
func _canUse(_attacker, _reciever):
	return _reciever.isPlayer() && !_reciever.isGagged()

func getAnticipationText(_attacker, _reciever):
	return "{attacker.name} takes a step back and produces a ring gag out of one of {attacker.his} pockets. {attacker.name} plays with it in {attacker.his} hands.\n\n[say=attacker]"+RNG.pick([
		"You have the right to remain gagged.",
		"I bet you’re already drooling.",
		"C’mon, we both know you want this.",
		"Time to silence the opposition.",
	])+"[/say]"
