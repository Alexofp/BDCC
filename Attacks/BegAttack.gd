extends Attack

func _init():
	id = "begattack"
	category = Category.SelfHumiliation
	aiCategory = AICategory.Lust
	
func getVisibleName():
	return "Beg to be used"
	
func getVisibleDesc():
	return "You beg the enemy. This will be effective depending on if the enemy enjoys this"
	
func _doAttack(_attacker, _reciever):
	var attackerName = _attacker.getName()
	var recieverName = _reciever.getName()
	
	var texts = [
		attackerName + " gets on "+_attacker.hisHer()+" knees and begs "+_attacker.formatSay("Please use me"),
		attackerName + " bends over for "+ recieverName + " and spanks " +_attacker.hisHer()+" ass " +_attacker.formatSay("Please, I want you to fuck me")
	]
	var text = RNG.pick(texts)
	
	var damageMult = _reciever.reactSelfHumiliation(Attack.LustTopic.selfUseMe)
	
	text += "\n\n"
	
	var _damage = doDamage(_attacker, _reciever, DamageType.Lust, damageMult * 10)
	
	text += _reciever.lustDamageReaction(_damage, _attacker)
	
	text += "\n"+recieverDamageMessage(DamageType.Lust, _damage)
	
	return text
	
func _canUse(_attacker, _reciever):
	return true
