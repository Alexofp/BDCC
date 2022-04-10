extends Attack

func _init():
	id = "HeatGrenade"
	category = Category.Lust
	aiCategory = AICategory.Lust
	aiScoreMultiplier = 0.8
	
func getVisibleName():
	return "Heat grenade"
	
func getVisibleDesc():
	return "Shouldn't see this"
	
func _doAttack(_attacker, _reciever):
	if(checkMissed(_attacker, _reciever, DamageType.Lust)):
		return genericMissMessage(_attacker, _reciever)
	
	if(checkDodged(_attacker, _reciever, DamageType.Lust)):
		return "{receiver.name} managed to avoid the pink smoke cloud!"
	
	var text = "You breathe in the pink mist and feel hornier, many dirty thoughts pass through your head. Maybe surrendering isn’t such a bad idea.."
	var _damage = doDamage(_attacker, _reciever, DamageType.Lust, RNG.randi_range(10, 40))
	text += " " + recieverDamageMessage(DamageType.Lust, _damage)
	return text
	
func _canUse(_attacker, _reciever):
	return true

func getAnticipationText(_attacker, _reciever):
	return "{attacker.name} pulls out some kind of grenade and pulls the pin. Then {attacker.he} throws it in your direction. You see a [b]pink smoke[/b] trail following it in the air!"
