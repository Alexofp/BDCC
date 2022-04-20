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
	
func _doAttack(_attacker, _receiver):
	if(checkMissed(_attacker, _receiver, DamageType.Lust)):
		return genericMissMessage(_attacker, _receiver)
	
	if(checkDodged(_attacker, _receiver, DamageType.Lust)):
		return "{receiver.name} managed to avoid the pink smoke cloud!"
	
	var text = "You breathe in the pink mist and feel hornier, many dirty thoughts pass through your head. Maybe surrendering isn’t such a bad idea.."
	var _damage = doDamage(_attacker, _receiver, DamageType.Lust, 30)
	text += " " + receiverDamageMessage(DamageType.Lust, _damage)
	return text
	
func _canUse(_attacker, _receiver):
	return true

func getAnticipationText(_attacker, _receiver):
	return "{attacker.name} pulls out some kind of grenade and pulls the pin. Then {attacker.he} throws it in your direction. You see a [b]pink smoke[/b] trail following it in the air!"
