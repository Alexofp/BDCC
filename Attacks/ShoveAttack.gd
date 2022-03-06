extends Attack

func _init():
	id = "shoveattack"
	category = Category.Physical
	aiCategory = AICategory.Defensive
	
func getVisibleName():
	return "Shove"
	
func getVisibleDesc():
	return "An attempt to shove the enemy away for 5 damage. 30% chance to miss. Will cause the opponent to collapse"
	
func _doAttack(_attacker, _reciever):
	var attackerName = _attacker.getName()
	var recieverName = _reciever.getName()
	
	var chanceToHit = _attacker.getAttackAccuracy(DamageType.Physical) * 0.7
	chanceToHit = max(chanceToHit, 0.5)
	#var dodgeChance = _reciever.getDodgeChance(DamageType.Physical)
	
	if(!RNG.chance(100.0 * chanceToHit)):
		return attackerName + " tries to shove " + recieverName + " but fails"
	
	if(checkDodged(_attacker, _reciever, DamageType.Physical)):
		return attackerName + " tries to shove " + recieverName + " away but " + recieverName + " dodges the weak attempt with ease"
	
	var damage = doDamage(_attacker, _reciever, DamageType.Physical, 5)
	#_reciever.addEffect(StatusEffect.Bleeding)
	#_reciever.addEffect(StatusEffect.Collapsed)
	
	var texts = [
		attackerName + " shoves " + recieverName + " away and does "+str(damage)+" damage!"
	]
	var text = RNG.pick(texts)
	if(!_reciever.hasEffect(StatusEffect.Collapsed)):
		text += "\n"+recieverName+" loses "+_reciever.hisHer()+" balance and collapses onto the floor"
		_reciever.addEffect(StatusEffect.Collapsed)
	
	return text
	
func _canUse(_attacker, _reciever):
	return true

func getRequirements():
	return []

func getAnticipationText(_attacker, _reciever):
	return _attacker.getName() + " frees "+_attacker.hisHer()+" arms and tries to shove you"

func getAIScore(_attacker, _reciever):
	if(_reciever.hasEffect(StatusEffect.Collapsed)):
		return 0
	return .getAIScore(_attacker, _reciever) * 0.25

func getAttackAnimation():
	return TheStage.Shove
