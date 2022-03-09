extends Attack

func _init():
	id = "biteattack"
	category = Category.Physical
	aiCategory = AICategory.Offensive
	
func getVisibleName():
	return "Bite"
	
func getVisibleDesc():
	return "60% chance to do "+scaledDmgRangeStr(DamageType.Physical, 15, 20)+" damage and cause bleeding. Can't miss if the opponent is on the ground"
	
func _doAttack(_attacker, _reciever):
	var attackerName = _attacker.getName()
	var recieverName = _reciever.getName()
	
	if(checkMissed(_attacker, _reciever, DamageType.Physical, 0.6)):
		return attackerName + " growls and tries to bite " + recieverName + " but misses completely"
	
	if(checkDodged(_attacker, _reciever, DamageType.Physical)):
		return attackerName + " pounces at the opponent trying to sink " + _attacker.hisHer() +" fangs into " + recieverName + " but "+_reciever.heShe()+" notices this and gets out of the way swiftly"
	
	var damage = 0
	damage = doDamage(_attacker, _reciever, DamageType.Physical, RNG.randi_range(15, 20))
	
	
	#var text = attackerName + " bites " + recieverName + " and does "+str(damage)+" damage"
	var texts = [
		attackerName + " bites "+recieverName,
		attackerName + " pounces at "+recieverName+" and bites "+_reciever.hisHer()+" neck "
	]
	var text = RNG.pick(texts)
	
	if(!_reciever.hasEffect(StatusEffect.Bleeding)):
		text += " causing "+_reciever.himHer() + " to start [color=red]bleeding[/color]"
		_reciever.addEffect(StatusEffect.Bleeding)
	
	text += "\n"+recieverDamageMessage(DamageType.Physical, damage)
	
	return text
	
func _canUse(_attacker, _reciever):
	return true

func getRequirements():
	return [["freemouth"]]

func getAnticipationText(_attacker, _reciever):
	return _attacker.getName() + " bares "+_attacker.hisHer()+" fangs and then suddenly ludges at you!"

func getAttackAnimation():
	return TheStage.Bite

func getExperience():
	return [[Skill.Fighting, 10]]
