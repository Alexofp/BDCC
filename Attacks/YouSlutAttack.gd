extends Attack

func _init():
	id = "youslutattack"
	category = Category.Humiliation
	aiCategory = AICategory.Lust
	
func getVisibleName():
	return "You're a slut"
	
func getVisibleDesc():
	return "You tell em"
	
func _doAttack(_attacker, _reciever):
	var attackerName = _attacker.getName()
	var recieverName = _reciever.getName()
	
	var text = attackerName + " giggles and says 'You're a slut'"
	
	var damageMult = _reciever.reactHumiliation(Attack.LustTopic.humYouSlut)
	
	text += "\n\n"
	
	var _damage = doDamage(_attacker, _reciever, DamageType.Lust, damageMult * 10)
	
	text += _reciever.lustDamageReaction(_damage, _attacker)
	
	text += "\n"+recieverName+" got " + str(_damage) + " lust damage"
	
	return text
