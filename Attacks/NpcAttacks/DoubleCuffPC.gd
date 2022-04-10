extends Attack

func _init():
	id = "DoubleCuffPC"
	category = Category.Physical
	aiCategory = AICategory.Defensive
	aiScoreMultiplier = 0.2
	
func getVisibleName():
	return "Cuffs hands and legs"
	
func getVisibleDesc():
	return "Shouldn't see this"
	
func _doAttack(_attacker, _reciever):
	if(checkMissed(_attacker, _reciever, DamageType.Physical)):
		return genericMissMessage(_attacker, _reciever)
	
	if(checkDodged(_attacker, _reciever, DamageType.Physical)):
		return genericDodgeMessage(_attacker, _reciever)
	
	_reciever.getInventory().forceEquipStoreOther(GlobalRegistry.createItem("inmatewristcuffs"))
	_reciever.getInventory().forceEquipStoreOther(GlobalRegistry.createItem("inmateanklecuffs"))
	_reciever.addEffect(StatusEffect.Collapsed)
	
	return "{attacker.name} manages to bring you down to the floor. Then {attacker.he} pulls two sets of cuffs and [b]restraints your arms and legs[/b]! You manage to shake {attacker.him} off but you are still on the floor."
	
func _canUse(_attacker, _reciever):
	return _reciever.isPlayer() && !_reciever.hasBoundArms() && !_reciever.hasBoundLegs()

func getAnticipationText(_attacker, _reciever):
	return "{attacker.name} grabs you by the collar and tries to pin you to the ground!\n\n[say=attacker]"+RNG.pick([
		"Use of restraining force is authorized.",
		"This will go great together with that collar.",
		"Give up and you might even get to enjoy it.",
		"Ready to be pacified?",
	])+"[/say]"
