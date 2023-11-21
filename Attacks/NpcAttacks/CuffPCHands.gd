extends Attack

func _init():
	id = "CuffPCHands"
	category = Category.Physical
	aiCategory = AICategory.Defensive
	aiScoreMultiplier = 0.3
	
func getVisibleName(_context = {}):
	return "Cuffs hands"
	
func getVisibleDesc(_context = {}):
	return "Shouldn't see this"
	
func _doAttack(_attacker, _receiver, _context = {}):
	if(checkMissed(_attacker, _receiver, DamageType.Physical)):
		return genericMissMessage(_attacker, _receiver)
	
	if(checkDodged(_attacker, _receiver, DamageType.Physical)):
		return genericDodgeMessage(_attacker, _receiver)
	
	_receiver.getInventory().forceEquipByStoreOtherUnlessRestraint(GlobalRegistry.createItem("inmatewristcuffs"), _attacker)
	
	var text = "{attacker.name} pins you against a wall, then [b]wrenches your arms behind your back and cuffs them[/b]! You manage to break free.\n\n[say=attacker]"+RNG.pick([
		"Cease resisting.",
		"Now what are you gonna do?",
		"Give up, this is your last warning.",
		"Slowly, get on your knees.",
		"That's it.",
		"Surrender, bitch.",
		"Now hit the ground.",
	])+"[/say]"
	return {
		text = text
	}
	
func _canUse(_attacker, _receiver, _context = {}):
	return _receiver.isPlayer() && !_receiver.hasBoundArms()

func getAnticipationText(_attacker, _receiver):
	return "{attacker.name} rushes towards you and tries to apprehend you, cuffs in {attacker.his} hands!"

func getRequirements():
	return [AttackRequirement.FreeArms, AttackRequirement.FreeHands]
