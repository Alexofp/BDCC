extends Attack

func _init():
	id = "stunbatonStrongAttack"
	category = Category.Physical
	aiCategory = AICategory.Offensive
	
func getVisibleName():
	return "Use the stunbaton"
	
func getVisibleDesc():
	return "You shouldn't see this"
	
func _doAttack(_attacker, _reciever):
	var attackerName = _attacker.getName()
	var recieverName = _reciever.getName()
	
	if(checkMissed(_attacker, _reciever, DamageType.Physical)):
		return attackerName + " swings "+_attacker.hisHer()+" stunbaton but misses"
	
	if(checkDodged(_attacker, _reciever, DamageType.Physical)):
		return attackerName + " swings "+_attacker.hisHer()+" stunbaton but " + recieverName + " dodges the attack at the last second"
	
	var damage = doDamage(_attacker, _reciever, DamageType.Physical, RNG.randi_range(40, 70))
	#_reciever.addEffect(StatusEffect.Bleeding)

	var texts = [
		attackerName + " manages to land a strong swing on " + recieverName + " sending an incredibly painful shock through "+_reciever.hisHer() +" body and doing "+str(damage)+" damage!"
	]
	var text = RNG.pick(texts)
	
	return text
	
func _canUse(_attacker, _reciever):
	return true

func getAnticipationText(_attacker, _reciever):
	return _attacker.getName() + " turns on "+_attacker.hisHer()+" stunbaton to it's maximum setting, causing it to spark and make an electrical noise. "+_attacker.heShe()+" then starts walking towards you"
