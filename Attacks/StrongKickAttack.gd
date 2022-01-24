extends Attack

func _init():
	id = "strongkickattack"
	category = Category.Special
	aiCategory = AICategory.Offensive
	
func getVisibleName():
	return "Strong kick"
	
func getVisibleDesc():
	return "Kick them"
	
func _doAttack(_attacker, _reciever):
	var attackerName = _attacker.getName()
	var recieverName = _reciever.getName()
	
	var damage = doDamage(_attacker, _reciever, DamageType.Physical, RNG.randi_range(20, 20))
	_reciever.addEffect(StatusEffect.Collapsed)
	
	var text = attackerName + " kicks " + recieverName + " and does "+str(damage)+" damage!"
	
	return text
	
func _canUse(_attacker, _reciever):
	return true

func getRequirements():
	return [["stamina", 40], ["freelegs"]]
