extends Attack

func _init():
	id = "begattack"
	category = Category.SelfHumiliation
	
func getVisibleName():
	return "Beg to be used"
	
func getVisibleDesc():
	return "You beg the enemy"
	
func _doAttack(_attacker, _reciever):
	var attackerName = _attacker.getName()
	var recieverName = _reciever.getName()
	
	var text = attackerName + " gets on their knees and begs 'please use me'"
	
	var result = _reciever.reactSelfHumiliation(Attack.LustTopic.selfUseMe)
	
	text += "\n\n"
	
	text += result[0]
	
	var _damage = doDamage(_attacker, _reciever, DamageType.Lust, result[1])
	
	text += "\n"+recieverName+" got " + str(_damage) + " lust damage"
	
	return text
	
func _canUse(_attacker, _reciever):
	return true
