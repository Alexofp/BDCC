extends Attack

func _init():
	id = "strongkickattack"
	category = Category.Special
	aiCategory = AICategory.Offensive
	
func getVisibleName():
	return "Strong kick"
	
func getVisibleDesc():
	return "Sacrifice 25 stamina to do a very powerful kick doing 20 damage and knocking the opponent"
	
func _doAttack(_attacker, _reciever):
	var attackerName = _attacker.getName()
	var recieverName = _reciever.getName()
	
	var damage = doDamage(_attacker, _reciever, DamageType.Physical, RNG.randi_range(20, 20))
	
	var text = attackerName + " uses "+_attacker.hisHer()+" full strength to kick " + recieverName + " and manages to do "+str(damage)+" damage!"
	if(!_reciever.hasEffect(StatusEffect.Collapsed)):
		text += "\n"+recieverName+" loses "+_reciever.hisHer()+" balance and collapses onto the floor"
		_reciever.addEffect(StatusEffect.Collapsed)
	
	return text
	
func _canUse(_attacker, _reciever):
	return true

func getRequirements():
	return [["stamina", 25], ["freelegs"]]
