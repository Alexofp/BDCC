extends Attack

func _init():
	id = "shoveattack"
	category = Category.Physical
	aiCategory = AICategory.Offensive
	aiScoreMultiplier = 0.5
	
func getVisibleName():
	return "Shove"
	
func getVisibleDesc():
	return "An attempt to shove the enemy away for "+scaledDmgStr(DamageType.Physical, 5)+" damage. 30% chance to miss. Will cause the opponent to collapse"
	
func _doAttack(_attacker, _receiver):
	var attackerName = _attacker.getName()
	var receiverName = _receiver.getName()
	
	if(checkMissed(_attacker, _receiver, DamageType.Physical, 0.7, 0.5)):
		return attackerName + " tries to shove " + receiverName + " but fails"
	
	if(checkDodged(_attacker, _receiver, DamageType.Physical)):
		return attackerName + " tries to shove " + receiverName + " away but " + receiverName + " dodges the weak attempt with ease"
	
	var damage = doDamage(_attacker, _receiver, DamageType.Physical, 5)
	#_receiver.addEffect(StatusEffect.Bleeding)
	#_receiver.addEffect(StatusEffect.Collapsed)
	
	var texts = [
		attackerName + " shoves " + receiverName + " away. "
	]
	var text = RNG.pick(texts)
	text += receiverDamageMessage(DamageType.Physical, damage)
	
	if(!_receiver.hasEffect(StatusEffect.Collapsed)):
		text += "\n[b]"+receiverName+" loses "+_receiver.hisHer()+" balance and collapses onto the floor[/b]"
		_receiver.addEffect(StatusEffect.Collapsed)
	
	return text
	
func _canUse(_attacker, _receiver):
	return true

func getRequirements():
	return []

func getAnticipationText(_attacker, _receiver):
	return _attacker.getName() + " frees "+_attacker.hisHer()+" arms and tries to shove you"

func getAIScore(_attacker, _receiver):
	if(_receiver.hasEffect(StatusEffect.Collapsed)):
		return 0
	return .getAIScore(_attacker, _receiver)

func getAttackAnimation():
	return TheStage.Shove

func getExperience():
	return [[Skill.Combat, 5]]
