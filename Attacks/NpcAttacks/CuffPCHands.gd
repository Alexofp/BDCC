extends Attack

func _init():
	id = "CuffPCHands"
	category = Category.Physical
	aiCategory = AICategory.Defensive
	aiScoreMultiplier = 0.3
	
func getVisibleName():
	return "Cuffs hands"
	
func getVisibleDesc():
	return "Shouldn't see this"
	
func _doAttack(_attacker, _reciever):
	if(checkMissed(_attacker, _reciever, DamageType.Physical)):
		return genericMissMessage(_attacker, _reciever)
	
	if(checkDodged(_attacker, _reciever, DamageType.Physical)):
		return genericDodgeMessage(_attacker, _reciever)
	
	_reciever.getInventory().forceEquipStoreOther(GlobalRegistry.createItem("inmatewristcuffs"))
	
	return "{attacker.name} pins you against a wall, then [b]wrenches your arms behind your back and cuffs them[/b]! You manage to break free.\n\n[say=attacker]"+RNG.pick([
		"Cease resisting.",
		"Now what are you gonna do?",
		"Give up, this is your last warning.",
		"Slowly, get on your knees.",
		"That's it.",
		"Surrender, bitch.",
		"Now hit the ground.",
	])+"[/say]"
	
func _canUse(_attacker, _reciever):
	return _reciever.isPlayer() && !_reciever.hasBoundArms()

func getAnticipationText(_attacker, _reciever):
	return "{attacker.name} rushes towards you and tries to apprehend you, cuffs in {attacker.his} hands!"
