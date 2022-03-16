extends Attack

func _init():
	id = "TeaseBodyPCAttack"
	category = Category.Lust
	aiCategory = AICategory.Lust
	
func getVisibleName():
	return "Tease body"
	
func getVisibleDesc():
	return "Teasing that's based on showing off the curves of your body and your chest. Effect depends on how sexy the opponent finds you"
	
func _doAttack(_attacker, _reciever):
	#var attackerName = _attacker.getName()
	var recieverName = _reciever.getName()
	
	var text = getTeaseText(_attacker, _reciever)
	
	var maxUnlocks = 1
	if(_attacker.hasPerk(Perk.SexBetterTease)):
		maxUnlocks = 2
	
	var lustInterests: LustInterests = _reciever.getLustInterests()
	var teaseData = lustInterests.receiveTease(_attacker, getTeaseType(), maxUnlocks)
	var damageMult = teaseData["value"]
	var learned = teaseData["learned"]
	var alreadyKnownTopics = teaseData["alreadyKnownTopics"]
	
	var powNumber = 0.5
	if(damageMult > 0):
		damageMult = pow(damageMult, powNumber)
	if(damageMult < 0):
		damageMult = -pow(-damageMult, powNumber)
	
	damageMult += alreadyKnownTopics / 10.0
	
	text += "\n\n"
	
	var _damage = doDamage(_attacker, _reciever, DamageType.Lust, damageMult * 10)
	
	text += _reciever.lustDamageReaction(_damage, _attacker)
	
	text += "\n"+recieverDamageMessage(DamageType.Lust, _damage)
	
	if(learned.size() > 0):
		text += "\n[i]You learned more about what "+recieverName+" likes[/i]"
	
	return text
	
func _canUse(_attacker, _reciever):
	return true

func getTeaseType():
	return TeaseType.Body

func getTeaseText(_attacker, _reciever):
	var texts = [
		"{attacker.name} caresses {attacker.his} body in front of {reciever.name}",
	]
	var text = RNG.pick(texts)
	return text
