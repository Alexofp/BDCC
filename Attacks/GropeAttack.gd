extends Attack

func _init():
	id = "gropeattack"
	category = Category.Lust
	aiCategory = AICategory.Lust
	
func getVisibleName():
	return "Grope"
	
func getVisibleDesc():
	return "You try to grope the enemy. Armor and their current lust level will heavily affect the outcome"
	
func _doAttack(_attacker, _reciever):
	var attackerName = _attacker.getName()
	var recieverName = _reciever.getName()
	
	var texts = [
		attackerName + " gets close and personal to grope " + recieverName +"'s butt",
		attackerName + " sneaks up to " + recieverName +" and gropes "+_reciever.herHis()+" body",
	]
	var text = RNG.pick(texts)
	
	var damageMult = _reciever.reactGrope()
	
	text += "\n\n"
	
	var _damage = doDamage(_attacker, _reciever, DamageType.Lust, damageMult * 20)
	
	text += _reciever.lustDamageReaction(_damage, _attacker)
	
	text += "\n"+recieverDamageMessage(DamageType.Lust, _damage)
	
	return text
	
func _canUse(_attacker, _reciever):
	return true
