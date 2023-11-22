extends Attack

func _init():
	id = "DoubleCuffPC"
	category = Category.Physical
	aiCategory = AICategory.Defensive
	aiScoreMultiplier = 0.2
	
func getVisibleName(_context = {}):
	return "Cuffs hands and legs"
	
func getVisibleDesc(_context = {}):
	return "Shouldn't see this"
	
func _doAttack(_attacker, _receiver, _context = {}):
	if(checkMissed(_attacker, _receiver, DamageType.Physical)):
		return genericMissMessage(_attacker, _receiver)
	
	if(checkDodged(_attacker, _receiver, DamageType.Physical)):
		return genericDodgeMessage(_attacker, _receiver)
	
	_receiver.getInventory().forceEquipByStoreOtherUnlessRestraint(GlobalRegistry.createItem("inmatewristcuffs"), _attacker)
	_receiver.getInventory().forceEquipByStoreOtherUnlessRestraint(GlobalRegistry.createItem("inmateanklecuffs"), _attacker)
	_receiver.addEffect(StatusEffect.Collapsed)
	
	var text = "{attacker.name} manages to bring you down to the floor. Then {attacker.he} pulls two sets of cuffs and [b]restraints your arms and legs[/b]! You manage to shake {attacker.him} off but you are still on the floor."
	return {
		text = text
	}
	
func _canUse(_attacker, _receiver, _context = {}):
	return _receiver.isPlayer() && !_receiver.hasBoundArms() && !_receiver.hasBoundLegs()

func getAnticipationText(_attacker, _receiver):
	return "{attacker.name} grabs you by the collar and tries to pin you to the ground!\n\n[say=attacker]"+RNG.pick([
		"Use of restraining force is authorized.",
		"This will go great together with that collar.",
		"Give up and you might even get to enjoy it.",
		"Ready to be pacified?",
	])+"[/say]"

func getRequirements():
	return [AttackRequirement.FreeArms, AttackRequirement.FreeHands]
