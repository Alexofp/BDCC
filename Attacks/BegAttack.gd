extends Attack

func _init():
	id = "begattack"
	category = Category.SelfHumiliation
	aiCategory = AICategory.Lust
	
func getVisibleName():
	return "Beg to be used"
	
func getVisibleDesc():
	return "You beg the enemy"
	
func _doAttack(_attacker, _reciever):
	var attackerName = _attacker.getName()
	var recieverName = _reciever.getName()
	
	var text = attackerName + " gets on their knees and begs 'please use me'"
	
	var damageMult = _reciever.reactSelfHumiliation(Attack.LustTopic.selfUseMe)
	
	text += "\n\n"
	
	var _damage = doDamage(_attacker, _reciever, DamageType.Lust, damageMult * 10)
	
	text += _reciever.lustDamageReaction(_damage, _attacker)
	
	text += "\n"+recieverName+" got " + str(_damage) + " lust damage"
	
	return text
	
func _canUse(_attacker, _reciever):
	return true
