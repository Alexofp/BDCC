extends Attack

func _init():
	id = "youslutattack"
	category = Category.Humiliation
	
func getVisibleName():
	return "You're a slut"
	
func getVisibleDesc():
	return "You tell em"
	
func _doAttack(_attacker, _reciever):
	var attackerName = _attacker.getName()
	var recieverName = _reciever.getName()
	
	var text = attackerName + " giggles and says 'You're a slut'"
	
	var result = _reciever.reactHumiliation(Attack.LustTopic.humYouSlut)
	
	text += "\n\n"
	
	text += result[0]
	
	var _damage = doDamage(_attacker, _reciever, DamageType.Lust, result[1])
	
	text += "\n"+recieverName+" got " + str(_damage) + " lust damage"
	
	return text
