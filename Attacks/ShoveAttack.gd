extends Attack

func _init():
	id = "shoveattack"
	category = Category.Physical
	aiCategory = AICategory.Defensive
	
func getVisibleName():
	return "Shove"
	
func getVisibleDesc():
	return "An attempt to shove the enemy away for "+scaledDmgStr(DamageType.Physical, 5)+" damage. 30% chance to miss. Will cause the opponent to collapse"
	
func _doAttack(_attacker, _reciever):
	var attackerName = _attacker.getName()
	var recieverName = _reciever.getName()
	
	if(checkMissed(_attacker, _reciever, DamageType.Physical, 0.7, 0.5)):
		return attackerName + " tries to shove " + recieverName + " but fails"
	
	if(checkDodged(_attacker, _reciever, DamageType.Physical)):
		return attackerName + " tries to shove " + recieverName + " away but " + recieverName + " dodges the weak attempt with ease"
	
	var damage = doDamage(_attacker, _reciever, DamageType.Physical, 5)
	#_reciever.addEffect(StatusEffect.Bleeding)
	#_reciever.addEffect(StatusEffect.Collapsed)
	
	var texts = [
		attackerName + " shoves " + recieverName + " away. "
	]
	var text = RNG.pick(texts)
	text += recieverDamageMessage(DamageType.Physical, damage)
	
	if(!_reciever.hasEffect(StatusEffect.Collapsed)):
		text += "\n[b]"+recieverName+" loses "+_reciever.hisHer()+" balance and collapses onto the floor[/b]"
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

func getExperience():
	return [[Skill.Fighting, 5]]
