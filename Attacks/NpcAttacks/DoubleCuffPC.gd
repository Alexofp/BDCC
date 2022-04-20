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
	
func _doAttack(_attacker, _receiver):
	if(checkMissed(_attacker, _receiver, DamageType.Physical)):
		return genericMissMessage(_attacker, _receiver)
	
	if(checkDodged(_attacker, _receiver, DamageType.Physical)):
		return genericDodgeMessage(_attacker, _receiver)
	
	_receiver.getInventory().forceEquipStoreOther(GlobalRegistry.createItem("inmatewristcuffs"))
	_receiver.getInventory().forceEquipStoreOther(GlobalRegistry.createItem("inmateanklecuffs"))
	_receiver.addEffect(StatusEffect.Collapsed)
	
	return "{attacker.name} manages to bring you down to the floor. Then {attacker.he} pulls two sets of cuffs and [b]restraints your arms and legs[/b]! You manage to shake {attacker.him} off but you are still on the floor."
	
func _canUse(_attacker, _receiver):
	return _receiver.isPlayer() && !_receiver.hasBoundArms() && !_receiver.hasBoundLegs()

func getAnticipationText(_attacker, _receiver):
	return "{attacker.name} grabs you by the collar and tries to pin you to the ground!\n\n[say=attacker]"+RNG.pick([
		"Use of restraining force is authorized.",
		"This will go great together with that collar.",
		"Give up and you might even get to enjoy it.",
		"Ready to be pacified?",
	])+"[/say]"
