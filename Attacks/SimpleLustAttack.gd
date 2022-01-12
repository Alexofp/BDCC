extends Attack

func _init():
	id = "simplelustattack"
	category = Category.Lust
	aiCategory = AICategory.Lust
	
func getVisibleName():
	return "Tease"
	
func getVisibleDesc():
	return "You tease the enemy I dunno"
	
func _doAttack(_attacker, _reciever):
	var attackerName = _attacker.getName()
	var recieverName = _reciever.getName()
	
	var text = attackerName + " teases " + recieverName
	
	var damageMult = _reciever.reactTease()
	
	text += "\n\n"
	
	var _damage = doDamage(_attacker, _reciever, DamageType.Lust, damageMult * 10)
	
	text += _reciever.lustDamageReaction(_damage, _attacker)
	
	text += "\n"+recieverName+" got " + str(_damage) + " lust damage"
	
	return text
	
func _canUse(_attacker, _reciever):
	return true
