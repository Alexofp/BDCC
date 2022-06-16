extends Attack

func _init():
	id = "BitePCAttack"
	category = Category.Physical
	aiCategory = AICategory.Offensive
	
func getVisibleName():
	return "Bite"
	
func getVisibleDesc():
	return "60% chance to do "+scaledDmgRangeStr(DamageType.Physical, 15, 20)+" damage and cause bleeding.\n\nCan't miss if the opponent is on the ground.\n\nVery weak against armored opponents"
	
func _doAttack(_attacker, _receiver):
	var attackerName = _attacker.getName()
	var receiverName = _receiver.getName()
	
	if(checkMissed(_attacker, _receiver, DamageType.Physical, 0.6)):
		return attackerName + " growls and tries to bite " + receiverName + " but misses completely"
	
	if(checkDodged(_attacker, _receiver, DamageType.Physical)):
		return attackerName + " pounces at the opponent trying to sink " + _attacker.hisHer() +" fangs into " + receiverName + " but "+_receiver.heShe()+" notices this and gets out of the way swiftly"
	
	var damage = 0
	damage = doDamage(_attacker, _receiver, DamageType.Physical, RNG.randi_range(15, 20))
	
	
	#var text = attackerName + " bites " + receiverName + " and does "+str(damage)+" damage"
	var texts = [
		attackerName + " bites "+receiverName,
		attackerName + " pounces at "+receiverName+" and bites "+_receiver.hisHer()+" neck "
	]
	var text = RNG.pick(texts)
	
	if(!_receiver.hasEffect(StatusEffect.Bleeding)):
		text += " causing "+_receiver.himHer() + " to start [color=red]bleeding[/color]"
		if(_attacker.hasPerk(Perk.SexBiter)):
			_receiver.addEffect(StatusEffect.Bleeding, [5])
		else:
			_receiver.addEffect(StatusEffect.Bleeding)
	
	text += "\n"+receiverDamageMessage(DamageType.Physical, damage)
	
	return text
	
func _canUse(_attacker, _receiver):
	return true

func getRequirements():
	return [["canbite"]]

func getAnticipationText(_attacker, _receiver):
	return _attacker.getName() + " bares "+_attacker.hisHer()+" fangs and then suddenly ludges at you!"

func getAttackAnimation():
	return TheStage.Bite

func getAttackSoloAnimation():
	return "bite"

func getExperience():
	return [[Skill.Combat, 10]]

func getRecieverArmorScaling(_damageType) -> float:
	if(GM.pc.hasPerk(Perk.SexBiter)):
		return 4.0
	
	return 10.0
