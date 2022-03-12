extends Attack

func _init():
	id = "TeaseBodyPCAttack"
	category = Category.Lust
	aiCategory = AICategory.Lust
	
func getVisibleName():
	return "Tease body"
	
func getVisibleDesc():
	return "Your basic tease. Effect depends on how sexual the opponent finds you. Might not be as effective if repeated a lot"
	
func _doAttack(_attacker, _reciever):
	var attackerName = _attacker.getName()
	var recieverName = _reciever.getName()
	
	var texts = [
		attackerName + " runs "+_attacker.hisHer()+" hand over " + recieverName +"'s cheek and offers some scritches",
		attackerName + " wiggles "+_attacker.hisHer()+" rear and gives it a good spank",
		attackerName + " rubs "+_attacker.hisHer()+" rear in front of "+recieverName+" and sticks "+_attacker.hisHer()+" tongue out",
		attackerName + " does a little sexy dance, shaking "+_attacker.hisHer()+" ass",
	]
	var text = RNG.pick(texts)
	
	var lustInterests: LustInterests = _reciever.getLustInterests()
	var teaseData = lustInterests.receiveTease(_attacker, TeaseType.Body)
	var damageMult = teaseData["value"]
	var learned = teaseData["learned"]
	
	text += "\n\n"
	
	var _damage = doDamage(_attacker, _reciever, DamageType.Lust, damageMult * 10)
	
	text += _reciever.lustDamageReaction(_damage, _attacker)
	
	text += "\n"+recieverDamageMessage(DamageType.Lust, _damage)
	
	if(learned.size() > 0):
		text += "\n[i]You learned more about what "+recieverName+" likes[/i]"
	
	return text
	
func _canUse(_attacker, _reciever):
	return true
