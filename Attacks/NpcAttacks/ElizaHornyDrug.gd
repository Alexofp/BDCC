extends Attack

func _init():
	id = "ElizaHornyDrug"
	category = Category.Lust
	aiCategory = AICategory.Lust
	
func getVisibleName():
	return "Horny drug"
	
func getVisibleDesc():
	return "Shouldn't see this"
	
func _doAttack(_attacker, _receiver):
	if(checkMissed(_attacker, _receiver, DamageType.Lust)):
		return genericMissMessage(_attacker, _receiver)
	
	if(checkDodged(_attacker, _receiver, DamageType.Lust)):
		return genericDodgeMessage(_attacker, _receiver)
	
	var text = "{attacker.name} manages to stick a syringe into your neck! You feel so warm, your crotch is burning, you can’t stop touching yourself in front of {attacker.name}, you really need to have sex!"
	var _damage = doDamage(_attacker, _receiver, DamageType.Lust, 20)
	text += " " + receiverDamageMessage(DamageType.Lust, _damage)
	return text
	
func _canUse(_attacker, _receiver):
	return true

func getAnticipationText(_attacker, _receiver):
	return "{attacker.name} grabs a syringe with a pink-colored drug inside off {attacker.his} belt and pounces at you."
