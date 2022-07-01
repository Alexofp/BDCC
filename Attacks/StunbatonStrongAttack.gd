extends Attack

func _init():
	id = "stunbatonStrongAttack"
	category = Category.Physical
	aiCategory = AICategory.Offensive
	
func getVisibleName(_context = {}):
	return "Use the stunbaton"
	
func getVisibleDesc(_context = {}):
	return "You shouldn't see this"
	
func _doAttack(_attacker, _receiver, _context = {}):
	var attackerName = _attacker.getName()
	var receiverName = _receiver.getName()
	
	if(checkMissed(_attacker, _receiver, DamageType.Physical)):
		return attackerName + " swings "+_attacker.hisHer()+" stunbaton but misses"
	
	if(checkDodged(_attacker, _receiver, DamageType.Physical)):
		return attackerName + " swings "+_attacker.hisHer()+" stunbaton but " + receiverName + " dodges the attack at the last second"
	
	var damage = doDamage(_attacker, _receiver, DamageType.Physical, RNG.randi_range(40, 70))
	#_receiver.addEffect(StatusEffect.Bleeding)

	var texts = [
		attackerName + " manages to land a strong swing on " + receiverName + " sending an incredibly painful shock through "+_receiver.hisHer() +" body. "
	]
	var text = RNG.pick(texts)
	
	text += receiverDamageMessage(DamageType.Physical, damage)
	
	return text
	
func _canUse(_attacker, _receiver, _context = {}):
	return true

func getAnticipationText(_attacker, _receiver):
	return _attacker.getName() + " turns on "+_attacker.hisHer()+" stunbaton to it's maximum setting, causing it to spark and make an electrical noise. "+_attacker.heShe()+" then starts walking towards you"
