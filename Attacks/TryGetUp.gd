extends Attack

func _init():
	id = "trygetupattack"
	category = Category.Physical
	
func getVisibleName():
	return "Try to get up"
	
func getVisibleDesc():
	return "You shouldn't see this"
	
func _doAttack(_attacker, _receiver):
	var attackerName = _attacker.getName()
	#var receiverName = _receiver.getName()
	
	var success = false
	if(RNG.chance(70) || _attacker.hasPerk(Perk.CombatBetterGetUp)):
		_attacker.removeEffect(StatusEffect.Collapsed)
		success = true
	
	var text
	if(success):
		text = attackerName + " wastes "+_attacker.hisHer()+" turn but [b]"+_attacker.heShe()+" manages to get up[/b]"
	else:
		text = attackerName + " tries to get up [b]but fails to do so[/b] in time"
	
	return text
	
func _canUse(_attacker, _receiver):
	return _attacker.hasEffect(StatusEffect.Collapsed) && _attacker.canStandUpCombat()

func canBeDodgedByPlayer(_attacker, _receiver):
	return false

func getAIScore(_attacker, _receiver):
	if(_attacker.hasEffect(StatusEffect.Collapsed)):
		return 5.0
	return 0.0
