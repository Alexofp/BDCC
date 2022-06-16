extends Attack

func _init():
	id = "strongkickattack"
	category = Category.Special
	aiCategory = AICategory.Offensive
	
func getVisibleName():
	return "Strong kick"
	
func getVisibleDesc():
	return "Sacrifice 25 stamina to do a very powerful kick doing "+scaledDmgStr(DamageType.Physical, 20)+" damage and knocking the opponent"
	
func _doAttack(_attacker, _receiver):
	var attackerName = _attacker.getName()
	var receiverName = _receiver.getName()
	
	var damage = doDamage(_attacker, _receiver, DamageType.Physical, RNG.randi_range(20, 20))
	
	var text = attackerName + " uses "+_attacker.hisHer()+" full strength to kick " + receiverName + ". "
	
	text += receiverDamageMessage(DamageType.Physical, damage)
	
	if(!_receiver.hasEffect(StatusEffect.Collapsed)):
		text += "\n[b]"+receiverName+" loses "+_receiver.hisHer()+" balance and collapses onto the floor[/b]"
		_receiver.addEffect(StatusEffect.Collapsed)
	
	return text
	
func _canUse(_attacker, _receiver):
	return true

func getRequirements():
	return [["stamina", 25], ["freelegs"]]

func getAttackAnimation():
	return TheStage.Kick

func getAttackSoloAnimation():
	return "kick"

func getExperience():
	return [[Skill.Combat, 20]]
