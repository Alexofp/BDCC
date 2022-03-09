extends Attack

func _init():
	id = "youslutattack"
	category = Category.Humiliation
	aiCategory = AICategory.Lust
	
func getVisibleName():
	return "You're a slut"
	
func getVisibleDesc():
	return "An attempt to humiliate the opponent. This will be effective depending on how much they enjoy this"
	
func _doAttack(_attacker, _reciever):
	var attackerName = _attacker.getName()
	var recieverName = _reciever.getName()
	
	var texts = [
		attackerName + " giggles and teases " + recieverName +" saying "+_attacker.formatSay("You're such a slut~"),
		attackerName + " smiles watching " + recieverName +" and says  "+_attacker.formatSay("What a slut~"),
	]
	var text = RNG.pick(texts)
	
	var damageMult = _reciever.reactHumiliation(Attack.LustTopic.humYouSlut)
	
	text += "\n\n"
	
	var _damage = doDamage(_attacker, _reciever, DamageType.Lust, damageMult * 10)
	
	text += _reciever.lustDamageReaction(_damage, _attacker)
	
	text += "\n"+recieverDamageMessage(DamageType.Lust, _damage)
	
	return text
